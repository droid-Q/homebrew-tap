class Istioctl < Formula
  desc "Istio configuration command-line utility"
  homepage "https://istio.io/"
  url "https://github.com/istio/istio.git",
      tag:      "1.10.3",
      revision: "61313778e0b785e401c696f5e92f47af069f96d0"
  license "Apache-2.0"
  head "https://github.com/istio/istio.git"

  bottle do
    root_url "https://github.com/droid-Q/homebrew-tap/releases/download/istioctl-1.10.3"
    sha256 cellar: :any_skip_relocation, big_sur:      "50e073e82923aa18d4243fc9a53dbbcbec9ccd36382cb0bb70c82dea23262e3f"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b477fe00fa8b614b4b67a230c4aac4c586fd646e2d6fdbbbe58661df335d5e1a"
  end

  depends_on "go" => :build
  depends_on "go-bindata" => :build

  def install
    ENV["VERSION"] = version.to_s
    ENV["TAG"] = version.to_s
    ENV["ISTIO_VERSION"] = version.to_s
    ENV["HUB"] = "docker.io/istio"
    ENV["BUILD_WITH_CONTAINER"] = "0"

    system "make", "gen-charts", "istioctl", "istioctl.completion"
    dirpath = nil
    on_macos do
      dirpath = "darwin_amd64"
    end
    on_linux do
      dirpath = "linux_amd64"
    end
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
