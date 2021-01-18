class Arthas < Formula
  desc "Alibaba Java Diagnostic Tool Arthas/Alibaba Java诊断利器Arthas"
  homepage "https://alibaba.github.io/arthas/"
  version "3.4.6"
  url "https://github.com/alibaba/arthas/releases/download/arthas-all-#{version}/arthas-bin.zip"
  sha256 "3d05b6f992177781a5d9cf8593c9b418a3f2803ee337611ecae47274703accad"

  depends_on "telnet"
  
  def install
    bin.install "as.sh" => "as"
  end

  test do
    system "false"
  end
end
