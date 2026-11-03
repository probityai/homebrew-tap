class AgentEvidenceVectors < Formula
  include Language::Python::Virtualenv

  desc "Conformance corpora and reference verifiers for agent evidence records"
  homepage "https://github.com/probityai/agent-evidence-vectors"
  url "https://files.pythonhosted.org/packages/e2/f7/4b1c0674afdae3a5104ee29e9aa33bc85ffbe6c4f379813e63304a3ff49c/agent_evidence_vectors-0.31.0.tar.gz"
  sha256 "ee3a20eb9d20d149cfd5d4f731c3653b8ea1e29e7f0dbbabec9118f686a90554"
  license "Apache-2.0"

  depends_on "python@3.14"

  def install
    virtualenv_install_with_resources
  end

  test do
    # Runs the bundled conformance vectors against the reference verifier.
    assert_match "PASS", shell_output("#{bin}/agent-evidence-vectors")
    assert_match "usage: agent-evidence-heldout", shell_output("#{bin}/agent-evidence-heldout --help")
  end
end
