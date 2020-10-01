cask "github-beta" do
  version "2.5.6-beta3-bbd5050e"
  sha256 "6eff4e9a9fd91bc04494b500e2f72400ab81e0e7cf48f08d25f24e0f5becb961"

  # desktop.githubusercontent.com/ was verified as official when first introduced to the cask
  url "https://desktop.githubusercontent.com/releases/#{version}/GitHubDesktop.zip"
  appcast "https://github.com/desktop/desktop/releases.atom"
  name "GitHub Desktop"
  homepage "https://desktop.github.com/"

  auto_updates true

  app "GitHub Desktop.app"
  binary "#{appdir}/GitHub Desktop.app/Contents/Resources/app/static/github.sh", target: "github"

  zap trash: [
    "~/Library/Application Support/GitHub Desktop",
    "~/Library/Application Support/com.github.GitHubClient",
    "~/Library/Application Support/com.github.GitHubClient.ShipIt",
    "~/Library/Application Support/ShipIt_stderr.log",
    "~/Library/Application Support/ShipIt_stdout.log",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.github.GitHubClient.sfl*",
    "~/Library/Caches/com.github.GitHubClient",
    "~/Library/Caches/com.github.GitHubClient.ShipIt",
    "~/Library/Preferences/com.github.GitHubClient.helper.plist",
    "~/Library/Preferences/com.github.GitHubClient.plist",
  ],
      rmdir: "~/.config/git"
end
