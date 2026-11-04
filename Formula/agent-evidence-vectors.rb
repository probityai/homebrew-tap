class AgentEvidenceVectors < Formula
  include Language::Python::Virtualenv

  desc "Conformance corpora and reference verifiers for agent evidence records"
  homepage "https://github.com/probityai/agent-evidence-vectors"
  url "https://files.pythonhosted.org/packages/07/bc/5386aeaf42dfe56fa41c90a366efe66cb6b77bd88465317d19bfdd3ae88c/agent_evidence_vectors-0.33.0.tar.gz"
  sha256 "d5181d83db183f16be074e7a7ba00365aea480f33646fb86f1ccf773865b63c9"
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
