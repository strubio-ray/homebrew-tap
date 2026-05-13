class Clipssh < Formula
  desc "Send clipboard images to remote SSH hosts"
  homepage "https://github.com/Rubio-Enterprises/clipssh"
  url "https://github.com/Rubio-Enterprises/clipssh/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "aeb941aa52f09db07d93a873934ad4075a50c0788a42f49bc39d7c96880f8675"
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
