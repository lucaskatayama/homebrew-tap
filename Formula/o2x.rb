class O2x < Formula
  desc "OAuth2 CLI for authentication with various OAuth2 flows"
  homepage "https://github.com/lucaskatayama/o2x"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lucaskatayama/o2x/releases/download/v0.2.1/o2x-darwin-arm64.tar.gz"
      sha256 "5112db40930588205d547488cebac6af1e8f875c547eabe8a5f29b48eab4eed8"
    else
      url "https://github.com/lucaskatayama/o2x/releases/download/v0.2.1/o2x-darwin-amd64.tar.gz"
      sha256 "b26dfa76f8815130caf0f0fc161a7ac904486c1bed164918a36ce49ce8242cb8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lucaskatayama/o2x/releases/download/v0.2.1/o2x-linux-arm64.tar.gz"
      sha256 "91f3e6f4a62448948e02350ab89bb0ddbebab03d69451b3d426f1fe02cc010fe"
    else
      url "https://github.com/lucaskatayama/o2x/releases/download/v0.2.1/o2x-linux-amd64.tar.gz"
      sha256 "7dda1970dae6f3063db28fc723ca1c008aaa1613bcece6b8fb24028e2247a88b"
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