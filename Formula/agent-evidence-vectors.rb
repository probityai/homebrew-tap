class AgentEvidenceVectors < Formula
  include Language::Python::Virtualenv

  desc "Conformance corpora and reference verifiers for agent evidence records"
  homepage "https://github.com/probityai/agent-evidence-vectors"
  url "https://files.pythonhosted.org/packages/d6/3a/186b99a3024e32648b3844f72fcb8b0baa394b4969c18ace865f099a4c53/agent_evidence_vectors-0.34.1.tar.gz"
  sha256 "8f3c3e6253fafd096b3b96ed1af19aa148a07300291de180bee25dffe3d69f00"
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
