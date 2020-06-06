class Istioctl < Formula
  desc "Istio configuration command-line utility"
  homepage "https://github.com/istio/istio"
  version "1.6.1"
  url "https://github.com/istio/istio/releases/download/#{version}/istioctl-#{version}-osx.tar.gz"
  sha256 "616cf30294a563b743833369c1435ae27244603d42c15818329f1ead25c0065a"
  depends_on "docker" => :build
  depends_on "go" => :build
  def install
    bin.install "istioctl"
  end
  test do
    system "false"
  end
end