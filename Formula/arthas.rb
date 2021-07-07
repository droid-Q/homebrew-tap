class Arthas < Formula
  desc "Alibaba Java Diagnostic Tool Arthas/Alibaba Java诊断利器Arthas"
  homepage "https://alibaba.github.io/arthas/"
  url "https://github.com/alibaba/arthas/releases/download/arthas-all-3.5.2/arthas-bin.zip"
  sha256 "2f87ad60b09d30b85e96d85a46ffb32a1e80af483ebf8da4e86d469285386a5b"

  depends_on "telnet"
  def install
    bin.install "as.sh" => "as"
  end

  test do
    system "true"
  end
end
