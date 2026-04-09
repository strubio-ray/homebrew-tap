class Mo < Formula
  desc "Markdown viewer that opens .md files in a browser"
  homepage "https://github.com/strubio-ray/mo"
  version "0.25.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/strubio-ray/mo/releases/download/strubio-v0.25.2/mo_strubio-v0.25.2_darwin_arm64.zip"
      sha256 "943cbb1c20c3bb5961f9a7d1d89f24834f93c9f5f86aea999c1e09a0b9cd1fb8"
    end
    if Hardware::CPU.intel?
      url "https://github.com/strubio-ray/mo/releases/download/strubio-v0.25.2/mo_strubio-v0.25.2_darwin_amd64.zip"
      sha256 "405b2a0f0fd65b964b127f014cc5933e0658630c41bfb545c8a6e53e5d6263b6"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/strubio-ray/mo/releases/download/strubio-v0.25.2/mo_strubio-v0.25.2_linux_arm64.tar.gz"
      sha256 "1c7b78d20c305caa0f4a7556fd3886b766a027e691386c490d2e9f9495480d23"
    end
    if Hardware::CPU.intel?
      url "https://github.com/strubio-ray/mo/releases/download/strubio-v0.25.2/mo_strubio-v0.25.2_linux_amd64.tar.gz"
      sha256 "678730c89dfeb05d6d65d7c34d4530eb4b2b89d1285921aa46f81959c50a1def"
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
