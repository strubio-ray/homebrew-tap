class MarvinCli < Formula
  desc "CLI for Amazing Marvin (desktop local API + public cloud API)"
  homepage "https://github.com/strubio-ray/marvin-cli"
  version "0.5.1-strubio.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/strubio-ray/marvin-cli/releases/download/v0.5.1-strubio.3/marvin-cli_v0.5.1-strubio.3_darwin_arm64.tar.gz"
      sha256 "bfbe8ce0e3da4f1fe5cb79756c6b39b994e302dc0f53ef629242cb186ae26c7b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/strubio-ray/marvin-cli/releases/download/v0.5.1-strubio.3/marvin-cli_v0.5.1-strubio.3_darwin_amd64.tar.gz"
      sha256 "7aaa22b788c3e7a911e7bbfdf09f48880675dbedc7ebdd31e99c16ce67f3819a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/strubio-ray/marvin-cli/releases/download/v0.5.1-strubio.3/marvin-cli_v0.5.1-strubio.3_linux_amd64.tar.gz"
      sha256 "d3637b3e53a3da3b4f845a635af52dcac5d8c7370c693d7d540cdfd112da3a08"
    end
  end

  def install
    bin.install "marvin-cli"
  end

  test do
    assert_match "marvin-cli v#{version}", shell_output("#{bin}/marvin-cli --version")
  end
end
