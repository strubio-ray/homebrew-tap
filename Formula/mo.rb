class Mo < Formula
  desc "Markdown viewer that opens .md files in a browser"
  homepage "https://github.com/strubio-ray/mo"
  version "0.25.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/strubio-ray/mo/releases/download/strubio-v0.25.1/mo_strubio-v0.25.1_darwin_arm64.zip"
      sha256 "85ef0948ff890db6debd77e977526145aca9b77af1c1b6612983cada4e31628a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/strubio-ray/mo/releases/download/strubio-v0.25.1/mo_strubio-v0.25.1_darwin_amd64.zip"
      sha256 "3cb96a3f3d740954bb0ad2e766202f37c4aa6f38ea57fde6a4e84eadc1c34570"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/strubio-ray/mo/releases/download/strubio-v0.25.1/mo_strubio-v0.25.1_linux_arm64.tar.gz"
      sha256 "a0c2f1b13479171e9d0799789da361808fa300887f31fec6acbb4d0f42160ff4"
    end
    if Hardware::CPU.intel?
      url "https://github.com/strubio-ray/mo/releases/download/strubio-v0.25.1/mo_strubio-v0.25.1_linux_amd64.tar.gz"
      sha256 "9a0e6204be6b2e06e6ee355bb32a8241e762fd84156866e46257a57ebcf81deb"
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
