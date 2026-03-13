class VmWard < Formula
  desc "Auto-halt daemon for forgotten Vagrant VMs"
  homepage "https://github.com/strubio-ray/vm-ward"
  url "https://github.com/strubio-ray/vm-ward/archive/refs/tags/v1.1.1.tar.gz"
  sha256 "367a71420b518d5afaa4ea6a12ff158f27704c5517f0599ea34f7948488e44a0"
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
