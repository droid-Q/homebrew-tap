class Istioctl < Formula
  desc "Istio configuration command-line utility"
  homepage "https://github.com/istio/istio"
  url "https://github.com/istio/istio/releases/download/#{version}/istioctl-#{version}-osx.tar.gz"
  version "1.6.2"
  sha256 "242c1999050c2df41e5e85525a10354247acf6562bace481c5d0eda11e66ac83"
  depends_on "docker" => :build
  depends_on "go" => :build
  def install
    bin.install "istioctl"
  end
  test do
    system "false"
  end
end