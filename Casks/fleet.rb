cask "fleet" do
  version "0.5.4"
  sha256 "74cc9d2ab1ebe7dd92a89be5503299a2c76904006e51ad66b7f7e7b1ca930a9b"

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
