class MarvinCli < Formula
  desc "CLI for Amazing Marvin (desktop local API + public cloud API)"
  homepage "https://github.com/Rubio-Enterprises/marvin-cli"
  version "0.6.0-strubio.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Rubio-Enterprises/marvin-cli/releases/download/v0.6.0-strubio.2/marvin-cli_v0.6.0-strubio.2_darwin_arm64.tar.gz"
      sha256 "6d57a3969653d46d299659472f771cf9da2b0acb60f9285c923d2cd483a8143d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Rubio-Enterprises/marvin-cli/releases/download/v0.6.0-strubio.2/marvin-cli_v0.6.0-strubio.2_darwin_amd64.tar.gz"
      sha256 "e1eaf37f62f6957949ba33d054cc3bc8d72e6d6cd701965fd5ba437d4b7d9e6c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/Rubio-Enterprises/marvin-cli/releases/download/v0.6.0-strubio.2/marvin-cli_v0.6.0-strubio.2_linux_amd64.tar.gz"
      sha256 "1f1ca7f2d81338480276ff1eecf3330b1b9969e193d9bb12edf5e42b8cf34a90"
    end
  end

  def install
    bin.install "marvin-cli"
  end

  test do
    assert_match "marvin-cli v#{version}", shell_output("#{bin}/marvin-cli --version")
  end
end
