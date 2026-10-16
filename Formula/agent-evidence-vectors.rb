class AgentEvidenceVectors < Formula
  include Language::Python::Virtualenv

  desc "Conformance corpora and reference verifiers for agent evidence records"
  homepage "https://github.com/probityai/agent-evidence-vectors"
  url "https://files.pythonhosted.org/packages/04/28/b145f9f505bea6f5d972325f38fa878cf7174841eec30751c5508c345449/agent_evidence_vectors-0.18.1.tar.gz"
  sha256 "3af55653a65c35f32a90f291eda6eda3619321380567999c0d7f0c705976ee2f"
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
