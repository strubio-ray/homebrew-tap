# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal Homebrew tap (`strubio-ray/tap`) distributing:
- **Formulas** (`Formula/`): compiled software (`marvin-relay`, a Go relay server) and shell utilities (`clipssh`, clipboard-to-SSH tool — private repo, requires `HOMEBREW_GITHUB_API_TOKEN`)
- **Casks** (`Casks/`): macOS apps (currently `qlmarkdown` and `syntax-highlight` — unsigned QuickLook extensions)

## Common Commands

```bash
# Lint & validate
brew audit --formula --tap strubio-ray/tap
brew audit --cask --tap strubio-ray/tap
brew style strubio-ray/tap

# Check for upstream version updates
brew livecheck --tap strubio-ray/tap
brew livecheck --cask --tap strubio-ray/tap

# Bump a cask version (writes locally, no PR)
brew bump-cask-pr --write-only --no-audit --no-style "strubio-ray/tap/<cask-name>"
```

## CI/CD

- **`lint.yml`**: Runs on every push to main and all PRs. Audits formulas/casks, checks style, and runs cask livecheck.
- **`bump-casks.yml`**: Monthly cron (1st of month, 9 AM UTC) + manual dispatch. Detects outdated casks via `brew livecheck --json`, bumps versions, and opens a PR for review.

## Key Patterns

### Formulas
- Version sourced from GitHub tags via `livecheck { strategy :github_latest }`
- Build-time version embedding with Go ldflags (`-X main.version=#{version}`)
- Service block for launchd integration (`brew services start/stop`)
- Config files installed to `etc/<formula-name>/`
- Test block verifies `--version` output

### Casks
- Both casks are **unsigned** — the `postflight` block removes `com.apple.quarantine` via `xattr -dr` (this is the whole reason this tap exists instead of using homebrew-cask)
- Livecheck uses custom Sparkle strategy to work around Italian locale date parsing
- `auto_updates true` since both apps self-update via Sparkle
- `zap trash` lists all Library paths for clean uninstall

### Updating a formula version
1. Update `version` in the formula file
2. Download the new release tarball and compute `sha256`
3. Update the `sha256` in the formula
4. Run `brew audit --formula --tap strubio-ray/tap && brew style strubio-ray/tap`
