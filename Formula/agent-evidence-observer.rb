class AgentEvidenceObserver < Formula
  include Language::Python::Virtualenv

  desc "Record brokered agent writes and check selected native reports offline"
  homepage "https://github.com/probityai/probity/tree/main/packages/agent-evidence-observer"
  url "https://files.pythonhosted.org/packages/6a/91/17d5f53b92d326765cce389dfd7e8b8400b39a0b6d54d16890a526187fab/agent_evidence_observer-0.2.0.tar.gz"
  sha256 "f2f9c775a941ef360bfda4eb55508d7f596a95082faa52521987303f6a94a714"
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
    assert_match "usage: agent-evidence-read-native", shell_output("#{bin}/agent-evidence-read-native --help")
  end
end
