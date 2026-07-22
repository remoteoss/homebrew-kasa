class GitKasa < Formula
  desc "Stacked Merge Requests CLI for GitLab"
  homepage "https://gitlab.com/remote-com/employ-starbase/kasa"
  license "MIT"
  version "0.2.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.2.5/git-kasa-darwin-arm64.tar.gz"
      sha256 "2959dce3a9673571898b419b84d5f058a7f686ad59928f1cc32efe39f62fac09"
    else
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.2.5/git-kasa-darwin-x64.tar.gz"
      sha256 "8641f3e651c36d51bd8279e314e1cc8360ce6ac5dc3aefa0afc7833561d5cc4c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.2.5/git-kasa-linux-arm64.tar.gz"
      sha256 "3f1ed77772110fedd7cd54228751306f9540f5d70a237eccbac0dd1fe3332be1"
    else
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.2.5/git-kasa-linux-x64.tar.gz"
      sha256 "3cf34906d12b88f63cf737e75546bac84d469f3dc2bd6d90b99dba97c07fd944"
    end
  end

  depends_on "git"

  def install
    bin.install Dir["git-kasa-*"].first => "git-kasa"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/git-kasa --version")
  end
end
