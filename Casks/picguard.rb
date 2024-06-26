# Documentation: https://docs.brew.sh/Cask-Cookbook
#                https://docs.brew.sh/Adding-Software-to-Homebrew#cask-stanzas
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
cask "picguard" do
  version "1.0.0+288"
  # https://docs.brew.sh/Cask-Cookbook#stanza-sha256
  sha256 :no_check

  # https://docs.brew.sh/Cask-Cookbook#stanza-url
  # https://docs.brew.sh/Cask-Cookbook#when-url-and-homepage-domains-differ-add-verified
  url "https://github.com/picguard/picguard/releases/download/v#{version}/PicGuard_#{version}_macos_universal.dmg",
      verified: "github.com/picguard/picguard/"
  name "PicGuard"
  desc "Your pictures, your signature"
  homepage "https://kjxbyz.com/picguard"

  # Documentation: https://docs.brew.sh/Brew-Livecheck
  livecheck do
    url :url
    strategy :git do |tags|
      tags.filter_map do |tag|
        match = tag&.match(/^v?(\d+(?:\.\d+)+(\+\d+)?)$/i)
        next if match.blank?

        match[1]
      end
    end
  end

  # https://docs.brew.sh/Cask-Cookbook#stanza-depends_on
  depends_on macos: ">= :catalina"

  # https://docs.brew.sh/Cask-Cookbook#stanza-app
  app "PicGuard.app"

  # https://docs.brew.sh/Cask-Cookbook#stanza-uninstall
  # uninstall quit: "com.kjxbyz.watermarkassistant.mac"

  # Documentation: https://docs.brew.sh/Cask-Cookbook#stanza-zap
  zap trash: []
end
