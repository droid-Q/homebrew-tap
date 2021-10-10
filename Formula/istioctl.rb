class Istioctl < Formula
  desc "Istio configuration command-line utility"
  homepage "https://istio.io/"
  url "https://github.com/istio/istio.git",
      tag:      "1.11.3",
      revision: "6bda7c161d3925c48fbea3f297ffa52461893f3b"
  license "Apache-2.0"
  head "https://github.com/istio/istio.git"

  bottle do
    root_url "https://github.com/droid-Q/homebrew-tap/releases/download/istioctl-1.11.3"
    sha256 cellar: :any_skip_relocation, big_sur:      "a89486ede2bfc7434a82e3a3a20f85ee8256cfdcf1a3a6bbb641aa4c6f9f6afc"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "00b73a0ad521c36665ae71371571cdc8eb55e1cb7e92d7feb0065f017abfe31d"
  end

  depends_on "go" => :build
  depends_on "go-bindata" => :build

  def install
    # make parallelization should be fixed in version > 1.11.0
    ENV.deparallelize
    ENV["VERSION"] = version.to_s
    ENV["TAG"] = version.to_s
    ENV["ISTIO_VERSION"] = version.to_s
    ENV["HUB"] = "docker.io/istio"
    ENV["BUILD_WITH_CONTAINER"] = "0"

    dirpath = nil
    on_macos do
      if Hardware::CPU.arm?
        # Fix missing "amd64" for macOS ARM in istio/common/scripts/setup_env.sh
        # Can remove when upstream adds logic to detect `$(uname -m) == "arm64"`
        ENV["TARGET_ARCH"] = "arm64"

        dirpath = "darwin_arm64"
      else
        dirpath = "darwin_amd64"
      end
    end
    on_linux do
      dirpath = "linux_amd64"
    end

    system "make", "istioctl", "istioctl.completion"
    cd "out/#{dirpath}" do
      bin.install "istioctl"
      bash_completion.install "release/istioctl.bash"
      zsh_completion.install "release/_istioctl"
    end
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/istioctl version --remote=false").strip
  end
end
