class Arthas < Formula
  desc "Alibaba Java Diagnostic Tool Arthas/Alibaba Java诊断利器Arthas"
  homepage "https://alibaba.github.io/arthas/"
  url "https://github.com/alibaba/arthas.git",
      tag:      "arthas-all-3.5.5",
      revision: "fe09b57719a378f7b6a774dd2185101566ac26c6"
  license "Apache-2.0"
  head "https://github.com/alibaba/arthas"

  bottle do
    root_url "https://github.com/droid-Q/homebrew-tap/releases/download/arthas-3.5.5"
    sha256 cellar: :any_skip_relocation, big_sur:      "2678968f8a89777c26db6b954a1ff2b93bf4c5566b6133a2d1a9e4abfbeaa455"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "671920e19f34cd9850b979bceffbb86bfb08591e8329e25a79e99c65f6ae7db5"
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
