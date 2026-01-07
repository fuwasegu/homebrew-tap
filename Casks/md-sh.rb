cask "md-sh" do
  version "0.1.13"
  sha256 "7bf588c90095f9597cccb0fcb51eaf508bb219fdf0b31c82e7b570cb9af772eb"

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
