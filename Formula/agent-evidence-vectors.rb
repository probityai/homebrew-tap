class AgentEvidenceVectors < Formula
  include Language::Python::Virtualenv

  desc "Conformance corpora and reference verifiers for agent evidence records"
  homepage "https://github.com/probityai/agent-evidence-vectors"
  url "https://files.pythonhosted.org/packages/85/0f/040f48862de69642d15ba17ae13a3b79078cc69a5e343d8150612e5f83a4/agent_evidence_vectors-0.35.0.tar.gz"
  sha256 "2ea6f4011af6cda7fafc76a51b0a735cda7de44f0f208024e6d767486ef58a59"
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
