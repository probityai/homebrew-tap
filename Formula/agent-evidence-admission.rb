class AgentEvidenceAdmission < Formula
  include Language::Python::Virtualenv

  desc "Check that an artifact has the digest its SBOM or attestation names"
  homepage "https://github.com/probityai/agent-evidence-vectors/tree/main/packages/admission"
  url "https://files.pythonhosted.org/packages/cc/f8/c2157395a11d3b99ae6a6d7863a4323fa9fa929998272809b826faec1532/agent_evidence_admission-0.2.1.tar.gz"
  sha256 "123a451a2e758ddb448899e98d23190c198d85a8421cb5dd52393eb2f1f09ac7"
  license "Apache-2.0"

  depends_on "python@3.14"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "digest-check", shell_output("#{bin}/agent-evidence-admission --help")
  end
end
