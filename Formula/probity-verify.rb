class ProbityVerify < Formula
  include Language::Python::Virtualenv

  desc "Check claims against pinned evidence offline, with replayable decisions"
  homepage "https://github.com/probityai/probity-verify"
  url "https://files.pythonhosted.org/packages/49/58/53dc019ccfbbca461de6b6c090a2414eb429e64c188059cef09c02972c64/probity_verify-0.1.1.tar.gz"
  sha256 "ed745e2d5b07beaae5993399b1d551062c209efa5df8ae5961b39bf2d6ed3d16"
  license "Apache-2.0"

  depends_on "cryptography"
  depends_on "python@3.14"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "usage: probity-verify", shell_output("#{bin}/probity-verify --help")
    assert_match "usage: probity-bundle", shell_output("#{bin}/probity-bundle --help")
    system libexec/"bin/python", "-c", "import probity_verify"
  end
end
