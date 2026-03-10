class MarvinRelay < Formula
  desc "Go relay server bridging Amazing Marvin webhooks to Apple Live Activities"
  homepage "https://github.com/strubio-ray/marvin-time-tracker"
  url "https://github.com/strubio-ray/marvin-time-tracker/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "1255b40f30f40fb4d4d9994a57773484434506ef088569967b203bcf2a4609f7"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "go" => :build

  def install
    ldflags = %W[-s -w -X main.version=#{version}]
    system "go", "build", *std_go_args(ldflags:), "-o", bin/"marvin-relay", "./server"
    (etc/"marvin-relay").install "server/config.example" => "config"
  end

  service do
    run [opt_bin/"marvin-relay", "--config", etc/"marvin-relay/config"]
    keep_alive true
    working_dir var/"marvin-relay"
    log_path var/"log/marvin-relay.log"
    error_log_path var/"log/marvin-relay.log"
    environment_variables PATH: std_service_path_env
  end

  def post_install
    (var/"marvin-relay").mkpath
  end

  test do
    assert_match "marvin-relay #{version}", shell_output("#{bin}/marvin-relay --version")
  end
end
