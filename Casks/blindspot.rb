cask "blindspot" do
  version "0.3.5"
  sha256 "498b11bb3067ac2828bd4d18b414ecdedfa4d331cd69128deb9f01296a06b23b"

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
