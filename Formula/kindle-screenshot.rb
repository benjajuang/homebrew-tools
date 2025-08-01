class KindleScreenshot < Formula
  desc "Grab screenshots of Kindle windows on macOS"
  homepage "https://github.com/benjajuang/kindle-screenshot"
  url "https://github.com/benjajuang/kindle-screenshot/archive/v1.0.0.tar.gz"
  sha256 "ebaa8e6713596dfc182ad05701bccb598ef7e4bfcf6668f9cdc86b6e4907d560"

  def install
    bin.install "screenshot.command" => "ksnap"
  end

  test do
    system "#{bin}/ksnap", "--help"
  end
end
