class AgentEvidenceAdmission < Formula
  include Language::Python::Virtualenv

  desc "Check that an artifact has the digest its SBOM or attestation names"
  homepage "https://github.com/probityai/agent-evidence-vectors/tree/main/packages/admission"
  url "https://files.pythonhosted.org/packages/a1/4f/7a6524aaf686ae3d1051aa369ee2ba4e5a5b5f48342d50577da3732f486f/agent_evidence_admission-0.2.0.tar.gz"
  sha256 "9333522df2ac416fc15a3e284fcbbc28d07c6a72841ee0c5f705b2023110b6f4"
  license "Apache-2.0"

  depends_on "python@3.14"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "digest-check", shell_output("#{bin}/agent-evidence-admission --help")
  end
end
