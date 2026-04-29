class O2x < Formula
  desc "OAuth2 CLI for authentication with various OAuth2 flows"
  homepage "https://github.com/lucaskatayama/o2x"
  version "0.2.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lucaskatayama/o2x/releases/download/v0.2.2/o2x-darwin-arm64.tar.gz"
      sha256 "ec3e5909772a216616e0261730ad7f8bc4a36a2351643ecc4d330f33173c01ea"
    else
      url "https://github.com/lucaskatayama/o2x/releases/download/v0.2.2/o2x-darwin-amd64.tar.gz"
      sha256 "68627a4b4dd40ebda75ddfdd8af2403b464490038221a413281c75c2e616979b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lucaskatayama/o2x/releases/download/v0.2.2/o2x-linux-arm64.tar.gz"
      sha256 "a0e53a90dadf0b0cf91de464ab99faed5adc5d1a7da7374b4bc55062b65c78b9"
    else
      url "https://github.com/lucaskatayama/o2x/releases/download/v0.2.2/o2x-linux-amd64.tar.gz"
      sha256 "22d29861c6a5b8133a87a645f43459be4f14580e592497d104cb0dd9d967e8e9"
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
