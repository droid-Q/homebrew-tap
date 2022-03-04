class Arthas < Formula
  desc "Alibaba Java Diagnostic Tool Arthas/Alibaba Java诊断利器Arthas"
  homepage "https://alibaba.github.io/arthas/"
  url "https://github.com/alibaba/arthas.git",
      tag:      "arthas-all-3.5.6",
      revision: "931ce392fdc6bf675bbc3997917079c9ce3c9cb2"
  license "Apache-2.0"
  head "https://github.com/alibaba/arthas"

  bottle do
    root_url "https://github.com/droid-Q/homebrew-tap/releases/download/arthas-3.5.6"
    sha256 cellar: :any_skip_relocation, big_sur:      "66b9abbdb8293aebf5609ec941b6ba143027100681d71583d1e0cc3a2b0e0401"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e6a2f8c4a3a78c63629dc53a267132b76cb9609c3b9ad2d2aa09c2ffd93458d6"
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
