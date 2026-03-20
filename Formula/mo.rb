class Mo < Formula
  desc "Markdown viewer that opens .md files in a browser"
  homepage "https://github.com/strubio-ray/mo"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/strubio-ray/mo/releases/download/strubio-v0.2.0/mo_strubio-v0.2.0_darwin_arm64.zip"
      sha256 "97d655ead57b651d9a4703d817b855d74e836d696864aa1344591cbbee8c8198"
    end
    if Hardware::CPU.intel?
      url "https://github.com/strubio-ray/mo/releases/download/strubio-v0.2.0/mo_strubio-v0.2.0_darwin_amd64.zip"
      sha256 "e7cc55df2d009408c94b63dbdc7b430714871a28b8969906f214b703030da914"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/strubio-ray/mo/releases/download/strubio-v0.2.0/mo_strubio-v0.2.0_linux_arm64.tar.gz"
      sha256 "1f2a3be26a3fda26dd995fcdceb4afe424e23c46622024d3baeeb6ee89cebffb"
    end
    if Hardware::CPU.intel?
      url "https://github.com/strubio-ray/mo/releases/download/strubio-v0.2.0/mo_strubio-v0.2.0_linux_amd64.tar.gz"
      sha256 "f173fc5f32692ae0600ccd4f2ff342c27f96b96cdbe872abbbfb8888029cb805"
    end
  end

  def install
    bin.install "mo"
    generate_completions_from_executable(bin/"mo", "completion")
  end

  test do
    assert_match "mo version", shell_output("#{bin}/mo --version")
  end
end
