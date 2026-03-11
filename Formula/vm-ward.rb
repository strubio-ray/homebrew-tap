class VmWard < Formula
  desc "Auto-halt daemon for forgotten Vagrant VMs"
  homepage "https://github.com/strubio-ray/vm-ward"
  url "https://github.com/strubio-ray/vm-ward/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "6a6c965d46c8f810685210d300ec954640d8d98449d63e913fcd5694581fa129"
  license "MIT"

  depends_on "jq"

  def install
    inreplace "bin/vmw", "%%VERSION%%", version.to_s

    on_macos do
      libexec.install "bin", "lib", "share"
      bin.write_exec_script libexec/"bin/vmw"
    end

    on_linux do
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
