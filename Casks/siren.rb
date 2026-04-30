cask "siren" do
  version "0.1.0"
  sha256 "PLACEHOLDER"

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
