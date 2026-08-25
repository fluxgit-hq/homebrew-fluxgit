cask "fluxgit" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.3"
  sha256 arm:   "80dd2b136a991a1d358adcc1e80d785533e1fb7f69e036a00e624f3209b03de3",
         intel: "7c5269dbf09d4bf9414f812e913aa585984eb9197c50d18281f5bea2415551af"

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
