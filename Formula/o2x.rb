class O2x < Formula
  desc "Convert JSON to XML and XML to JSON"
  homepage "https://github.com/lucaskatayama/o2x"
  version "dev"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lucaskatayama/o2x/releases/download/dev/o2x-darwin-arm64.tar.gz"
      sha256 "2c5db3faefae6d2a60138f1c61c53151d15dffd401fbfa6e8d7156b7b9a19e85"
    else
      url "https://github.com/lucaskatayama/o2x/releases/download/dev/o2x-darwin-amd64.tar.gz"
      sha256 "2d6c5e2dc18b24e1d96364a74847f920c6f35f493649b63bcd4cca6290c45a78"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lucaskatayama/o2x/releases/download/dev/o2x-linux-arm64.tar.gz"
      sha256 "7becd3c27d4e18ba6fea3376da588dc8bbe5834175cf35a73397299ff7396b6e"
    else
      url "https://github.com/lucaskatayama/o2x/releases/download/dev/o2x-linux-amd64.tar.gz"
      sha256 "6f354c09ba4cff6a81c7b62e1077f18b789bd4ee5e3e6cef83e2e972007ea078"
    end
  end

  def install
    arch = Hardware::CPU.arch == :arm64 ? "arm64" : "amd64"
    os = OS.mac? ? "darwin" : "linux"
    bin.install "o2x-#{os}-#{arch}" => "o2x"
  end

  test do
    system "#{bin}/o2x", "--version"
  end
end