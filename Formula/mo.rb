class Mo < Formula
  desc "Markdown viewer that opens .md files in a browser"
  homepage "https://github.com/strubio-ray/mo"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/strubio-ray/mo/releases/download/strubio-v0.1.0/mo_strubio-v0.1.0_darwin_arm64.zip"
      sha256 "c893fedebb69ceeb1f92803a9ad2866096fbedd05096f64fd94b8ae709ab6f55"
    end
    if Hardware::CPU.intel?
      url "https://github.com/strubio-ray/mo/releases/download/strubio-v0.1.0/mo_strubio-v0.1.0_darwin_amd64.zip"
      sha256 "3dfd1291a2f38cc14c2b3a34fc70d50df4a0d2cc7a1953300dfe6398eaa6ff43"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/strubio-ray/mo/releases/download/strubio-v0.1.0/mo_strubio-v0.1.0_linux_arm64.tar.gz"
      sha256 "7979bc622efa9adb0a46a6b76b144df11b4b374a0fa73a6de34aa6476f44a00c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/strubio-ray/mo/releases/download/strubio-v0.1.0/mo_strubio-v0.1.0_linux_amd64.tar.gz"
      sha256 "086c48ae5d3e2337809b2eedbc9be8d286292a90c52f65ec3644f865f541e164"
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
