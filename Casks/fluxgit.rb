cask "fluxgit" do
  arch arm: "aarch64", intel: "x64"

  version "0.7.3"
  sha256 arm:   "65abfccb056d933494c1a1bd9fd7801eb978e79ca4c6332135057c19e3a012c7",
         intel: "34950b809729178adf243bed701bed8bd5fb079e41b2abfb2bc52eaafc2488d2"

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
