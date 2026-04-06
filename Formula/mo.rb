class Mo < Formula
  desc "Markdown viewer that opens .md files in a browser"
  homepage "https://github.com/strubio-ray/mo"
  version "0.23.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/strubio-ray/mo/releases/download/strubio-v0.23.0/mo_strubio-v0.23.0_darwin_arm64.zip"
      sha256 "6ec9085c565c2e4d838e84316c17828bcfea59c8098725e00d5ddb6017f4f42e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/strubio-ray/mo/releases/download/strubio-v0.23.0/mo_strubio-v0.23.0_darwin_amd64.zip"
      sha256 "9635526d200705fcc8eb9858bb8dfc99d764c73b07d3ec6068169973644b5834"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/strubio-ray/mo/releases/download/strubio-v0.23.0/mo_strubio-v0.23.0_linux_arm64.tar.gz"
      sha256 "d80e090f16eeace1f72e64cfa239442aae38fe98ce821c86822f661f0ba68992"
    end
    if Hardware::CPU.intel?
      url "https://github.com/strubio-ray/mo/releases/download/strubio-v0.23.0/mo_strubio-v0.23.0_linux_amd64.tar.gz"
      sha256 "cc92d3c732a2b1ffb39c388dfcd195ed978aef54ee0676ab7c1370d8b8792c35"
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
