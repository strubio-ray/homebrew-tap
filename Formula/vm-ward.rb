class VmWard < Formula
  desc "Auto-halt daemon for forgotten Vagrant VMs"
  homepage "https://github.com/strubio-ray/vm-ward"
  url "https://github.com/strubio-ray/vm-ward/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "cacd093458d873db42401420afbc813de9d2a4fd47f901d517403c104186dd4a"
  license "MIT"

  depends_on "jq"

  def install
    inreplace "bin/vmw", "%%VERSION%%", version.to_s

    if OS.mac?
      libexec.install "bin", "lib", "share"
      bin.write_exec_script libexec/"bin/vmw"
    elsif OS.linux?
      (libexec/"bin").install "bin/vmw"
      (libexec/"lib").install "lib/vmw-common.sh", "lib/vmw-guest.sh"
      bin.write_exec_script libexec/"bin/vmw"
    end
  end

  def caveats
    <<~EOS
      To start the auto-halt daemon (macOS only):
        vmw install

      To stop the daemon:
        vmw uninstall
    EOS
  end

  test do
    assert_match "vm-ward #{version}", shell_output("#{bin}/vmw version")
  end
end
