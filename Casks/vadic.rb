cask "vadic" do
  version "1.0.0"
  sha256 "b9c227aeb5d7d9ee1949390e64a96bb7bb092fae830a9b6a86b6a69726da02a0"

  url "https://github.com/mikhail-angelov/vadic/releases/download/v#{version}/Vadic-#{version}-macos-arm64.zip"
  name "Vadic"
  desc "Local push-to-talk dictation powered by whisper.cpp"
  homepage "https://github.com/mikhail-angelov/vadic"

  depends_on arch: :arm64
  depends_on macos: ">= :sonoma"
  depends_on formula: "whisper-cpp"

  app "Vadic.app"

  # Vadic isn't notarized, so Gatekeeper would refuse to open the quarantined download.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Vadic.app"]
  end

  uninstall quit: "dev.vadic.Vadic"

  zap trash: [
    "~/Library/Application Support/Vadic",
    "~/Library/Preferences/dev.vadic.Vadic.plist",
  ]
end
