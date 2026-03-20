class Clipssh < Formula
  desc "Send clipboard images to remote SSH hosts"
  homepage "https://github.com/strubio-ray/clipssh"
  url "https://github.com/strubio-ray/clipssh/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "4d1a216f8e37433beeaf12b171e91b0dd6ebbfd20b4720c6390b80883b3792bb"
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
