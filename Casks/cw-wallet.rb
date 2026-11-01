cask "cw-wallet" do
  version "0.1.1"
  sha256 "632b6e7e57de077653f27086f53828aecdac97c45939b460055250bc8b3614d0"

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
