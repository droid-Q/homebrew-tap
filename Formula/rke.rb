class Rke < Formula
  desc "Rancher Kubernetes Engine, a Kubernetes installer that works everywhere"
  homepage "https://rancher.com/docs/rke/latest/en/"
  url "https://github.com/rancher/rke/archive/v1.2.7.tar.gz"
  sha256 "b08a06523f8038d20a0704c94d23b9f56af577dd5a7325bbb478ca6057069b09"
  license "Apache-2.0"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_big_sur: "98bf45da784fd5d5a04c260da59d9caaff0ec68834e71c0145d77098f9e37c87"
    sha256 cellar: :any_skip_relocation, big_sur:       "a68b93b323ce7be29ba12ab22c322da0885cc063a826d4ba0ad247adc2a7cffb"
    sha256 cellar: :any_skip_relocation, catalina:      "c0842837c7c28f08a3376ddabfcf0c4b6bb6cb6454fdba8a55039272aa096526"
    sha256 cellar: :any_skip_relocation, mojave:        "e1c7834dcf839f47022708081678009cd10c054db8e1802c0d32fb784a5a7e1b"
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
