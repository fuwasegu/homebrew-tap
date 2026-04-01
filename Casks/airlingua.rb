cask "airlingua" do
  version "1.8.1"
  sha256 "f9f98439ddcd42963dfef29c9a1b294a6200eaa2c420897281528bff181d5c5f"

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
