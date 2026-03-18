class Clipssh < Formula
  desc "Send clipboard screenshots to remote SSH hosts"
  homepage "https://github.com/strubio-ray/clipssh"
  url "https://github.com/strubio-ray/clipssh/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "7c4a55b08778391f1e67e869029d75000faae8f4829f825bf1b737d884d269b0"
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
