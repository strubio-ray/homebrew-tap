# homebrew-quicklook

A Homebrew tap for unsigned QuickLook extensions that are being removed from
the official Homebrew cask repository due to failing macOS Gatekeeper checks.

## Included Casks

| Cask | App | Version | Upstream |
|------|-----|---------|----------|
| `syntax-highlight` | Syntax Highlight | 2.1.27 | [sbarex/SourceCodeSyntaxHighlight](https://github.com/sbarex/SourceCodeSyntaxHighlight) |
| `qlmarkdown` | QLMarkdown | 1.0.24 | [sbarex/QLMarkdown](https://github.com/sbarex/QLMarkdown) |

## Why This Tap Exists

Starting September 1, 2026, Homebrew will remove casks that fail macOS
Gatekeeper checks (unsigned/unnotarized apps). Both apps above are affected.
Homebrew 5.0.0 also deprecates the `--no-quarantine` flag.

This tap provides the same cask definitions with an added `postflight` hook
that automatically removes the macOS quarantine extended attribute after
installation, allowing the apps to launch without Gatekeeper warnings.

## Installation

```bash
# Add the tap
brew tap strubio-ray/quicklook

# Install casks
brew install --cask strubio-ray/quicklook/syntax-highlight
brew install --cask strubio-ray/quicklook/qlmarkdown
```

After installation, open **System Settings > Privacy & Security > Extensions >
Quick Look** to enable the extensions.

## Updating

The tap updates automatically when you run `brew update`. To upgrade the
casks:

```bash
brew upgrade --cask syntax-highlight
brew upgrade --cask qlmarkdown
```

Livecheck is configured to track upstream Sparkle appcast feeds, so
`brew livecheck` will detect new releases:

```bash
brew livecheck --tap strubio-ray/quicklook
```

## Security Notice

**These applications are not signed or notarized by Apple.** This tap
automatically removes the macOS quarantine attribute to allow installation.
By using this tap, you acknowledge that:

- You trust the upstream developer ([sbarex](https://github.com/sbarex))
- You understand that unsigned apps bypass macOS Gatekeeper protections
- You accept the security implications of running unverified software

The sha256 checksums in each cask definition verify download integrity
against the expected release artifacts.

## License

MIT
