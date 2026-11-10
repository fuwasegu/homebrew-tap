cask "airlingua" do
  version "1.10.1"
  sha256 "2ff190f955c62377b5648d94ec5b69ba90eadb1240b063fadf1b083d0beb81e3"

  url "https://github.com/fuwasegu/AirLingua/releases/download/v#{version}/AirLingua-#{version}.zip"
  name "AirLingua"
  desc "Local LLM translation app for macOS"
  homepage "https://github.com/fuwasegu/AirLingua"

  depends_on macos: :sonoma

  app "AirLingua.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{appdir}}/AirLingua.app"]
    run "/usr/bin/SetFile", args: ["-a", "E", "{{appdir}}/AirLingua.app"]
    run "/usr/bin/open", args: ["{{appdir}}/AirLingua.app"]
  end

  zap trash: [
    "~/Library/Application Support/AirLingua",
    "~/Library/Preferences/com.personal.LocalTranslate.plist",
  ]
end
