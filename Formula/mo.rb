class Mo < Formula
  desc "Markdown viewer that opens .md files in a browser"
  homepage "https://github.com/strubio-ray/mo"
  version "0.25.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/strubio-ray/mo/releases/download/strubio-v0.25.3/mo_strubio-v0.25.3_darwin_arm64.zip"
      sha256 "5cf6039a08996a86a3d724db66d42380557c8e059bf33a39713956510767330d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/strubio-ray/mo/releases/download/strubio-v0.25.3/mo_strubio-v0.25.3_darwin_amd64.zip"
      sha256 "129ce6f9ace08d76440e31eeb6369151df9bdcba8642af173cbddc32cd0b89af"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/strubio-ray/mo/releases/download/strubio-v0.25.3/mo_strubio-v0.25.3_linux_arm64.tar.gz"
      sha256 "94f975d49ada9612cf080d14ccfaa22a90cd19e8eb667c52ad994ffea95f14c6"
    end
    if Hardware::CPU.intel?
      url "https://github.com/strubio-ray/mo/releases/download/strubio-v0.25.3/mo_strubio-v0.25.3_linux_amd64.tar.gz"
      sha256 "a091f06d24accbe0bfe50be5c2cdc155ef13ef334889bc36f39c1ba0c1633615"
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
