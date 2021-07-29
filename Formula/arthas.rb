class Arthas < Formula
  desc "Alibaba Java Diagnostic Tool Arthas/Alibaba Java诊断利器Arthas"
  homepage "https://alibaba.github.io/arthas/"
  url "https://github.com/alibaba/arthas.git",
      tag:      "arthas-all-3.5.3",
      revision: "dfecd76e31b5b6aa4814ef52ff9d5bc7cad9c5a0"
  license "Apache-2.0"
  head "https://github.com/alibaba/arthas"

  bottle do
    root_url "https://github.com/droid-Q/homebrew-tap/releases/download/arthas-3.5.2"
    rebuild 1
    sha256 cellar: :any_skip_relocation, catalina: "63f1f9acee56fb80fd059969c5df5a7d2f3740f8aed753f295955d4cf0903a3f"
  end

  depends_on "java" => :build
  depends_on "maven" => :build
  depends_on "telnet"

  def install
    system "mvn", "clean", "package", "-DskipTests", "-P", "full"
    bin.install "bin/as.sh" => "as"
  end

  test do
    system "true"
  end
end
