cask "siren" do
  version "0.1.0"
  sha256 "0cff9ad682e5094f4bb422b82cabb305fb5e00ba52a38661fd01d81f7a0f74d4"

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
