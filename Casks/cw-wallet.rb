cask "cw-wallet" do
  version "0.2.0"
  sha256 "d9ae10d0e43d4467c8239ff920fa27d94eeaf7f03a380fdc27586c426048a09f"

  url "https://github.com/mikhail-angelov/cw/releases/download/v#{version}/CW-Wallet-#{version}-macos-universal.zip"
  name "CW Wallet"
  desc "Local Ethereum and USDT wallet for macOS"
  homepage "https://github.com/mikhail-angelov/cw"

  app "CW Wallet.app"

  caveats <<~EOS
    This build is ad-hoc signed and not notarized. macOS may ask you to
    approve it in System Settings > Privacy & Security on first launch.
  EOS
end
