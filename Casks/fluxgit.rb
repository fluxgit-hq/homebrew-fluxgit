cask "fluxgit" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.7"
  sha256 arm:   "8d3e8c96632abc650daf969b23f129e5677cb19f4fac136a32e4d19c7a937f0f",
         intel: "513d2a214de8f9e90fd815bf3949408623a4e70d4ca4b8b79fab7d4c2f275083"

  url "https://downloads.fluxgit.com/beta/FluxGit_#{version}_#{arch}.dmg"
  name "FluxGit"
  desc "Let AI agents use Git. You approve every write"
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
