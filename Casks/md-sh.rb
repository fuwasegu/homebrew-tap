cask "md-sh" do
  version "0.1.10"
  sha256 "e7633187aae55b3ca7c21e556495584f7b018847d66f8772f9d17628c5e892ac"

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
