class Mo < Formula
  desc "Markdown viewer that opens .md files in a browser"
  homepage "https://github.com/strubio-ray/mo"
  version "0.21.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/strubio-ray/mo/releases/download/strubio-v0.21.1/mo_strubio-v0.21.1_darwin_arm64.zip"
      sha256 "1ca725b31d54c098b5dcdb92fd6dc6d976c6a51fe5e7bacc19f30985555b456d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/strubio-ray/mo/releases/download/strubio-v0.21.1/mo_strubio-v0.21.1_darwin_amd64.zip"
      sha256 "c023cdfb8d1b2c570e23f4ef533f760452e4741e3eb4f241917757958cb7af54"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/strubio-ray/mo/releases/download/strubio-v0.21.1/mo_strubio-v0.21.1_linux_arm64.tar.gz"
      sha256 "b7fa893a0333118b2a034b01e9c42e04ffc8568fea19e63eb1a71b152f8a8e62"
    end
    if Hardware::CPU.intel?
      url "https://github.com/strubio-ray/mo/releases/download/strubio-v0.21.1/mo_strubio-v0.21.1_linux_amd64.tar.gz"
      sha256 "aef886412348e54fb16d362b3760356061fc16e3d451462872bd0e2e81eb0668"
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
