class Clipssh < Formula
  desc "Send clipboard screenshots to remote SSH hosts"
  homepage "https://github.com/strubio-ray/clipssh"
  url "https://github.com/strubio-ray/clipssh/archive/refs/tags/v1.1.1.tar.gz"
  sha256 "5e66b8f3412277e87dd6c1e1699fa0b268fdad3dc6de1c5a4f22848dc3e250ec"
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
