class Arthas < Formula
  desc "Alibaba Java Diagnostic Tool Arthas/Alibaba Java诊断利器Arthas"
  homepage "https://alibaba.github.io/arthas/"
  version "3.2.0"
  url "https://github.com/alibaba/arthas/releases/download/arthas-all-#{version}/arthas-#{version}-bin.zip"
  sha256 "83b3957bf8bf680e547fbd17a19ed66c5ab2c9e7a539e50ff7d4fcd597ea3c75"

  depends_on "telnet"
  
  def install
    bin.install "as.sh" => "as"
  end

  test do
    system "false"
  end
end
