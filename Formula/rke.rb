class Rke < Formula
  desc "Rancher Kubernetes Engine, a Kubernetes installer that works everywhere"
  homepage "https://rancher.com/docs/rke/latest/en/"
  url "https://github.com/rancher/rke/archive/v1.3.0.tar.gz"
  sha256 "4701ac241725df714b90261263be8358462e9481fd560401882e20a8e9856eff"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/droid-Q/homebrew-tap/releases/download/rke-1.2.11"
    sha256 cellar: :any_skip_relocation, big_sur:      "7dadbe0bf74256343411290adf9b484a2803c62168c250cc052e718cbb0352a2"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ae11a33e7013b8f1946f6f7ae93fc53db426f3a66ac896b5eb3dcbeb5b3136ea"
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
