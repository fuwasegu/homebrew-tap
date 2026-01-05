cask "md-sh" do
    version "0.1.2"
    sha256 "9897f2b274151888fd6bd0dba4071f00a42f190f9f3e7d77ae6fb1337d74652f"

    url "https://github.com/fuwasegu/md.sh/releases/download/v#{version}/md.sh-#{version}.zip"
    name "md.sh"
    desc "Lightweight native Markdown dashboard for macOS"
    homepage "https://github.com/fuwasegu/md.sh"

    depends_on macos: ">= :sonoma"

    app "md.sh.app"
end
