class BaidupcsGo < Formula
    desc "仿 Linux shell 文件处理命令的百度网盘命令行客户端"
    homepage "https://github.com/iikira/BaiduPCS-Go"
    version "3.6.1"
    url "https://github.com/iikira/BaiduPCS-Go/releases/download/v#{version}/BaiduPCS-Go-v#{version}-darwin-osx-amd64.zip"
    sha256 "bb5989cdeaeea721932eee97fbadc721c8c1500f0916157c619eac80f235ae35"

    def install
        bin.install "BaiduPCS-Go"
    end
end