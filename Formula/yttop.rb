class Yttop < Formula
  include Language::Python::Virtualenv

  desc "Fetch top N YouTube videos from a channel/playlist and save titles + links"
  homepage "https://github.com/benjajuang/yttop"
  url "https://github.com/benjajuang/yttop/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "d65290883f53dd0aff7d6a3120929967d6c3145ab022747893d6a7cf21d06371"

  license "MIT"

  depends_on "python@3.12"

  # Homebrew will fill in Python dependencies here.
  resource "yt-dlp" do
    url "https://files.pythonhosted.org/packages/c8/af/d3c81af35ae2aef148d0ff78f001650ce5a7ca73fbd3b271eb9aab4c56ee/yt_dlp-2025.8.20.tar.gz"
    sha256 "da873bcf424177ab5c3b701fa94ea4cdac17bf3aec5ef37b91f530c90def7bcf"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    output = shell_output("#{bin}/yttop 2>&1", 1)
    assert_match "Usage:", output
  end
end
