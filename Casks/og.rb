cask "og" do
  version "0.2.1"
  sha256 "543aaff47839a577b4ee7d1fa3dabd40024bab965e9731de040361b1f139b7c6"

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
