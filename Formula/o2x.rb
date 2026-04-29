class O2x < Formula
  desc "OAuth2 CLI for authentication with various OAuth2 flows"
  homepage "https://github.com/lucaskatayama/o2x"
  version "0.2.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lucaskatayama/o2x/releases/download/v0.2.3/o2x-darwin-arm64.tar.gz"
      sha256 "389bc7f6966296ccf7162eb380eee703c4431331ecefc272300071d623b1b596"
    else
      url "https://github.com/lucaskatayama/o2x/releases/download/v0.2.3/o2x-darwin-amd64.tar.gz"
      sha256 "6950615998c39cb99026eae505f5f0bef8f170f56478a9c6037c20a0df9e49e0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lucaskatayama/o2x/releases/download/v0.2.3/o2x-linux-arm64.tar.gz"
      sha256 "da25c2426db875d652c97dd015f7d37bcf2bef93c8a58a28fe638b7ab880fa89"
    else
      url "https://github.com/lucaskatayama/o2x/releases/download/v0.2.3/o2x-linux-amd64.tar.gz"
      sha256 "c14d5cba9fbb3d68473bfdf60eafed2ca3546460750a5da4a8ba1b78aa32412d"
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
