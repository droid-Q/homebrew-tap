class Rke < Formula
  desc "Rancher Kubernetes Engine, a Kubernetes installer that works everywhere"
  homepage "https://rancher.com/docs/rke/latest/en/"
  url "https://github.com/rancher/rke/archive/v1.2.7.tar.gz"
  sha256 "b08a06523f8038d20a0704c94d23b9f56af577dd5a7325bbb478ca6057069b09"
  license "Apache-2.0"

  bottle do
    root_url "https://homebrew.bintray.com/bottles-tap"
    rebuild 1
    sha256 cellar: :any_skip_relocation, big_sur: "11584391bd69efcb4f1eb21c5060b4b83124a491b3719bb4e6785de63a189068"
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