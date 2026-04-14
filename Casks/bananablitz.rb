cask "bananablitz" do
  version "0.0.2"
  sha256 "a16670823fe115c38f074310e78d2b730c4680354ba009593481e4f2df45db2a"

  url "https://github.com/adamXbot/BananaBlitz/releases/download/v#{version}/BananaBlitz.dmg"
  name "BananaBlitz"
  desc "macOS Privacy Utility to clean telemetry and tracking data"
  homepage "https://github.com/adamXbot/BananaBlitz"

  app "BananaBlitz.app"

  postflight do
    system_command "/usr/bin/xattr",
                  args:         [
                    "-dr",
                    "com.apple.quarantine",
                    "#{appdir}/BananaBlitz.app",
                  ]
  end

  caveats <<~EOS
    #{token} is not notarized. If you see a warning that it's damaged or from an unidentified developer,
    you can bypass it by running the following command in your terminal:

      xattr -cr /Applications/BananaBlitz.app
  EOS
end
