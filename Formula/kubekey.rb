class Kubekey < Formula
  desc "With KubeKey, you can install Kubernetes and KubeSphere separately or as a whole easily, efficiently and flexibly."
  homepage "https://github.com/kubesphere/kubekey/"
  url "https://github.com/kubesphere/kubekey/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "67ede3ff2ece82dd622a1ce1d30967ddf32417c68ce7a135254713769b747909"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    system "go", "build", "-ldflags",
            "-w -X main.VERSION=v#{version}",
            "-o", bin/"kk"
  end

  test do
    system bin/"kk", "config", "-e"
    assert_predicate testpath/"cluster.yml", :exist?
  end
end