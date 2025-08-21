class KindleOcr < Formula
  desc "Scripts for screenshotting Kindle pages and extracting text via OCR on macOS"
  homepage "https://github.com/benjajuang/kindleocr"
  url "https://github.com/benjajuang/kindleocr/archive/refs/tags/v1.0.0.tar.gz"  # Replace with your tarball URL
  sha256 "your-sha256-hash-here"  # Replace with the computed SHA256
  version "1.0.0"  # Match your release tag

  # Dependencies: Add or remove based on needs
  depends_on "python@3.12"
  depends_on "tesseract"

  def install
    bin.install "kindle_to_text.sh" => "kindle-ocr"
    bin.install "ocr_images.py"
    bin.install "Run_Kindle_OCR.command"
  end

  def caveats
    <<~EOS
      Ensure Terminal has permissions: Screen Recording, Accessibility, Automation.
      Install Python deps: pip3 install pytesseract pillow.
      Usage: kindle-ocr
    EOS
  end

  test do
    true  # Or add a real test if needed
  end
end