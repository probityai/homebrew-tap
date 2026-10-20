class AgentEvidenceObserver < Formula
  include Language::Python::Virtualenv

  desc "Record brokered agent writes and check selected native reports offline"
  homepage "https://github.com/probityai/probity/tree/main/packages/observer"
  url "https://files.pythonhosted.org/packages/dd/2c/5d28d0c35c2cec610056949f48d14c53bd7715a3f9a7c0706a15a9776f6f/agent_evidence_observer-0.0.2.tar.gz"
  sha256 "f358837bf09c793887972a4164b21bbdc7121a8cb75492a715dc5626159b0b90"
  license "Apache-2.0"

  depends_on "cryptography"
  depends_on "python@3.14"

  resource "rfc8785" do
    url "https://files.pythonhosted.org/packages/ef/2f/fa1d2e740c490191b572d33dbca5daa180cb423c24396b856f5886371d8b/rfc8785-0.1.4.tar.gz"
    sha256 "e545841329fe0eee4f6a3b44e7034343100c12b4ec566dc06ca9735681deb4da"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "usage: agent-evidence-observer", shell_output("#{bin}/agent-evidence-observer --help")
    assert_match "usage: agent-evidence-admit", shell_output("#{bin}/agent-evidence-admit --help")
  end
end
