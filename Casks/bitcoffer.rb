cask "bitcoffer" do
  version "2.15.5"
  sha256 "8acfb1985eb6ee6046394efafb46c612b5465e7558d52abfd0737a39c93ddb0d"

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
