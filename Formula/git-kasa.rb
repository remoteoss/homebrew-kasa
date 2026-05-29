class GitKasa < Formula
  desc "Stacked Merge Requests CLI for GitLab"
  homepage "https://gitlab.com/remote-com/employ-starbase/kasa"
  license "MIT"
  version "0.2.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.2.1/git-kasa-darwin-arm64.tar.gz"
      sha256 "8edd90c46860268ccaf2c9c21418882537ec3eebdba9bf8e38e02ad768425def"
    else
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.2.1/git-kasa-darwin-x64.tar.gz"
      sha256 "e55205de8b0320f1f4bb6875c241fd0dbb5debaa8925e8cca654f788bacc3452"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.2.1/git-kasa-linux-arm64.tar.gz"
      sha256 "3c2713023a4b3fe45b17e79e88e2f71f8909ebf33541fbdaaad15bfcbfafa877"
    else
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.2.1/git-kasa-linux-x64.tar.gz"
      sha256 "17ffb3f118b18262ae4c1165864691cba95cbed4877c8ed6c487267e4c845d65"
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
