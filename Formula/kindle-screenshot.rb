class KindleScreenshot < Formula
  desc "Grab screenshots of Kindle windows on macOS"
  homepage "https://github.com/benjajuang/kindle-screenshot"
  url "https://github.com/benjajuang/kindle-screenshot/archive/v1.0.0.tar.gz"
  sha256 "<PLACE_SHA256_HERE>"

  def install
    bin.install "screenshot.command" => "ksnap"
  end

  test do
    system "#{bin}/ksnap", "--help"
  end
end
