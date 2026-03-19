class VmWard < Formula
  desc "Auto-halt daemon for forgotten Vagrant VMs"
  homepage "https://github.com/strubio-ray/vm-ward"
  url "https://github.com/strubio-ray/vm-ward/archive/refs/tags/v1.5.2.tar.gz"
  sha256 "88b36beda0bd71c28c1069fc1ec817de9426c245afc28ab10c14b105748e90a4"
  license "MIT"

  depends_on "go" => :build
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

    # Build Go TUI binary (after shell scripts are installed)
    cd "tui" do
      system "go", "build", *std_go_args(ldflags: "-s -w", output: libexec/"bin/vmw-tui")
    end
    bin.write_exec_script libexec/"bin/vmw-tui"
  end

  def caveats
    <<~EOS
      To start the auto-halt daemon (macOS only):
        vmw install

      To launch the interactive TUI dashboard:
        vmw tui
    EOS
  end

  test do
    assert_match "vm-ward #{version}", shell_output("#{bin}/vmw version")
  end
end
