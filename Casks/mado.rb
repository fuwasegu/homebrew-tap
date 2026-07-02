cask "mado" do
  version "1.1.0"
  sha256 "c266760e592881a60f8b9532bce1f0f45894d6cc9fa1170639d69d60e359cb7a"

  url "https://github.com/fuwasegu/mado/releases/download/v#{version}/Mado-#{version}.zip"
  name "Mado"
  desc "Fast, beautiful Markdown viewer for macOS with Mermaid and OpenAPI support"
  homepage "https://github.com/fuwasegu/mado"

  depends_on macos: ">= :sonoma"

  app "Mado.app"

  postflight do
    # -cr は SIP 保護の com.apple.provenance で失敗するため quarantine のみ削除
    system_command "/bin/sh",
                   args: ["-c", "/usr/bin/xattr -dr com.apple.quarantine '#{appdir}/Mado.app' || true"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Preferences/dev.takeshita.mado.plist",
    "~/Library/Saved Application State/dev.takeshita.mado.savedState",
  ]
end
