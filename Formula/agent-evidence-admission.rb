class AgentEvidenceAdmission < Formula
  include Language::Python::Virtualenv

  desc "Check that an artifact has the digest its SBOM or attestation names"
  homepage "https://github.com/probityai/agent-evidence-vectors/tree/main/packages/admission"
  url "https://files.pythonhosted.org/packages/d8/13/daa8c7512e634dd194d09eca7ec88bb3acb7dbe0f51b5e0cace471738b4a/agent_evidence_admission-0.3.0.tar.gz"
  sha256 "5d045d5d9519b7cf1555a49fb7b4c36f07fbb9450849b99f7affc4ff4caf066d"
  license "Apache-2.0"

  depends_on "python@3.14"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "digest-check", shell_output("#{bin}/agent-evidence-admission --help")
  end
end
