class AgentEvidenceVectors < Formula
  include Language::Python::Virtualenv

  desc "Conformance corpora and reference verifiers for agent evidence records"
  homepage "https://github.com/probityai/agent-evidence-vectors"
  url "https://files.pythonhosted.org/packages/de/ef/28ab9581a6354afdb555ca0b1f4f219d3645c5a8b585d72e264c1b70ddcc/agent_evidence_vectors-0.23.0.tar.gz"
  sha256 "54dcbd34ec126ad8e8e285200171b268a57db386da64a92a6cf70e250c4989e0"
  license all_of: ["Apache-2.0", "BUSL-1.1"]

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
