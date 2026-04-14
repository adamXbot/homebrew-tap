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

## Troubleshooting (Non-Notarized Apps)

Since these apps are currently not notarized, macOS may show a warning that the app is "damaged" or "from an unidentified developer."

To fix this, run the following command after installation:

```bash
xattr -cr /Applications/BananaBlitz.app
```
