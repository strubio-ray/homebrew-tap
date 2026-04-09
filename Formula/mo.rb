class Mo < Formula
  desc "Markdown viewer that opens .md files in a browser"
  homepage "https://github.com/strubio-ray/mo"
  version "0.24.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/strubio-ray/mo/releases/download/strubio-v0.24.0/mo_strubio-v0.24.0_darwin_arm64.zip"
      sha256 "abf2780b44ae8f31378f471c57a1147c3db3be4be89685bf7357dc8f50e687e3"
    end
    if Hardware::CPU.intel?
      url "https://github.com/strubio-ray/mo/releases/download/strubio-v0.24.0/mo_strubio-v0.24.0_darwin_amd64.zip"
      sha256 "eabc32c00e1e234d06a80348a0abb8ace160aa6c56fd2cb0024d2ed461c2ec77"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/strubio-ray/mo/releases/download/strubio-v0.24.0/mo_strubio-v0.24.0_linux_arm64.tar.gz"
      sha256 "6aa41975c5ed3e049b112ade7492e7128307ed51f9a80bdc71b1ab7d91f9f42a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/strubio-ray/mo/releases/download/strubio-v0.24.0/mo_strubio-v0.24.0_linux_amd64.tar.gz"
      sha256 "8b966c5aa66db98f58544a6698e8c7a45d110adbbc8dca925d0a5f99161ac535"
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
