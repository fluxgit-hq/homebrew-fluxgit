cask "fluxgit" do
  arch arm: "aarch64", intel: "x64"

  version "0.7.0"
  sha256 arm:   "9ea6d56e7a268a7957bc02411529feb1d7f8989b335dda499f1b885a3a70f116",
         intel: "6434c61faa902f9d5d9c9f4c18b0253ce7299033441c2d1f552174995a381e6d"

  url "https://downloads.fluxgit.com/beta/FluxGit_#{version}_#{arch}.dmg"
  name "FluxGit"
  desc "Git client where AI agents propose changes for human approval"
  homepage "https://fluxgit.com/"

  livecheck do
    url "https://api.fluxgit.com/v1/latest-release?channel=beta"
    strategy :json do |json|
      json["version"]
    end
  end

  auto_updates true
  depends_on :macos

  app "FluxGit.app"

  zap trash: [
    "~/Library/Application Support/com.fluxgit.desktop",
    "~/Library/Caches/com.fluxgit.desktop",
    "~/Library/Logs/com.fluxgit.desktop",
    "~/Library/Preferences/com.fluxgit.desktop.plist",
    "~/Library/Saved Application State/com.fluxgit.desktop.savedState",
    "~/Library/WebKit/com.fluxgit.desktop",
  ]
end
