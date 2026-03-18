class Clipssh < Formula
  desc "Send clipboard screenshots to remote SSH hosts"
  homepage "https://github.com/strubio-ray/clipssh"
  url "https://github.com/strubio-ray/clipssh/archive/refs/tags/v1.1.2.tar.gz"
  sha256 "454583b42326053b14c3e5aed7a83fda7b0aade02e0b86d2370c50c6106c8ede"
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
