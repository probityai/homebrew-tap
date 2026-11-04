class ProbityVerify < Formula
  include Language::Python::Virtualenv

  desc "Check claims against pinned evidence offline, with replayable decisions"
  homepage "https://github.com/probityai/probity/tree/main/packages/probity-verify"
  url "https://files.pythonhosted.org/packages/b3/f0/9a59dc99b652eea24b50540e7c665191c75405acf4a76b9c05941d817734/probity_verify-0.4.0.tar.gz"
  sha256 "3cc4b0498d991995ec934c240b84a927990669b8044083ffcb7b342c54302bbc"
  license "Apache-2.0"

  depends_on "cryptography"
  depends_on "libyaml"
  depends_on "python@3.14"

  resource "agent-evidence-vocabulary" do
    url "https://files.pythonhosted.org/packages/79/28/93d0b07850e4e2b565fb8e073cafa76af6481ea8f49eb5f71bf6a2087451/agent_evidence_vocabulary-0.8.0.tar.gz"
    sha256 "f18ccc35d1031ddaddf037985859f45d8ab90f1af63719ae1349834f1d1ddad4"
  end

  resource "pyyaml" do
    url "https://files.pythonhosted.org/packages/05/8e/961c0007c59b8dd7729d542c61a4d537767a59645b82a0b521206e1e25c2/pyyaml-6.0.3.tar.gz"
    sha256 "d76623373421df22fb4cf8817020cbb7ef15c725b9d5e45f17e189bfc384190f"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "usage: probity-verify", shell_output("#{bin}/probity-verify --help")
    assert_match "usage: probity-bundle", shell_output("#{bin}/probity-bundle --help")
    system libexec/"bin/python", "-c", "import probity_verify"
  end
end
