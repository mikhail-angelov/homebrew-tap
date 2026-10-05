cask "vadic" do
  version "1.1.2"
  sha256 "0221c5984974459562fb65dc94b55f3bdd53a9eadafce646ba013e1cfb7c919a"

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

  # No "uninstall quit": Vadic watches its bundle and restarts itself after an upgrade, quits after an uninstall.

  zap trash: [
    "~/Library/Application Support/Vadic",
    "~/Library/Preferences/dev.vadic.Vadic.plist",
  ]

  caveats <<~EOS
    Start Vadic once to finish the setup:
      open -a Vadic
    It then adds itself to Login Items and starts with macOS; upgrades restart it automatically.
  EOS
end
