class Rke < Formula
  desc "Rancher Kubernetes Engine, a Kubernetes installer that works everywhere"
  homepage "https://rancher.com/docs/rke/v0.1.x/en/"
  head "https://github.com/rancher/rke.git"
  url "https://github.com/rancher/rke.git",
      :tag      => "v1.2.6",
      :revision => "6ce6e7e29d6613d580fea6a78b1f5cc6ef781741"
  license "Apache-2.0"

  bottle do
    cellar :any_skip_relocation
    sha256 "d6bc20bbddf5f0a031a25f5928cbec0a3181c6c2cd100f819de4f0b511033b8c" => :catalina
    sha256 "c6629fd7706fecb4c0309fdd36d9c1b04dd08f6767659c3f05095321e36df4ac" => :mojave
    sha256 "c12e24a66c2f6048d06d0428865b7e2f872c7ff7769fe163b9091d6ada1e1e62" => :high_sierra
  end

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    (buildpath/"src/github.com/rancher/rke").install buildpath.children

    cd "src/github.com/rancher/rke" do
      system "go", "build", "-ldflags",
             "-w -X main.VERSION=v#{version}",
             "-o", bin/"rke"
      prefix.install_metafiles
    end
  end

  test do
    system bin/"rke", "config", "-e"
    assert_predicate testpath/"cluster.yml", :exist?
  end
end
