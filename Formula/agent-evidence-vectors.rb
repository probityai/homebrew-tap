class AgentEvidenceVectors < Formula
  include Language::Python::Virtualenv

  desc "Conformance corpora and reference verifiers for agent evidence records"
  homepage "https://github.com/probityai/agent-evidence-vectors"
  url "https://files.pythonhosted.org/packages/18/47/d6e96f67f58fe9f9ecde04f017f9cea3bdb75ac7bedc45c70d61c5c02adb/agent_evidence_vectors-0.34.2.tar.gz"
  sha256 "5db7f027d6b7b51e804d8bbc62ec0889b4f5ed2a0a142e877846be90cfe94a22"
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
