class AgentEvidenceObserver < Formula
  include Language::Python::Virtualenv

  desc "Record brokered agent writes and check selected native reports offline"
  homepage "https://github.com/probityai/probity/tree/main/packages/agent-evidence-observer"
  url "https://files.pythonhosted.org/packages/bd/c3/27f273c261189bceecc33ef62e6e686cb147b3e6f21abbbe89bc7445d0d8/agent_evidence_observer-0.1.3.tar.gz"
  sha256 "3face40feea33f3f870157fd652b430615cfe2b37d189d9afc45404d388ff694"
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
