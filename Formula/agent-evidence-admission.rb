class AgentEvidenceAdmission < Formula
  include Language::Python::Virtualenv

  desc "Check that an artifact has the digest its SBOM or attestation names"
  homepage "https://github.com/probityai/agent-evidence/tree/main/packages/admission"
  url "https://files.pythonhosted.org/packages/ac/95/c136c845f1df4ff3f643c58481a80dccf503400f278dcce0bc2574b07cc7/agent_evidence_admission-0.1.0.tar.gz"
  sha256 "2870ef6cbf34f4c7580549bc902d8c3eb3f5b5f64a93a28e2112ab57b1afcbb6"
  license "Apache-2.0"

  depends_on "python@3.14"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "digest-check", shell_output("#{bin}/agent-evidence-admission --help")
  end
end
