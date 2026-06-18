cask "mado" do
  version "1.0.1"
  sha256 "165441916feda0a90cf701e40ba9a2913aa1eb6d3dd7bded53a6f688c64f06b2"

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
