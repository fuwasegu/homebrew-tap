cask "fleet" do
  version "0.1.0"
  sha256 "f44eb22daa613fb6ae7dc9843a9a772e7dd48b5bc267205f38e180a89d9f78c1"

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
