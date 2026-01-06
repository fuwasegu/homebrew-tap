cask "md-sh" do
  version "0.1.9"
  sha256 "dbd582d16b021d4baa521290b6e9f7c5751fca6ea7fd9c22edbe34725e26a1c9"

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
