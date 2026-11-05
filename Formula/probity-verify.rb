class ProbityVerify < Formula
  include Language::Python::Virtualenv

  desc "Check claims against pinned evidence offline, with replayable decisions"
  homepage "https://github.com/probityai/probity/tree/main/packages/probity-verify"
  url "https://files.pythonhosted.org/packages/3e/6e/29ef11a9950dc3264259562608f0116f864e4d0a3bd0e0354e266730e8b7/probity_verify-0.4.1.tar.gz"
  sha256 "d7a03cb479d909b2bdcf6fb64eca16210ec38fc92a4e9744ce35635065607f45"
  license "Apache-2.0"

  depends_on "cryptography"
  depends_on "libyaml"
  depends_on "python@3.14"

  resource "agent-evidence-vocabulary" do
    url "https://files.pythonhosted.org/packages/25/5c/150344bc7e76ce60b7fb4977d6c731e79f7b233ebc0ca0fdb6fda57e7d15/agent_evidence_vocabulary-0.9.0.tar.gz"
    sha256 "9958330e3f67a25d9625395078c8335af61b716ca897090386e597d1134a9c9f"
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
