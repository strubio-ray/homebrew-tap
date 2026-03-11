# homebrew-tap

A personal Homebrew tap for tools and utilities.

## Installation

```bash
brew tap strubio-ray/tap
```

## Formulas

| Formula | Description | Install |
|---------|-------------|---------|
| `marvin-relay` | Go relay server bridging Amazing Marvin webhooks to Apple Live Activities | `brew install strubio-ray/tap/marvin-relay` |
| `clipssh` | Send clipboard screenshots to remote SSH hosts | `brew install strubio-ray/tap/clipssh` |

### marvin-relay

Runs as a launchd service via `brew services`:

```bash
brew install strubio-ray/tap/marvin-relay
brew services start marvin-relay
brew services log marvin-relay
```

### clipssh

Requires `HOMEBREW_GITHUB_API_TOKEN` (see [Auth Setup](#auth-setup-private-formulas) below).

```bash
brew install strubio-ray/tap/clipssh
clipssh user@myserver
```

## Casks

Unsigned QuickLook extensions removed from the official Homebrew cask repository
due to failing macOS Gatekeeper checks.

| Cask | App | Version | Upstream |
|------|-----|---------|----------|
| `syntax-highlight` | Syntax Highlight | 2.1.27 | [sbarex/SourceCodeSyntaxHighlight](https://github.com/sbarex/SourceCodeSyntaxHighlight) |
| `qlmarkdown` | QLMarkdown | 1.0.24 | [sbarex/QLMarkdown](https://github.com/sbarex/QLMarkdown) |

```bash
brew install --cask strubio-ray/tap/syntax-highlight
brew install --cask strubio-ray/tap/qlmarkdown
```

After installation, open **System Settings > Privacy & Security > Extensions >
Quick Look** to enable the extensions.

## Updating

```bash
brew update
brew upgrade            # upgrades all installed formulas and casks
brew livecheck --cask --tap strubio-ray/tap   # check for new upstream cask versions
```

Formula versions are bumped automatically when source repos push new tags.

## Security Notice (QuickLook Casks)

**The QuickLook applications are not signed or notarized by Apple.** This tap
automatically removes the macOS quarantine attribute to allow installation.
By using these casks, you acknowledge that:

- You trust the upstream developer ([sbarex](https://github.com/sbarex))
- You understand that unsigned apps bypass macOS Gatekeeper protections
- You accept the security implications of running unverified software

The sha256 checksums in each cask definition verify download integrity
against the expected release artifacts.

## Auth Setup (Private Formulas)

`clipssh` is distributed from a private GitHub repository. To install and update it:

1. Create a GitHub PAT with `repo` scope (or fine-grained: Contents read + Metadata read on `strubio-ray/clipssh`)
2. Add to your shell profile:
   ```bash
   export HOMEBREW_GITHUB_API_TOKEN="your-token-here"
   ```

## License

MIT
