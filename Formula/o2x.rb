class O2x < Formula
  desc "OAuth2 CLI for authentication with various OAuth2 flows"
  homepage "https://github.com/lucaskatayama/o2x"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lucaskatayama/o2x/releases/download/v0.2.0/o2x-darwin-arm64.tar.gz"
      sha256 "ffc1b048bec2403176986c24ae17d221ecc1329df96eb1181ec4ba0f31114731"
    else
      url "https://github.com/lucaskatayama/o2x/releases/download/v0.2.0/o2x-darwin-amd64.tar.gz"
      sha256 "03c4263664f49378ca330e753a5100d076d4ed8d273ff57fcf4a357dd6a520bb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lucaskatayama/o2x/releases/download/v0.2.0/o2x-linux-arm64.tar.gz"
      sha256 "48557aa07a83c4f7ab511af795d97ce086bc55e2d9e9efba406ad99d11272355"
    else
      url "https://github.com/lucaskatayama/o2x/releases/download/v0.2.0/o2x-linux-amd64.tar.gz"
      sha256 "9e5e0ac30ac6010a72f3c91110dbdc9abbbaef669ede4b4de5fd352b2e67e3f6"
    end
  end

  def install
    arch = Hardware::CPU.arch == :arm64 ? "arm64" : "amd64"
    os = OS.mac? ? "darwin" : "linux"
    bin.install "o2x-#{os}-#{arch}" => "o2x"
  end

  test do
    assert_match "OAuth2", shell_output("#{bin}/o2x --help")
  end
end