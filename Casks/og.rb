cask "og" do
  version "0.1.0"
  sha256 "9d7dbfb5f037499ca0aeef2e977bddcefc7a1ec959ba8a946618d1b759900af6"

  url "https://github.com/fuwasegu/og/releases/download/v#{version}/og.app.zip"
  name "og"
  desc "120fps native macOS Go editor with CoreText, Tree-sitter, and PTY terminal"
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
