cask "blindspot" do
  version "0.3.0"
  sha256 "8d9b6f8fef1d9f7fad23162ec6f6bb0b935db82700b293cc6eece1ad8a714f41"

  url "https://github.com/abhichandra21/Blindspot/releases/download/v#{version}/Blindspot.zip"
  name "Blindspot"
  desc "Menu bar warning when a Teams chat may be visible in your screen share"
  homepage "https://github.com/abhichandra21/Blindspot"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Blindspot.app"

  uninstall quit: "com.abhichandra.blindspot"

  zap launchctl: "com.abhichandra.blindspot",
      trash:     [
        "~/Library/LaunchAgents/com.abhichandra.blindspot.plist",
        "~/Library/Preferences/com.abhichandra.blindspot.plist",
      ]

  caveats <<~EOS
    Blindspot is not signed by Apple, so macOS blocks the first launch.
    Open it once from Applications, then go to System Settings > Privacy & Security
    and click Open Anyway. See:
      https://github.com/abhichandra21/Blindspot/blob/main/docs/INSTALL.md

    Blindspot needs Screen Recording to read window titles. Accessibility is optional
    and only needed if you turn on minimizing. After an update, macOS may ask again.
  EOS
end
