cask "siren" do
  version "0.2.0"
  sha256 "8560d9ae7312470350d435ce1965b3b7bbb65aa49fab326a55f509f4e8d7b3e8"

  url "https://github.com/fuwasegu/siren/releases/download/v#{version}/Siren-#{version}.zip"
  name "Siren"
  desc "Beautiful Mermaid diagram viewer for macOS"
  homepage "https://github.com/fuwasegu/siren"

  depends_on macos: ">= :ventura"

  app "Siren.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Siren.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Preferences/com.siren.app.plist",
  ]
end
