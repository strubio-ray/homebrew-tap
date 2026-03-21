class Mo < Formula
  desc "Markdown viewer that opens .md files in a browser"
  homepage "https://github.com/strubio-ray/mo"
  version "0.21.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/strubio-ray/mo/releases/download/strubio-v0.21.0/mo_strubio-v0.21.0_darwin_arm64.zip"
      sha256 "a9a2f0d900a035ad759db6ed73ad369bee4294b82ae6ec43f65c729eb3edef93"
    end
    if Hardware::CPU.intel?
      url "https://github.com/strubio-ray/mo/releases/download/strubio-v0.21.0/mo_strubio-v0.21.0_darwin_amd64.zip"
      sha256 "dd1e2d443476124ebacd13a9bd1068f9d398349064372a8b8f2fb6ed6da0c38d"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/strubio-ray/mo/releases/download/strubio-v0.21.0/mo_strubio-v0.21.0_linux_arm64.tar.gz"
      sha256 "c6d27a9d086065b3e0191a7592752e15dfee1a23db5d6c335ce53f4688c7bae0"
    end
    if Hardware::CPU.intel?
      url "https://github.com/strubio-ray/mo/releases/download/strubio-v0.21.0/mo_strubio-v0.21.0_linux_amd64.tar.gz"
      sha256 "353561531cf12ffced775910634450d89b131a927791ff9eef6b3405692c6d45"
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
