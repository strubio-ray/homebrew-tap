class VmWard < Formula
  desc "Auto-halt daemon for forgotten Vagrant VMs"
  homepage "https://github.com/strubio-ray/vm-ward"
  url "https://github.com/strubio-ray/vm-ward/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "1f2a8d79e769a90be0ebd7fd507defe77ecb5875f8f97d203338f8291777dbad"
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
