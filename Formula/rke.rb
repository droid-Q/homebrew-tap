class Rke < Formula
  desc "Rancher Kubernetes Engine, a Kubernetes installer that works everywhere"
  homepage "https://rancher.com/docs/rke/latest/en/"
  url "https://github.com/rancher/rke/archive/v1.2.11.tar.gz"
  sha256 "000965cd009f882e25f218a1eb696dd0733d9e504e994f17ac490d4741a77d8e"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/droid-Q/homebrew-tap/releases/download/rke-1.2.10"
    sha256 cellar: :any_skip_relocation, big_sur:      "5b212affda9d09df833418125c265910f4323998a8854aa19a42816de17aa8a0"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8653730174d7b9c14edff32abf1502e981e8dfd5296801e904852233b18728cb"
  end

  depends_on "go" => :build

  def install
    system "go", "build", "-ldflags",
            "-w -X main.VERSION=v#{version}",
            "-o", bin/"rke"
  end

  test do
    system bin/"rke", "config", "-e"
    assert_predicate testpath/"cluster.yml", :exist?
  end
end
