class AgentEvidenceVectors < Formula
  include Language::Python::Virtualenv

  desc "Conformance corpora and reference verifiers for agent evidence records"
  homepage "https://github.com/probityai/agent-evidence-vectors"
  url "https://files.pythonhosted.org/packages/65/38/9cc1ea4804766e37fd7d21901d3d2dc4cbcae47af4a4ce85457fcb0c2240/agent_evidence_vectors-0.39.0.tar.gz"
  sha256 "5f0a917cd263d5b48ea77488fe2e627dbc039a488d1a2d9bd29e6dc84ed4a794"
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
