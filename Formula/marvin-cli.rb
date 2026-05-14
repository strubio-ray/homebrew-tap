class MarvinCli < Formula
  desc "CLI for Amazing Marvin (desktop local API + public cloud API)"
  homepage "https://github.com/Rubio-Enterprises/marvin-cli"
  version "0.8.0-strubio.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Rubio-Enterprises/marvin-cli/releases/download/v0.8.0-strubio.1/marvin-cli_v0.8.0-strubio.1_darwin_arm64.tar.gz"
      sha256 "625cdbd2d739aceeedf4dbe0975f5d341215bf99530034aa94d2e7f602a1094f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Rubio-Enterprises/marvin-cli/releases/download/v0.8.0-strubio.1/marvin-cli_v0.8.0-strubio.1_darwin_amd64.tar.gz"
      sha256 "7501f2ae04368e070d88103faa02ee6956b4f8b19d593049ae25563742b6dea2"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/Rubio-Enterprises/marvin-cli/releases/download/v0.8.0-strubio.1/marvin-cli_v0.8.0-strubio.1_linux_amd64.tar.gz"
      sha256 "87a965c6888034b6290953eb14f95ba84b4f26a1961d6cf3fe070e97c2b79735"
    end
  end

  def install
    bin.install "marvin-cli"
  end

  test do
    assert_match "marvin-cli v#{version}", shell_output("#{bin}/marvin-cli --version")
  end
end
