cask "brave-browser-dev" do
  arch = Hardware::CPU.intel? ? "x64" : "arm64"
  folder = Hardware::CPU.intel? ? "dev" : "dev-arm64"

  version "1.33.76.0,133.76"

  if Hardware::CPU.intel?
    sha256 "9e60e5c1c4cafb05581706744c6515ce8a6578cb9c122fc5e7a737375187d388"
  else
    sha256 "40ae6b44709b6c5d6660ef0029732fbadcc1f25e776c946b662134732954ec66"
  end

  url "https://updates-cdn.bravesoftware.com/sparkle/Brave-Browser/#{folder}/#{version.after_comma}/Brave-Browser-Dev-#{arch}.dmg",
      verified: "updates-cdn.bravesoftware.com/sparkle/Brave-Browser/"
  name "Brave Dev"
  desc "Web browser focusing on privacy"
  homepage "https://brave.com/download-dev/"

  livecheck do
    url "https://updates.bravesoftware.com/sparkle/Brave-Browser/#{folder}/appcast.xml"
    strategy :sparkle
  end

  auto_updates true

  app "Brave Browser Dev.app"

  zap trash: [
    "~/Library/Application Support/brave",
    "~/Library/Preferences/com.electron.brave.plist",
    "~/Library/Saved Application State/com.electron.brave.savedState",
  ]
end
