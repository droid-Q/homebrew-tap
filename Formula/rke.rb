class Rke < Formula
  desc "Rancher Kubernetes Engine, a Kubernetes installer that works everywhere"
  homepage "https://rancher.com/docs/rke/latest/en/"
  url "https://github.com/rancher/rke/archive/v1.2.9.tar.gz" 
  sha256 "958f1be715be516bc782896d6d77b0665054ec6545f94d1b423f24edec1a77f0"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/droid-Q/homebrew-tap/releases/download/rke-1.2.9"
    rebuild 1
    sha256 cellar: :any_skip_relocation, catalina:     "191aeeb23bf0e72afaa34f9484ac8737fb24ff14e46f58a9fbe38af3e66486a7"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ce00ea019ffc80715da16b694ec338765f1ab2a6a70306732aab9f339275e5f5"
  end

  depends_on "go" => :build

  def install
    system "go", "build", "-ldflags",
            "-w -X main.VERSION=v#{version}",
            "-o", bin/"rke"
  end

  test do
    system bin/"rke", "config", "-e"
    assert_predicate testpath/"cluster.yml", :exist?
  end
end
