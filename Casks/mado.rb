cask "mado" do
  version "1.0.0"
  sha256 "78f9cc70a42ae44dbfcb3b2f09cc4a179e800ad5442d598b4333462c582b2577"

  url "https://github.com/fuwasegu/mado/releases/download/v#{version}/Mado-#{version}.zip"
  name "Mado"
  desc "Fast, beautiful Markdown viewer for macOS with Mermaid and OpenAPI support"
  homepage "https://github.com/fuwasegu/mado"

  depends_on macos: ">= :sonoma"

  app "Mado.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Mado.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Preferences/dev.takeshita.mado.plist",
    "~/Library/Saved Application State/dev.takeshita.mado.savedState",
  ]
end
