class Rke < Formula
  desc "Rancher Kubernetes Engine, a Kubernetes installer that works everywhere"
  homepage "https://rancher.com/docs/rke/latest/en/"
  url "https://github.com/rancher/rke/archive/v1.3.2.tar.gz"
  sha256 "532fb0751eb7ca9cf855e49e433d63fb760bdf8e131af3440744e792338f706c"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/droid-Q/homebrew-tap/releases/download/rke-1.3.2"
    sha256 cellar: :any_skip_relocation, big_sur:      "4be055e6a9daa99c32f7cc70a897800181e2c529810cccf353d9df6139ccc2af"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d7aef1d12f5e737c45f08f74b5263dab972daef7412e1ad1540d8329a88e2052"
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
