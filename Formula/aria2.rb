class Aria2 < Formula
  desc "Download with resuming and segmented downloading"
  homepage "https://aria2.github.io/"
  url "https://github.com/aria2/aria2/releases/download/release-1.35.0/aria2-1.35.0.tar.xz"
  sha256 "1e2b7fd08d6af228856e51c07173cfcf987528f1ac97e04c5af4a47642617dfd"
  license "GPL-2.0-or-later"
  # patch do
  #   url "https://raw.githubusercontent.com/droid-Q/aria2-patch/master/myaria2.patch"
  #   sha256 "ac30ddd38383775ce69f0558b24ba9b12db4c8ef2f9e9a9f22c6d6d8bdd78b6c"
  # end

  bottle do
    root_url "https://github.com/droid-Q/homebrew-tap/releases/download/aria2-1.35.0"
    rebuild 1
    sha256 cellar: :any, catalina:     "eb9ad876ec5306f81fb1e642d93c990167f8d6d28d1a7d918d2171662b351439"
    sha256               x86_64_linux: "9d16d817e4420bb7c1f4d23dedc1482995f6ad81d4a284e313c704b3e0a60b72"
  end

  depends_on "pkg-config" => :build
  depends_on "libssh2"

  uses_from_macos "libxml2"
  uses_from_macos "zlib"

  on_linux do
    depends_on "openssl@1.1"
  end

  def install
    ENV.cxx11

    args = %W[
      --disable-dependency-tracking
      --prefix=#{prefix}
      --with-libssh2
      --without-gnutls
      --without-libgmp
      --without-libnettle
      --without-libgcrypt
    ]
    on_macos do
      args << "--with-appletls"
      args << "--without-openssl"
    end
    on_linux do
      args << "--without-appletls"
      args << "--with-openssl"
    end

    system "./configure", *args
    system "make", "install"

    bash_completion.install "doc/bash_completion/aria2c"
  end

  plist_options manual: "aria2c -h"

  def plist
    <<~EOS
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
      <dict>
        <key>Label</key>
        <string>#{plist_name}</string>
        <key>ProgramArguments</key>
        <array>
          <string>#{opt_bin}/aria2c</string>
        </array>
        <key>RunAtLoad</key><true/>
        <key>KeepAlive</key><true/>
      </dict>
      </plist>
    EOS
  end

  test do
    system "#{bin}/aria2c", "https://brew.sh/"
    assert_predicate testpath/"index.html", :exist?, "Failed to create index.html!"
  end
end
