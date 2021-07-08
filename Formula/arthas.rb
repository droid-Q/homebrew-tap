class Arthas < Formula
  desc "Alibaba Java Diagnostic Tool Arthas/Alibaba Java诊断利器Arthas"
  homepage "https://alibaba.github.io/arthas/"
  url "https://github.com/alibaba/arthas/releases/download/arthas-all-3.5.2/arthas-bin.zip"
  sha256 "2f87ad60b09d30b85e96d85a46ffb32a1e80af483ebf8da4e86d469285386a5b"

  bottle do
    root_url "https://github.com/droid-Q/homebrew-tap/releases/download/arthas-3.5.2"
    rebuild 1
    sha256 cellar: :any_skip_relocation, catalina: "63f1f9acee56fb80fd059969c5df5a7d2f3740f8aed753f295955d4cf0903a3f"
  end

  depends_on "telnet"

  def install
    bin.install "as.sh" => "as"
  end

  test do
    system "true"
  end
end
