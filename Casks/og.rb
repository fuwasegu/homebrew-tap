cask "og" do
  version "0.7.0"
  sha256 "f919bbde13ecca012381661b4d7259d10897118944f22cb38fbba21a6712023b"

  url "https://github.com/fuwasegu/og/releases/download/v#{version}/og.app.zip"
  name "og"
  desc "Native macOS IDE for writing Go by hand, GoLand-style"
  homepage "https://github.com/fuwasegu/og"

  depends_on macos: :sonoma

  app "og.app"

  # 未署名ビルドの Gatekeeper 回避。quarantine のみ剥がす。
  # (企業DLP等が付ける保護 xattr を巻き込むと EPERM で失敗するため -cr は使わない)
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/og.app"], must_succeed: false
  end

  zap trash: "~/Library/Preferences/dev.fuwasegu.og.plist"
end
