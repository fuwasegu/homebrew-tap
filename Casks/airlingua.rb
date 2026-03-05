cask "airlingua" do
  version "1.6.0"
  sha256 "28c9d74d850c1349fea5cc72d6fa50b16ac6b6ee8f44ac2974221bdfd231f20f"

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
