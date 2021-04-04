class BaidupcsGo < Formula
  desc "仿 Linux shell 文件处理命令的百度网盘命令行客户端"
  homepage "https://github.com/iikira/BaiduPCS-Go"
  version "3.6.2"
  url "https://github.com/iikira/BaiduPCS-Go/releases/download/v#{version}/BaiduPCS-Go-v#{version}-darwin-osx-amd64.zip"
  sha256 "547ab39ab4f205c4323337a8e0c250ab6f51502a3812fb6bd5a32bf2b25b0f14"

  def install
    bin.install "BaiduPCS-Go"
  end
end
