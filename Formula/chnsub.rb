class Chnsub < Formula
  include Language::Python::Virtualenv

  desc "Generate smart Chinese subtitles (SRT files)"
  homepage "https://github.com/benjajuang/chnsub"
  url url "https://github.com/benjajuang/chnsub-app/archive/v1.0.6.tar.gz"
  sha256 "27e8536f02d0a1419ff9c1692d67d0efec0524a9468b9324e017e0606a3e2346"

  depends_on "python@3.11"

  resource "yt-dlp" do
    url "https://files.pythonhosted.org/packages/7e/3a/343f7a0024ddd4c30f150e8d8f57fd7b924846f97d99fc0dcd75ea8d2773/yt_dlp-2025.7.21.tar.gz"
    sha256 "46fbb53eab1afbe184c45b4c17e9a6eba614be680e4c09de58b782629d0d7f43"
  end

  resource "openai" do
    url "https://files.pythonhosted.org/packages/d8/9d/52eadb15c92802711d6b6cf00df3a6d0d18b588f4c5ba5ff210c6419fc03/openai-1.98.0.tar.gz"
    sha256 "3ee0fcc50ae95267fd22bd1ad095ba5402098f3df2162592e68109999f685427"
  end

  resource "pysubs2" do
    url "https://files.pythonhosted.org/packages/31/4a/becf78d9d3df56e6c4a9c50b83794e5436b6c5ab6dd8a3f934e94c89338c/pysubs2-1.8.0.tar.gz"
    sha256 "3397bb58a4a15b1325ba2ae3fd4d7c214e2c0ddb9f33190d6280d783bb433b20"
  end

  resource "python-dotenv" do
    url "https://files.pythonhosted.org/packages/source/p/python-dotenv/python_dotenv-1.1.1.tar.gz"
    sha256 "a8a6399716257f45be6a007360200409fce5cda2661e3dec71d23dc15f6189ab"
  end

  resource "whisperx" do
    url "https://files.pythonhosted.org/packages/4e/97/38238c00ca5bdaaa3dfb3046179a6757ca2400643e746e605cd11941d451/whisperx-3.4.2.tar.gz"
    sha256 "5f07ec56b129ec5da3600459a645b6676c711e2e4f58f3e094617cabcc032a9b"
  end

  resource "transformers" do
    url "https://files.pythonhosted.org/packages/source/t/transformers/transformers-4.54.1.tar.gz"
    sha256 "b2551bb97903f13bd90c9467d0a144d41ca4d142defc044a99502bb77c5c1052"
  end

  def install
    virtualenv_install_with_resources
  end

  def caveats
    <<~EOS
      torch isn’t vendored (wheels‐only); after:
        brew install benjajuang/tools/chnsub
      you must then run once:
        pip3 install torch

      Then you can simply:
        chnsub --help
    EOS
  end

  test do
    assert_match "Generate smart Chinese subtitles", shell_output("#{bin}/chnsub --help")
  end
end
