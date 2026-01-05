cask "md-sh" do
    version "0.1.2"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"

    url "https://github.com/fuwasegu/md.sh/releases/download/v#{version}/md.sh-#{version}.zip"
    name "md.sh"
    desc "Lightweight native Markdown dashboard for macOS"
    homepage "https://github.com/fuwasegu/md.sh"

    depends_on macos: ">= :sonoma"

    app "md.sh.app"
end
