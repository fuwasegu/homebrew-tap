cask "fleet" do
  version "0.2.2"
  sha256 "1ff02933be0503cb60832a9ee9968997b2d8c6ec09c6cc95a67d4a2ef2cc56d6"

  url "https://github.com/fuwasegu/fleet/releases/download/v#{version}/Fleet.app.zip"
  name "Fleet"
  desc "Kanban x terminal cockpit for commanding a fleet of Claude Code agents"
  homepage "https://github.com/fuwasegu/fleet"

  depends_on macos: :tahoe

  app "Fleet.app"

  # 未署名ビルドの Gatekeeper 回避。quarantine のみ剥がす。
  # (企業DLP等が付ける保護 xattr を巻き込むと EPERM で失敗するため -cr は使わない)
  postflight do
    system_command "/usr/bin/xattr",
                   args:         ["-dr", "com.apple.quarantine", "#{appdir}/Fleet.app"],
                   sudo:         false,
                   must_succeed: false
  end

  zap trash: "~/Library/Preferences/dev.fuwasegu.Fleet.plist"
end
