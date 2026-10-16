class AgentEvidenceObserver < Formula
  include Language::Python::Virtualenv

  desc "Record brokered agent writes and check selected native reports offline"
  homepage "https://github.com/probityai/agent-evidence-observer"
  url "https://files.pythonhosted.org/packages/4c/4e/f90c44c917134a2400a166ff0997e7ce7ec50befd5e4e1810a1f6fbcbf6b/agent_evidence_observer-0.0.1.tar.gz"
  sha256 "144f17b69f0653c6bc218355a937e44f246e942b6821b689a8f948048ee55f0f"
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
