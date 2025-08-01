class Chnsub < Formula
  desc "Generate smart Chinese subtitles (SRT files)"
  homepage "https://github.com/benjajuang/chnsub"
  url "https://github.com/benjajuang/chnsub/archive/v1.0.0.tar.gz"
  sha256 "39d342ca90621be8b7083acd2d55f996b1bd28dbcfe1b3c62792ab03b47c7200"

  depends_on "python@3.11"

  def install
    libexec.install Dir["*"]
    # create a wrapper `chnsub` in bin/ that invokes your main script
    bin.write_exec_script "#{libexec}/main.py"
  end

  def caveats
    <<~EOS
      chnsub has been installed, but you must still install its Python dependencies:
        pip3 install --upgrade -r #{opt_libexec}/requirements.txt

      If you prefer, you can use a virtualenv:
        python3 -m venv ~/.venvs/chnsub
        source ~/.venvs/chnsub/bin/activate
        pip install --upgrade -r #{opt_libexec}/requirements.txt

      Then just run:
        chnsub --help
    EOS
  end

  test do
    # this will at least verify the wrapper exists
    assert_predicate bin/"chnsub", :exist?
  end
end
