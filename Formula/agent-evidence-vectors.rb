class AgentEvidenceVectors < Formula
  include Language::Python::Virtualenv

  desc "Conformance corpora and reference verifiers for agent evidence records"
  homepage "https://github.com/probityai/agent-evidence-vectors"
  url "https://files.pythonhosted.org/packages/7d/18/263e0a2021cefff071cdf8128b0b5e40a2932e279871eebca500a8f4d0fe/agent_evidence_vectors-0.38.0.tar.gz"
  sha256 "ce32f15b3798fd8fbdb6f18e7054fa3fc905c9f3983692f59ba11e9ea2db3948"
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
