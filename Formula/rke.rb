class Rke < Formula
  desc "Rancher Kubernetes Engine, a Kubernetes installer that works everywhere"
  homepage "https://rancher.com/docs/rke/latest/en/"
  url "https://github.com/rancher/rke/archive/v1.3.1.tar.gz"
  sha256 "bdd8d79214544a4f2e262746b518b4f7f26352b94c63578fe1b582f6079b7462"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/droid-Q/homebrew-tap/releases/download/rke-1.3.0"
    sha256 cellar: :any_skip_relocation, big_sur:      "04a25584e45110de72d221e1721999f8458fa6b9fb677cae207b294c8903c856"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "3a0c2097626a8d2ff2b364b74a2c40955057c2c224e2c9858f548fcb7f52e91a"
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
