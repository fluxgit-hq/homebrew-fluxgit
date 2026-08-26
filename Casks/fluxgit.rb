cask "fluxgit" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.4"
  sha256 arm:   "6bee2d598de808ac60998cb3b18a640c289174fdbbf702371652b8f436cda920",
         intel: "1751a375af79b84e78a441eee68e770955f4d7c437906f576e68b832e8e9ae6f"

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
