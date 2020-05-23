class Arthas < Formula
  desc "Alibaba Java Diagnostic Tool Arthas/Alibaba Java诊断利器Arthas"
  homepage "https://alibaba.github.io/arthas/"
  version "3.2.0"
  url "https://github.com/alibaba/arthas/releases/download/arthas-all-#{version}/arthas-#{version}-bin.zip"
  sha256 "a74fce77215df251963a50f9b30d394d886e8a2b6f0f3b5070b563f0e3aa7eb1"

  def install
    bin.install "as.sh" => "as"
  end

  test do
    system "false"
  end
end
