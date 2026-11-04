class AgentEvidenceVectors < Formula
  include Language::Python::Virtualenv

  desc "Conformance corpora and reference verifiers for agent evidence records"
  homepage "https://github.com/probityai/agent-evidence-vectors"
  url "https://files.pythonhosted.org/packages/ec/46/37452fc20e71e4a22d58a47cacaef6a5e9a6a32c2cb6be065775025a3f89/agent_evidence_vectors-0.33.1.tar.gz"
  sha256 "4d3c8667e7e10d1e74a0b9afd0a30002f4420033166b7a47cbac62c251463051"
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
