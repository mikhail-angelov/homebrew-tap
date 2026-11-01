cask "cw-wallet" do
  version "0.1.0"
  sha256 "d82f7f4b9b253dbfe4ad7d2d2b335eb4a2f7e0483dcc6b843b9c0d1bca28ce48"

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
