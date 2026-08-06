# Homebrew Tap for adamxbot

This repository contains Homebrew Casks for applications developed by adamxbot.

## How to use

### 1. Add the tap
```bash
brew tap adamxbot/tap
```

### 2. Install an app
For example, to install BananaBlitz:
```bash
brew install --cask bananablitz
```

## Available Apps

| App | Description | Command |
| --- | --- | --- |
| **BananaBlitz** | macOS Privacy Utility | `brew install --cask bananablitz` |

## How updates land here (maintainers)

Cask updates arrive as **pull requests**, not direct pushes to `main`:

1. A release in the app's source repo — via the shared release workflow in
   [privacykey/gh-workflows](https://github.com/privacykey/gh-workflows) — renders the
   cask with the new version, download URL, and SHA-256, and opens a PR against this tap.
2. The [`Tap syntax`](.github/workflows/tests.yml) check verifies that every cask and
   formula still parses and loads (`ruby -c` + `brew readall`).
3. A maintainer reviews and merges. `brew update && brew upgrade --cask <name>` then
   picks up the new version.

Manual bumps follow the same path: edit the cask on a branch and open a PR.

## Troubleshooting (Non-Notarized Apps)

Since these apps are currently not notarized, macOS may show a warning that the app is "damaged" or "from an unidentified developer."

To fix this, run the following command after installation:

```bash
xattr -cr /Applications/BananaBlitz.app
```
