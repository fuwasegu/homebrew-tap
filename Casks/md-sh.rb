cask "md-sh" do
  version "0.1.5"
  sha256 "f56bcc7823b25c73c7384cc85c5953ce40ab2ac226aa867a72899e4c0d19e0fc"

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
