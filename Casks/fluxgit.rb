cask "fluxgit" do
  arch arm: "aarch64", intel: "x64"

  version "0.7.1"
  sha256 arm:   "c2b04b26bc0f596f75a0bf7b022bde672b23e7e4ebec2a1899947b0f67746111",
         intel: "c8971302abd3eb2e03718ddb8e1a5b3b3dff5a990686c76abc267db68e33185b"

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
