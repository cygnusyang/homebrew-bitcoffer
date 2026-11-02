cask "bitcoffer" do
  version "2.15.3"
  sha256 "99f63c6d141afa98e861eef47a143bc3fe5b4ac4866241579fce33d249abe66"

  url "https://github.com/cygnusyang/bitcoffer/releases/download/v#{version}/Bitcoffer-v#{version}.dmg"
  name "Bitcoffer"
  desc "Local-first password manager with a read-only MCP server for AI agents"
  homepage "https://cygnusyang.github.io/bitcoffer/en.html"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Bitcoffer.app"

  zap trash: [
    "~/Library/Caches/top.cygnusyang.coffer",
    "~/Library/Preferences/top.cygnusyang.coffer.plist",
    "~/Library/Saved Application State/top.cygnusyang.coffer.savedState",
  ]

  caveats <<~EOS
    Your vaults live in ~/.bitcoffer/vaults and are NOT removed by
    `brew uninstall --zap`. Delete them yourself only if you have a backup.
  EOS
end
