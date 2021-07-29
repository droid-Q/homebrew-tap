class Arthas < Formula
  desc "Alibaba Java Diagnostic Tool Arthas/Alibaba Java诊断利器Arthas"
  homepage "https://alibaba.github.io/arthas/"
  url "https://github.com/alibaba/arthas.git",
      tag:      "arthas-all-3.5.3",
      revision: "dfecd76e31b5b6aa4814ef52ff9d5bc7cad9c5a0"
  license "Apache-2.0"
  head "https://github.com/alibaba/arthas"

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
