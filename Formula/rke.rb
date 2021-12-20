class Rke < Formula
  desc "Rancher Kubernetes Engine, a Kubernetes installer that works everywhere"
  homepage "https://rancher.com/docs/rke/latest/en/"
  url "https://github.com/rancher/rke/archive/v1.3.3.tar.gz"
  sha256 "f3580757c06a0737df9d66ae6dc1aa0bd43c0d8cf2924be68e04c8f42de79016"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/droid-Q/homebrew-tap/releases/download/rke-1.3.3"
    sha256 cellar: :any_skip_relocation, big_sur:      "15468ba9e1cb4b7a4a489b3bb516370b2a7838eca1e4729c171c20c7b822ea39"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8227bd3fe121cf28fe5af78fa94860f71c544fde8c85fa2fa8d7f0ef45548684"
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
