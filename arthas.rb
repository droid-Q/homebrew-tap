class Arthas < Formula
  desc "Alibaba Java Diagnostic Tool Arthas/Alibaba Java诊断利器Arthas"
  homepage "https://alibaba.github.io/arthas/"
  version "3.1.4"
  url "https://github.com/alibaba/arthas/releases/download/arthas-all-#{version}/arthas-#{version}-bin.zip"
  sha256 "5adf41f2b4577d09981ae32d79596dd237129f033a8240179997efb2f7514820"

  def install
    bin.install "as.sh" => "arthas"
  end

  test do
    system "false"
  end
end
