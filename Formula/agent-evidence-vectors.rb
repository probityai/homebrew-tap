class AgentEvidenceVectors < Formula
  include Language::Python::Virtualenv

  desc "Conformance corpora and reference verifiers for agent evidence records"
  homepage "https://github.com/probityai/agent-evidence-vectors"
  url "https://files.pythonhosted.org/packages/ce/12/8d8c1d8564d0d64563fc1d13e46b23ea3c9a3892eaf28366d0fe199e63d6/agent_evidence_vectors-0.37.0.tar.gz"
  sha256 "245591b9b0e98f9d32d4eb80efadf492fd902399223f89b53c7023308db21f47"
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
