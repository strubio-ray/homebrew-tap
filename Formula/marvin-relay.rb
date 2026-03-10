class MarvinRelay < Formula
  desc "Go relay server bridging Amazing Marvin webhooks to Apple Live Activities"
  homepage "https://github.com/strubio-ray/marvin-time-tracker"
  url "https://github.com/strubio-ray/marvin-time-tracker/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "a13376c6135bbc4379e8f31e211c31c545caaab732b79d7a06a73029ddb191a8"
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
