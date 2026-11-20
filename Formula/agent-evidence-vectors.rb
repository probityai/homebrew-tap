class AgentEvidenceVectors < Formula
  include Language::Python::Virtualenv

  desc "Conformance corpora and reference verifiers for agent evidence records"
  homepage "https://github.com/probityai/agent-evidence-vectors"
  url "https://files.pythonhosted.org/packages/14/1e/e7c70a6b985dedd0bb1a12d50bb70ca1b3e6b8b1ff634415b036648dd415/agent_evidence_vectors-0.37.1.tar.gz"
  sha256 "2325c4a90650fd59282422c274edeb46b9755636b74f7d0007d61a6ae0c9b09d"
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
