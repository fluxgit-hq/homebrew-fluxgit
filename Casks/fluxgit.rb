cask "fluxgit" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.8"
  sha256 arm:   "7727a72d413bad8a5919e8d3bb066063a10d3e6062050188ff0d693552d8d725",
         intel: "003e1e8007c2c17b0bfec07a783baa156a613a0b6ea55038c29b832cf83f610e"

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
