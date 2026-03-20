class Mo < Formula
  desc "Markdown viewer that opens .md files in a browser"
  homepage "https://github.com/strubio-ray/mo"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/strubio-ray/mo/releases/download/strubio-v0.1.0/mo_strubio-v0.1.0_darwin_arm64.zip"
      sha256 "d0d1d368f038b7eefeff895505748d1e082b3202b6b6d14da7889f5997875b17"
    end
    if Hardware::CPU.intel?
      url "https://github.com/strubio-ray/mo/releases/download/strubio-v0.1.0/mo_strubio-v0.1.0_darwin_amd64.zip"
      sha256 "10fea8bb5bd46f4c4aed8f788075b32e7d75f1184692d22dc558bc445c7ea115"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/strubio-ray/mo/releases/download/strubio-v0.1.0/mo_strubio-v0.1.0_linux_arm64.tar.gz"
      sha256 "a064724ebfc163ecfa1fa5e09ebe3b27eb3862381c0381914c91fafffd0c309b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/strubio-ray/mo/releases/download/strubio-v0.1.0/mo_strubio-v0.1.0_linux_amd64.tar.gz"
      sha256 "4ae3e2891f2e714e733c3ecbff968385e4fa27b3cbe91fa9bea71bb360e528d3"
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
