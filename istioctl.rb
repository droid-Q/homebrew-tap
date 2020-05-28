class Istioctl < Formula
  desc "Istio configuration command-line utility"
  homepage "https://github.com/istio/istio"
  version "1.6.0"
  url " https://github.com/istio/istio/releases/download/#{version}/istioctl-#{version}-osx.tar.gz"
  sha256 "83b3957bf8bf680e547fbd17a19ed66c5ab2c9e7a539e50ff7d4fcd597ea3c75"
  depends_on "docker" => :build
  depends_on "go" => :build
  def install
    bin.install "istioctl"
  end
  test do
    system "false"
  end
end
