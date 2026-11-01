cask "bitcoffer" do
  version "2.14.0"
  sha256 "97b63f3c91c76f773f2f975ea64bc011857373891e2a0f3ac9f4e74b9682290c"

  url "https://github.com/cygnusyang/coffer/releases/download/v#{version}/Bitcoffer-v#{version}.dmg"
  name "Bitcoffer"
  desc "Local-first password manager with a read-only MCP server for AI agents"
  homepage "https://cygnusyang.github.io/coffer/en.html"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Bitcoffer.app"

  caveats <<~EOS
    Your vaults live in ~/.bitcoffer/vaults and are NOT removed by
    `brew uninstall --zap`. Delete them yourself only if you have a backup.
  EOS

  zap trash: [
    "~/Library/Caches/top.cygnusyang.coffer",
    "~/Library/Preferences/top.cygnusyang.coffer.plist",
    "~/Library/Saved Application State/top.cygnusyang.coffer.savedState",
  ]
end
