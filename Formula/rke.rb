class Rke < Formula
  desc "Rancher Kubernetes Engine, a Kubernetes installer that works everywhere"
  homepage "https://rancher.com/docs/rke/latest/en/"
  url "https://github.com/rancher/rke/archive/v1.3.1.tar.gz"
  sha256 "bdd8d79214544a4f2e262746b518b4f7f26352b94c63578fe1b582f6079b7462"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/droid-Q/homebrew-tap/releases/download/rke-1.3.1"
    sha256 cellar: :any_skip_relocation, big_sur:      "73cd7f1840db6aaf2de3e3770c877a5d5d86c16959452471fb0219d301e7b85e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "dbc353d8112528227cd509605ac5c9ebaca51fe800d7780ac17bec197d1433f7"
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
