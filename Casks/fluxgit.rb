cask "fluxgit" do
  arch arm: "aarch64", intel: "x64"

  version "0.7.5"
  sha256 arm:   "9eb251ea4bd55d83789e6df59664e3e5c794cc190794102cf81c77c047be47cc",
         intel: "64c64be71094867ffaa3afedb93334228025bec235bd3bb008188fa51e00b6ef"

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
