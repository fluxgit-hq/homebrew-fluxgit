cask "fluxgit" do
  arch arm: "aarch64", intel: "x64"

  version "0.7.2"
  sha256 arm:   "8cb497367e6a64318d39ba5ec2af11f0f07356500322af236793f01d2ba05e7b",
         intel: "43ee0af1477a43e141df1e02d7638ad7ec9c61203b8dd73d08a5912ed91c01af"

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
