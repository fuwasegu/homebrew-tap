cask "sticky-bookmark" do
  version "1.0.0"
  sha256 "fd08f90bf940652e9f11d4a565a5bbd334e57f63f5414d466ce256298f17282a"

  url "https://github.com/fuwasegu/stickey-bookmark/releases/download/v#{version}/StickyBookmark-#{version}.zip"
  name "Sticky Bookmark"
  desc "Pin web bookmarks as freely-placed sticky notes on your macOS desktop"
  homepage "https://github.com/fuwasegu/stickey-bookmark"

  depends_on macos: ">= :ventura"

  app "StickyBookmark.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/StickyBookmark.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/StickyBookmark",
    "~/Library/Caches/StickyBookmark",
    "~/Library/Preferences/dev.takeshita.sticky-bookmark.plist",
    "~/Library/Saved Application State/dev.takeshita.sticky-bookmark.savedState",
  ]
end
