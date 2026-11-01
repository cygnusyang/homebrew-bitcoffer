# homebrew-bitcoffer

Homebrew tap for [Bitcoffer](https://github.com/cygnusyang/coffer) — a local-first password manager for macOS with a read-only MCP server for AI coding agents.

## Install

```bash
brew install --cask cygnusyang/bitcoffer/bitcoffer
```

Recent Homebrew versions require an explicit trust step for third-party taps. If the command above stops with *"Refusing to load cask … from untrusted tap"*, run this once and repeat the install:

```bash
brew trust cygnusyang/bitcoffer
```

Or tap first:

```bash
brew tap cygnusyang/bitcoffer
brew install --cask bitcoffer
```

Requires macOS 14 (Sonoma) or later, Apple Silicon or Intel.

## Upgrade / uninstall

```bash
brew upgrade --cask bitcoffer    # or let Bitcoffer's built-in OTA updater handle it
brew uninstall --cask bitcoffer  # keeps your vault data
brew uninstall --zap --cask bitcoffer
```

`--zap` removes caches and preferences only. **Vault data in `~/.bitcoffer/vaults` is never removed** — delete it yourself only after making a backup.

## Maintenance

`Casks/bitcoffer.rb` pins the GitHub release version and the DMG SHA-256. After each Bitcoffer release:

```bash
# take version + digest from the release asset
gh release view vX.Y.Z --repo cygnusyang/bitcoffer --json assets \
  --jq '.assets[] | select(.name | endswith(".dmg")) | "\(.name) \(.digest)"'

# update version and sha256 in Casks/bitcoffer.rb, then
brew audit --cask --online cygnusyang/bitcoffer/bitcoffer
brew style Casks/bitcoffer.rb
brew install --cask cygnusyang/bitcoffer/bitcoffer   # verify
```

The DMG is signed with a Developer ID certificate and notarized by Apple, so `brew install` does not need `--no-quarantine`.
