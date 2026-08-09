# adamXbot/homebrew-tap

Homebrew tap for the macOS apps I publish under [adamXbot](https://github.com/adamXbot).

[![Project status](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2FadamXbot%2F.github%2Fmain%2Fbadges%2Fhomebrew-tap.json)](https://github.com/adamXbot/.github/blob/main/STATUS.md#homebrew-tap)

<!-- disclosure:start -->
> [!WARNING]
> **Project status.** The badge above is generated from [the adamXbot status list](https://github.com/adamXbot/.github/blob/main/STATUS.md), which says what I promise for this project and every other one.
<!-- disclosure:end -->

---

## What this tap serves

One cask. This repository holds the package definition only — no build logic,
no source.

| Package | Kind | What it is | Built by |
| --- | --- | --- | --- |
| [`bananablitz`](Casks/bananablitz.rb) | Cask | macOS utility that cleans telemetry and tracking data | [adamXbot/BananaBlitz](https://github.com/adamXbot/BananaBlitz) |

The consumers are people running `brew`, not other repositories. Nothing else
in the portfolio depends on this tap at build time, and no release workflow
writes to it — BananaBlitz's release job attaches a DMG to its GitHub release
and updates its Sparkle appcast, and stops there.

## Using the tap

```sh
brew tap adamxbot/tap
brew install --cask bananablitz
```

The fully-qualified name works without tapping first, and stays unambiguous if
a package of the same name ever appears in homebrew/cask:

```sh
brew install --cask adamxbot/tap/bananablitz
```

Upgrading is ordinary Homebrew:

```sh
brew update
brew upgrade
```

To remove the app and the tap:

```sh
brew uninstall --cask bananablitz
brew untap adamxbot/tap
```

### If macOS refuses to open the app

The cask runs a `postflight` that strips `com.apple.quarantine` from the
installed bundle, and its caveats print the same command in case macOS still
reports the app as damaged or from an unidentified developer:

```sh
xattr -cr /Applications/BananaBlitz.app
```

## The version contract

This repository has no releases and no tags, so there is no tap version to pin
against. `brew tap` tracks the default branch: whatever is on `main` is what
every tap user resolves on their next `brew update`.

Versions are per-package instead. `Casks/bananablitz.rb` pins an exact
`version` and `sha256` against a release asset in the BananaBlitz repository.
There is no `livecheck` block and no automation that opens bump pull requests
here, so a version bump is a hand edit.

That gap is live right now: the cask pins **0.0.2**, while the most recent
BananaBlitz release is
[v0.0.3](https://github.com/adamXbot/BananaBlitz/releases/tag/v0.0.3), from
April 2026. Anyone installing from this tap today gets 0.0.2. Closing that gap
is a separate change, not something this README papers over.

If you need to hold whatever you have installed, `brew pin bananablitz` freezes
it against `brew upgrade`.

## Changing anything here safely

`main` is covered by an active ruleset that requires a pull request and blocks
force-pushes and deletion, so nothing lands directly. That matters because the
blast radius of a bad merge is every tap user: a cask that fails to parse
breaks `brew update` for anyone who has this tap installed, not only the people
who installed the package.

Check a change before you merge it:

```sh
ruby -c Casks/bananablitz.rb        # parses?
brew readall adamxbot/tap           # loads? (needs the tap installed)
```

To bump a version by hand, take the `sha256` from the new release asset rather
than trusting the release notes:

```sh
curl -sL https://github.com/adamXbot/BananaBlitz/releases/download/vX.Y.Z/BananaBlitz.dmg | shasum -a 256
```

There is no CI on `main` today. A syntax gate that runs `ruby -c` and
`brew readall` on pull requests is proposed in
[#1](https://github.com/adamXbot/homebrew-tap/pull/1) and has not been merged.

Long stretches with no commits are the intended state for a tap. A package
definition that still matches its upstream release and that nobody has needed
to touch is healthy, not abandoned — the thing to watch is the version drift
above, not the commit date.
