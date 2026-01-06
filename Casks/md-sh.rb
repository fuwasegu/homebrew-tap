cask "md-sh" do
  version "0.1.5"
  sha256 "a9e344ffdf10b09f5d2f2fcd73d809795c44b0c040fc89a406fa338c5239663d"

  url "https://github.com/fuwasegu/md.sh/releases/download/v#{version}/md.sh-#{version}.zip"
  name "md.sh"
  desc "Lightweight native Markdown dashboard for macOS"
  homepage "https://github.com/fuwasegu/md.sh"

  depends_on macos: ">= :sonoma"

  app "md.sh.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/md.sh.app"],
                   sudo: false
    system_command "/usr/bin/SetFile",
                   args: ["-a", "E", "#{appdir}/md.sh.app"],
                   sudo: false
  end
end
