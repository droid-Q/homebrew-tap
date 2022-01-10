class Rke < Formula
  desc "Rancher Kubernetes Engine, a Kubernetes installer that works everywhere"
  homepage "https://rancher.com/docs/rke/latest/en/"
  url "https://github.com/rancher/rke/archive/v1.3.4.tar.gz"
  sha256 "97d56fb2e0e8b221c36ab66559a84bd2a9af11f9b8d69c959bd9c9b9e57311af"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/droid-Q/homebrew-tap/releases/download/rke-1.3.4"
    sha256 cellar: :any_skip_relocation, big_sur:      "80f9901b33733bf1c5a45117d998fdd61122789ce3734c07475b33571410595e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "623e71389e6974c845f18e8717e55e8590fa8f9db2be3c72219025639ac1edb2"
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
