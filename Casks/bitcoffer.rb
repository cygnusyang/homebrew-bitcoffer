cask "bitcoffer" do
  version "2.21.6"
  sha256 "e371afe029c10974e31d24528fa9116535bc521b96e1138df1db7293daf0ed1c"

  # 产物仓（2026-11-03 源码私有化）：源码仓转 private 后其 Release 资产不服务
  # 匿名请求，cask 从私有仓下载会 404，故产物迁独立公开仓。
  url "https://github.com/cygnusyang/bitcoffer-releases/releases/download/v#{version}/Bitcoffer-v#{version}.dmg"
  name "Bitcoffer"
  desc "Local-first password manager with a read-only MCP server for AI agents"
  homepage "https://cygnusyang.github.io/bitcoffer-releases/en.html"

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
