class MarvinCli < Formula
  desc "CLI for Amazing Marvin (desktop local API + public cloud API)"
  homepage "https://github.com/strubio-ray/marvin-cli"
  version "0.5.1-strubio.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/strubio-ray/marvin-cli/releases/download/v0.5.1-strubio.2/marvin-cli_v0.5.1-strubio.2_darwin_arm64.tar.gz"
      sha256 "21c8e0e0d5fbedaa4f2c3bca89e117f10b6cb029c4d38536c4e0fa14df1963b7"
    end
    if Hardware::CPU.intel?
      url "https://github.com/strubio-ray/marvin-cli/releases/download/v0.5.1-strubio.2/marvin-cli_v0.5.1-strubio.2_darwin_amd64.tar.gz"
      sha256 "4e1d34b6354d46f0b43d519ae11fb04fd5ea29170233786c7a1fae958740fb39"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/strubio-ray/marvin-cli/releases/download/v0.5.1-strubio.2/marvin-cli_v0.5.1-strubio.2_linux_amd64.tar.gz"
      sha256 "db1a7cee9fc2b5c7020643a85e06b82ad24de7f44ab254fe4e78603564066cfd"
    end
  end

  def install
    bin.install "marvin-cli"
  end

  test do
    assert_match "marvin-cli v#{version}", shell_output("#{bin}/marvin-cli --version")
  end
end
