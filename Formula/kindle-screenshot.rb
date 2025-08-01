class KindleScreenshot < Formula
  desc "Grab screenshots of Kindle windows on macOS"
  homepage "https://github.com/benjajuang/kindle-screenshot"
  url "https://github.com/benjajuang/kindle-screenshot/archive/v1.0.1.tar.gz"
  sha256 "121e9d20052835e5d96f43a30ebf8e07eef7a5b23eb993cc48b221b0c551010f"

  def install
    bin.install "screenshot.command" => "ksnap"
  end

  test do
    system "#{bin}/ksnap", "--help"
  end
end
