class AgentEvidenceVectors < Formula
  include Language::Python::Virtualenv

  desc "Conformance corpora and reference verifiers for agent evidence records"
  homepage "https://github.com/probityai/agent-evidence-vectors"
  url "https://files.pythonhosted.org/packages/fb/f4/7bcfb431b4beace86ee2bdbbb08835f5fca308f1b9480a0757f11c1b4255/agent_evidence_vectors-0.36.3.tar.gz"
  sha256 "210e42172511495bca47a20c88903800cf405126d7f956bb4be839f354052764"
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
