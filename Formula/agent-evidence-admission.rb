class AgentEvidenceAdmission < Formula
  include Language::Python::Virtualenv

  desc "Check that an artifact has the digest its SBOM or attestation names"
  homepage "https://github.com/probityai/agent-evidence/tree/main/packages/admission"
  url "https://files.pythonhosted.org/packages/60/91/4718a0385f7b4c5aa23310c47f2b1e3835d7cac46886f17ee58b110e3906/agent_evidence_admission-0.1.2.tar.gz"
  sha256 "183d20411894dd046cb3eaad828cf0fe8aad7156bf8202c2ddb60664cddce33d"
  license "Apache-2.0"

  depends_on "python@3.14"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "digest-check", shell_output("#{bin}/agent-evidence-admission --help")
  end
end
