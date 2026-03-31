class GmapsSync < Formula
  desc "One-way sync from Google Maps saved places to local JSON"
  homepage "https://github.com/strubio-ray/gmaps-sync"
  url "https://github.com/strubio-ray/gmaps-sync/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "ceee370b32186ce06de8be5e4b445df1cc1241e0b6317d9655329a8cb847a267"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "ci"
    system "npm", "run", "build"
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec/"bin/gmaps-sync"
  end

  test do
    assert_match "gmaps-sync", shell_output("#{bin}/gmaps-sync --help")
  end
end
