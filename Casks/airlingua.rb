cask "airlingua" do
  version "1.0.4"
  sha256 "e0ad65f584977d1b6baf18ceece8e06102504bb21cbedf5d46712692f6bfecc4"

  url "https://github.com/fuwasegu/AirLingua/releases/download/v#{version}/AirLingua-#{version}.zip"
  name "AirLingua"
  desc "Local LLM translation app for macOS"
  homepage "https://github.com/fuwasegu/AirLingua"

  depends_on macos: ">= :sonoma"

  app "AirLingua.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/AirLingua.app"],
                   sudo: false
    system_command "/usr/bin/SetFile",
                   args: ["-a", "E", "#{appdir}/AirLingua.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/AirLingua",
    "~/Library/Preferences/com.personal.LocalTranslate.plist",
  ]
end
