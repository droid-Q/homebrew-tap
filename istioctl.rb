class Istioctl < Formula
  desc "Istio configuration command-line utility"
  homepage "https://github.com/istio/istio"
  version "1.6.1"
  url "https://github.com/istio/istio/releases/download/#{version}/istioctl-#{version}-osx.tar.gz"
  sha256 "672df7d4a691a84ef1846026163ab400b650d7c0199e83d40c96e1eafe0f8b3a"
  depends_on "docker" => :build
  depends_on "go" => :build
  def install
    bin.install "istioctl"
  end
  test do
    system "false"
  end
end