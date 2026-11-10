cask "og" do
  version "0.2.2"
  sha256 "a47d988cc29daa6f6eaffa3141f8bd5267342e06fcc4578a1a918731ef5789d1"

  url "https://github.com/fuwasegu/og/releases/download/v#{version}/og.app.zip"
  name "og"
  desc "Native macOS IDE for writing Go by hand, GoLand-style"
  homepage "https://github.com/fuwasegu/og"

  depends_on macos: ">= :sonoma"

  app "og.app"

  # 未署名ビルドの Gatekeeper 回避。quarantine のみ剥がす。
  # (企業DLP等が付ける保護 xattr を巻き込むと EPERM で失敗するため -cr は使わない)
  postflight do
    system_command "/usr/bin/xattr",
                   args:         ["-dr", "com.apple.quarantine", "#{appdir}/og.app"],
                   sudo:         false,
                   must_succeed: false
  end

  zap trash: "~/Library/Preferences/dev.fuwasegu.og.plist"
end
