class GitKasa < Formula
  desc "Stacked Merge Requests CLI for GitLab"
  homepage "https://gitlab.com/remote-com/employ-starbase/kasa"
  license "MIT"
  version "0.2.12"

  on_macos do
    if Hardware::CPU.arm?
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.2.12/git-kasa-darwin-arm64.tar.gz"
      sha256 "7c1a046267a034ab5f320eaf9971870c62162532d2f28c417d0329063e91641b"
    else
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.2.12/git-kasa-darwin-x64.tar.gz"
      sha256 "f184363991e0f428bba5d983f922a88d58952e7f1c6e9409065fdfebb6e6b525"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.2.12/git-kasa-linux-arm64.tar.gz"
      sha256 "e6fa541aa4aeb1c2d0f4eee8b66ba64d02528b594dddb5445a6d80922d7e67d4"
    else
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.2.12/git-kasa-linux-x64.tar.gz"
      sha256 "dbfe48ea6df9fc9ae758abf9522a5d68a699ec90f0d64ef6299f7224031788be"
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
