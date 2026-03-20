class Clipssh < Formula
  desc "Send clipboard images to remote SSH hosts"
  homepage "https://github.com/strubio-ray/clipssh"
  url "https://github.com/strubio-ray/clipssh/archive/refs/tags/v1.2.1.tar.gz"
  sha256 "355411ad4b97eb18713b495bacd151b479a5567de5a042877f87739590b9d20a"
  license "MIT"

  depends_on :macos

  def install
    # Embed version in Swift source before compiling
    inreplace "swift/ClipsshPaste.swift", 'let version = "1.0.0"', "let version = \"#{version}\""

    # Compile Swift CLI helper (explicit AppKit link for robustness)
    system "swiftc", "-O", "-framework", "AppKit", "-o", "clipssh-paste", "swift/ClipsshPaste.swift"

    # Embed version in shell script
    inreplace "clipssh", "%%VERSION%%", version.to_s

    # Install both binaries
    bin.install "clipssh"
    bin.install "clipssh-paste"
  end

  test do
    assert_match "clipssh #{version}", shell_output("#{bin}/clipssh --version")
    assert_match "clipssh-paste #{version}", shell_output("#{bin}/clipssh-paste --version")
  end
end
