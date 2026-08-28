cask "fluxgit" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.5"
  sha256 arm:   "016b6c079b4011b0f6748fbd934f99745ec7003609955a0528b41ce176e14ce3",
         intel: "70ef68130f01a5ede63af110b6666fc653e37febeea96d6530555c55441ef6ed"

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
