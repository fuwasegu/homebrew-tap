cask "airlingua" do
  version "1.0.6"
  sha256 "8858d939467ba34e1cf815d5a8aa7db7fe0a71fb1a85241b3206d3644999b97f"

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
