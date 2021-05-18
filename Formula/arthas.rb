class Arthas < Formula
  desc "Alibaba Java Diagnostic Tool Arthas/Alibaba Java诊断利器Arthas"
  homepage "https://alibaba.github.io/arthas/"
  url "https://github.com/alibaba/arthas/releases/download/arthas-all-3.5.1/arthas-bin.zip"
  sha256 "356bfb704fb47f709fd4b11ac4133a0f934842cd676d3ac7def1f3fd9071fc1a"

  depends_on "telnet"
  def install
    bin.install "as.sh" => "as"
  end

  test do
    system "true"
  end
end
