class Arthas < Formula
  desc "Alibaba Java Diagnostic Tool Arthas/Alibaba Java诊断利器Arthas"
  homepage "https://alibaba.github.io/arthas/"
  url "https://github.com/alibaba/arthas.git",
      tag:      "arthas-all-3.5.3",
      revision: "dfecd76e31b5b6aa4814ef52ff9d5bc7cad9c5a0"
  license "Apache-2.0"
  head "https://github.com/alibaba/arthas"

  bottle do
    root_url "https://github.com/droid-Q/homebrew-tap/releases/download/arthas-3.5.3"
    sha256 cellar: :any_skip_relocation, big_sur:      "527dd7f57f1c51793bc76a7f8b5d9f1ad303d4d2dbefd4b0bb29bfce7590f450"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "6f5d2fa24ed7a4d8e10a89f75a8b8ae8434842a46a9246d14bef15ae8bdd37e6"
  end

  depends_on "openjdk@8" => :build
  depends_on "maven" => :build

  def install
    ENV["JAVA_HOME"] = Formula["openjdk@8"].opt_prefix
    system "mvn", "clean", "package", "-DskipTests", "-P", "full"
    bin.install "bin/as.sh" => "arthas"
  end

  test do
    system "true"
  end
end
