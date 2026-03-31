class GmapsSync < Formula
  desc "One-way sync from Google Maps saved places to local JSON"
  homepage "https://github.com/strubio-ray/gmaps-sync"
  url "https://github.com/strubio-ray/gmaps-sync/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "3043dc56314c97fabf2bf4abbee5f63bf6f15f558eb2a590239185cecb3bccd8"
  license "MIT"

  depends_on "node"
  depends_on cask: "google-chrome"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec/"bin/gmaps-sync"
  end

  test do
    assert_match "gmaps-sync", shell_output("#{bin}/gmaps-sync --help")
  end
end
