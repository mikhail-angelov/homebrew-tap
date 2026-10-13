cask "shotmark" do
  arch arm: "arm64", intel: "x86_64"

  version "1.0.1"
  sha256 arm:   "4ac28798b2f519c11a511ccb78ce840812aee2f7c33fb9af55b7c11b5a88a8bd",
         intel: "416abb664b2dffc6942fe29064b91d199eeb02d0d4a699f03e68a93aced3ae55"

  url "https://github.com/mikhail-angelov/captureScreenJs/releases/download/v#{version}/ShotMark-#{version}-macos-#{arch}.zip"
  name "ShotMark"
  desc "Screenshot annotator: arrows, text, shapes, marker, blur and crop"
  homepage "https://github.com/mikhail-angelov/captureScreenJs"

  depends_on macos: :sonoma

  app "ShotMark.app"

  # ShotMark isn't notarized, so Gatekeeper would refuse to open the quarantined download.
  # Cleared on the staged copy, before Homebrew moves it to the Applications folder.
  preflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "ShotMark.app"],
        chdir:          ".",
        writable_paths: ["ShotMark.app"]
  end

  # The menu bar agent and its editor keep running from the old bundle otherwise.
  uninstall quit: [
    "com.mikhailangelov.shotmark",
    "com.mikhailangelov.shotmark.editor",
  ]

  zap trash: [
    "~/Library/Application Support/com.mikhailangelov.shotmark",
    "~/Library/LaunchAgents/com.mikhailangelov.shotmark.watcher.plist",
  ]

  caveats <<~EOS
    Start ShotMark from the Applications folder or with:
      open -a ShotMark
    It lives in the menu bar and opens new screenshots from the watched folder (~/Documents by default).
    Upgrades quit it; open it again afterwards.
  EOS
end
