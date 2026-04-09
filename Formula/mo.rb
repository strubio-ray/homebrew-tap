class Mo < Formula
  desc "Markdown viewer that opens .md files in a browser"
  homepage "https://github.com/strubio-ray/mo"
  version "0.25.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/strubio-ray/mo/releases/download/strubio-v0.25.0/mo_strubio-v0.25.0_darwin_arm64.zip"
      sha256 "7a93cb5cd5bcc231b3bbf3cb7ede95de0346964183fb4eaccf264fc99c29d64d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/strubio-ray/mo/releases/download/strubio-v0.25.0/mo_strubio-v0.25.0_darwin_amd64.zip"
      sha256 "54b53a992b7a7aec5bd2c4854ee61bced319b72eb1adb7a6f6820c058fed3005"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/strubio-ray/mo/releases/download/strubio-v0.25.0/mo_strubio-v0.25.0_linux_arm64.tar.gz"
      sha256 "9e77dd45a61ec2b2dc73bdcb5a0bcb5d9197fd048ef9248cccb73822449ab25b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/strubio-ray/mo/releases/download/strubio-v0.25.0/mo_strubio-v0.25.0_linux_amd64.tar.gz"
      sha256 "ff36393abd08010b59ed239735c8d27d644fcd05adbd9c6a718a6dae8516485a"
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
