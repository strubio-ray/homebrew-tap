class Clipssh < Formula
  desc "Send clipboard screenshots to remote SSH hosts"
  homepage "https://github.com/strubio-ray/clipssh"
  url "https://github.com/strubio-ray/clipssh/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "89f3152b5c7a2c625108c89e2d5da77dc1820928f9425f72981c6a63fb575447"
  license "MIT"

  depends_on :macos
  depends_on "pngpaste"

  def install
    inreplace "clipssh", "%%VERSION%%", version.to_s
    bin.install "clipssh"
  end

  test do
    assert_match "clipssh #{version}", shell_output("#{bin}/clipssh --version")
  end
end
