cask "og" do
  version "0.12.0"
  sha256 "f4a59d96b719c9d6c3a5b4da0df1e05169a3a2354d66a8953cf71634f001ea0b"

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
