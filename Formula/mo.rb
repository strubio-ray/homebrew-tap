class Mo < Formula
  desc "Markdown viewer that opens .md files in a browser"
  homepage "https://github.com/strubio-ray/mo"
  version "0.25.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/strubio-ray/mo/releases/download/strubio-v0.25.4/mo_strubio-v0.25.4_darwin_arm64.zip"
      sha256 "8a8bbb0acedbb1e49ea470b80cb303aa5231cdd6f87d68f191a2a3e2667140f5"
    end
    if Hardware::CPU.intel?
      url "https://github.com/strubio-ray/mo/releases/download/strubio-v0.25.4/mo_strubio-v0.25.4_darwin_amd64.zip"
      sha256 "61e48f3cb466e36eca4650bb2870594f6cac3af47365bc3812506545b25bd2b8"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/strubio-ray/mo/releases/download/strubio-v0.25.4/mo_strubio-v0.25.4_linux_arm64.tar.gz"
      sha256 "8f61b3fcde4e57d63e6ec6e32e0d6049d8d43666dffff5ceb1b5d733b272042d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/strubio-ray/mo/releases/download/strubio-v0.25.4/mo_strubio-v0.25.4_linux_amd64.tar.gz"
      sha256 "1c023b67bd51ce197015fb51b3238bd809db67f0438689deb4a90983a3ada115"
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
