class Mo < Formula
  desc "Markdown viewer that opens .md files in a browser"
  homepage "https://github.com/strubio-ray/mo"
  version "0.22.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/strubio-ray/mo/releases/download/strubio-v0.22.0/mo_strubio-v0.22.0_darwin_arm64.zip"
      sha256 "63e6655295fc0691f47010021bcbe3a5c99e7566e766db8eb747a395be6ec0c9"
    end
    if Hardware::CPU.intel?
      url "https://github.com/strubio-ray/mo/releases/download/strubio-v0.22.0/mo_strubio-v0.22.0_darwin_amd64.zip"
      sha256 "3877ab8f54234b484baa93f5c5aa0f8711a981477a4eb4025d2896ece32b6f69"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/strubio-ray/mo/releases/download/strubio-v0.22.0/mo_strubio-v0.22.0_linux_arm64.tar.gz"
      sha256 "1dc58ad5586b19f5ea5cf621ea0af96628384e01eee13cd8f88557e66ce4e8bd"
    end
    if Hardware::CPU.intel?
      url "https://github.com/strubio-ray/mo/releases/download/strubio-v0.22.0/mo_strubio-v0.22.0_linux_amd64.tar.gz"
      sha256 "7b237de004da65561f77a67ca847c62b72102472623a58336c0b4c603f05617f"
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
