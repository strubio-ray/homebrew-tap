class Mo < Formula
  desc "Markdown viewer that opens .md files in a browser"
  homepage "https://github.com/strubio-ray/mo"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/strubio-ray/mo/releases/download/strubio-v0.1.0/mo_strubio-v0.1.0_darwin_arm64.zip"
      sha256 "e395a7026464aeff76195ef4239c177c72757ba7ba3f5e589703ef1c52584ca1"
    end
    if Hardware::CPU.intel?
      url "https://github.com/strubio-ray/mo/releases/download/strubio-v0.1.0/mo_strubio-v0.1.0_darwin_amd64.zip"
      sha256 "8093342c54b109ccb15c3abc8c69c0557d3870dc42223cfd1c6abb8d82818a50"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/strubio-ray/mo/releases/download/strubio-v0.1.0/mo_strubio-v0.1.0_linux_arm64.tar.gz"
      sha256 "bfb0d4af3e60516d44ada8c67491ae3bc53125d39f783a278eccef37cf14dcde"
    end
    if Hardware::CPU.intel?
      url "https://github.com/strubio-ray/mo/releases/download/strubio-v0.1.0/mo_strubio-v0.1.0_linux_amd64.tar.gz"
      sha256 "f00a3783d6ef4e2f76e902b3b90649b4bbceee6b4e9fea0b88224295ade7ad7b"
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
