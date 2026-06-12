cask "mado" do
  version "1.0.0"
  sha256 "06b2b89007c8793ab5f51f44ff1fb51342fe1fd007253f7cc9956e030924e318"

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
