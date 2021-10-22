class Aria2 < Formula
  desc "Download with resuming and segmented downloading"
  homepage "https://aria2.github.io/"
  url "https://github.com/aria2/aria2/releases/download/release-1.36.0/aria2-1.36.0.tar.xz"
  sha256 "58d1e7608c12404f0229a3d9a4953d0d00c18040504498b483305bcb3de907a5"
  license "GPL-2.0-or-later"
  # patch do
  #   url "https://raw.githubusercontent.com/droid-Q/aria2-patch/master/myaria2.patch"
  #   sha256 "ac30ddd38383775ce69f0558b24ba9b12db4c8ef2f9e9a9f22c6d6d8bdd78b6c"
  # end

  bottle do
    root_url "https://github.com/droid-Q/homebrew-tap/releases/download/aria2-1.36.0"
    sha256 cellar: :any, big_sur:      "ba6e2e2a0b566d97d75a62c5d8aaab30bb5d514f5155dd2d62666d5376a3a68f"
    sha256               x86_64_linux: "31458ccab030a4dd15f245adcb9babcd5ace357505e03cc4f2326049bdd3a7f5"
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
