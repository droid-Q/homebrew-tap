class Arthas < Formula
  desc "Alibaba Java Diagnostic Tool Arthas/Alibaba Java诊断利器Arthas"
  homepage "https://alibaba.github.io/arthas/"
  url "https://github.com/alibaba/arthas/releases/download/arthas-all-3.5.0/arthas-bin.zip"
  sha256 "3cf8459c41768bd537e1bedd247019b2091a3f3159dfd9ca98ca6ac5c5842084"

  depends_on "telnet"
  def install
    bin.install "as.sh" => "as"
  end

  test do
    system "true"
  end
end
