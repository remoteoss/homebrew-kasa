class GitKasa < Formula
  desc "Stacked Merge Requests CLI for GitLab"
  homepage "https://gitlab.com/remote-com/employ-starbase/kasa"
  license "MIT"
  version "0.2.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.2.2/git-kasa-darwin-arm64.tar.gz"
      sha256 "4f855f32f0d014dba0f0b9cfb2a70daa116e082d6ae71bc7f95f6fdeb3962474"
    else
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.2.2/git-kasa-darwin-x64.tar.gz"
      sha256 "b423ef1148c6eaa0b970487ef38c64e61d44f45e38bf2c641ff4f1bf42be6747"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.2.2/git-kasa-linux-arm64.tar.gz"
      sha256 "f500d2bbdec15e7e183e5a56ce19d5d94444087a35ca509d086c4e9aa95ad3a7"
    else
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.2.2/git-kasa-linux-x64.tar.gz"
      sha256 "357798976e1a96ec1bb47af9d77961098727972b1f60f5003928a51c89f9d4e6"
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
