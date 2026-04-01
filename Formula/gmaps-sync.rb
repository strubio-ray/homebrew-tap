class GmapsSync < Formula
  desc "One-way sync from Google Maps saved places to local JSON"
  homepage "https://github.com/strubio-ray/gmaps-sync"
  url "https://github.com/strubio-ray/gmaps-sync/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "ceee370b32186ce06de8be5e4b445df1cc1241e0b6317d9655329a8cb847a267"
  license "MIT"

  depends_on "pnpm" => :build
  depends_on "python@3" => :build
  depends_on "node"

  def install
    ENV["PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD"] = "1"

    system "pnpm", "install", "--frozen-lockfile"
    system "pnpm", "-r", "build"
    system "pnpm", "--filter", "@gmaps/cli", "deploy", "--prod", libexec

    (bin/"places").write_env_script libexec/"dist/cli.js", PATH: "#{Formula["node"].opt_bin}:$PATH"
  end

  def post_install
    old_plist = Pathname.new(Dir.home)/"Library/LaunchAgents/com.gmaps-sync.pull.plist"
    if old_plist.exist?
      opoo "Found old gmaps-sync scheduling plist at #{old_plist}"
      opoo "Remove it with: launchctl unload #{old_plist} && rm #{old_plist}"
      opoo "Then use: brew services start gmaps-sync"
    end
  end

  def caveats
    <<~EOS
      To start the daily sync:
        brew services start gmaps-sync

      If you previously used `gmaps-sync schedule`, remove the old plist first:
        launchctl unload ~/Library/LaunchAgents/com.gmaps-sync.pull.plist
        rm ~/Library/LaunchAgents/com.gmaps-sync.pull.plist

      Playwright browsers are not bundled. Install them with:
        npx playwright install chromium
    EOS
  end

  service do
    run [opt_bin/"places", "pull"]
    run_type :cron
    cron "0 6 * * *"
    log_path var/"log/gmaps-sync/pull-stdout.log"
    error_log_path var/"log/gmaps-sync/pull-stderr.log"
    environment_variables PATH: std_service_path_env
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/places --version")
  end
end
