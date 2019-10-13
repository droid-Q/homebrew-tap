class Aria2 < Formula
  desc "Download with resuming and segmented downloading"
  homepage "https://aria2.github.io/"
  url "https://github.com/aria2/aria2/releases/download/release-1.35.0/aria2-1.35.0.tar.xz"
  sha256 "1e2b7fd08d6af228856e51c07173cfcf987528f1ac97e04c5af4a47642617dfd"
  patch do
	  url "https://raw.githubusercontent.com/droid-Q/aria2-patch/master/myaria2.patch"
	  sha256 "ac30ddd38383775ce69f0558b24ba9b12db4c8ef2f9e9a9f22c6d6d8bdd78b6c"
  end
  bottle do
    cellar :any
    sha256 "9cc5e04be8b0a58d1f2b60b8abfc636168edbf23e7018003c40f1dd6952aab0c" => :catalina
    sha256 "761836ac608eb0a59d4a6f6065860c0e809ce454692e0937d9d0d89ad47f3ce4" => :mojave
    sha256 "70cc7566a23c283015368f92dfeaa0d119e53cfc7c1b2276a73ff9f6167b529d" => :high_sierra
  end
  
  depends_on "pkg-config" => :build
  depends_on "libssh2"

  def install
    ENV.cxx11

    args = %W[
      --disable-dependency-tracking
      --prefix=#{prefix}
      --with-appletls
      --with-libssh2
      --without-openssl
      --without-gnutls
      --without-libgmp
      --without-libnettle
      --without-libgcrypt
    ]

    system "./configure", *args
    system "make", "install"

    bash_completion.install "doc/bash_completion/aria2c"
  end

  test do
    system "#{bin}/aria2c", "https://brew.sh/"
    assert_predicate testpath/"index.html", :exist?, "Failed to create index.html!"
  end
end
