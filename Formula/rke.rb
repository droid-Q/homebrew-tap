class Rke < Formula
  desc "Rancher Kubernetes Engine, a Kubernetes installer that works everywhere"
  homepage "https://rancher.com/docs/rke/latest/en/"
  url "https://github.com/rancher/rke/archive/v1.3.3.tar.gz"
  sha256 "f3580757c06a0737df9d66ae6dc1aa0bd43c0d8cf2924be68e04c8f42de79016"
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
