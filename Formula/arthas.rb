class Arthas < Formula
  desc "Alibaba Java Diagnostic Tool Arthas/Alibaba Java诊断利器Arthas"
  homepage "https://alibaba.github.io/arthas/"
  url "https://github.com/alibaba/arthas.git",
      tag:      "arthas-all-3.5.5",
      revision: "fe09b57719a378f7b6a774dd2185101566ac26c6"
  license "Apache-2.0"
  head "https://github.com/alibaba/arthas"

  bottle do
    root_url "https://github.com/droid-Q/homebrew-tap/releases/download/arthas-3.5.4"
    sha256 cellar: :any_skip_relocation, big_sur:      "0ac332b1591d0e338df55771d81023b076d85ae5952721a8823bc6da85554746"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a1ef8f4f4065fd0cbc0d5b82a0c1bf71fdb5da83c455a4330a9b7157db60d7cf"
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
