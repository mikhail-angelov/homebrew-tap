cask "vadic" do
  version "1.1.1"
  sha256 "51ba315a95860ff99af720fd46c938f57cbba37ed5753eea5715524c465b14cd"

  url "https://github.com/mikhail-angelov/vadic/releases/download/v#{version}/Vadic-#{version}-macos-arm64.zip"
  name "Vadic"
  desc "Local push-to-talk dictation powered by whisper.cpp"
  homepage "https://github.com/mikhail-angelov/vadic"

  depends_on arch: :arm64
  depends_on formula: "whisper-cpp"
  depends_on macos: :sonoma

  app "Vadic.app"

  # Vadic isn't notarized, so Gatekeeper would refuse to open the quarantined download.
  # Cleared on the staged copy, before Homebrew moves it to the Applications folder.
  preflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "Vadic.app"],
        chdir:          ".",
        writable_paths: ["Vadic.app"]
  end

  uninstall quit: "dev.vadic.Vadic"

  zap trash: [
    "~/Library/Application Support/Vadic",
    "~/Library/Preferences/dev.vadic.Vadic.plist",
  ]
end
