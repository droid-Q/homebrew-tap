class Istioctl < Formula
  desc "Istio configuration command-line utility"
  homepage "https://github.com/istio/istio"
  version "1.6.0"
  url "https://github.com/istio/istio/releases/download/#{version}/istioctl-#{version}-osx.tar.gz"
  sha256 "83bf64e1d9c8ae12610e3f8d19a6f60067f3d826058c363d5cfdaadaae31f262"
  depends_on "docker" => :build
  depends_on "go" => :build
  def install
    bin.install "istioctl"
  end
  test do
    system "false"
  end
end