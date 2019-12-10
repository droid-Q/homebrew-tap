class BaidupcsGo < Formula
    desc "仿 Linux shell 文件处理命令的百度网盘命令行客户端"
    homepage "https://github.com/iikira/BaiduPCS-Go"
    version "3.6.1"
    url "https://github.com/iikira/BaiduPCS-Go/releases/download/v#{version}/BaiduPCS-Go-v#{version}-darwin-osx-amd64.zip"
    sha256 "2335895027b290a0ff9fd537652e4ae6427acc03450b6fda80f947e40ea042a8"

    def install
        bin.install "BaiduPCS-Go"
    end
end