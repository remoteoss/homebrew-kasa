class GitKasa < Formula
  desc "Stacked Merge Requests CLI for GitLab"
  homepage "https://gitlab.com/remote-com/employ-starbase/kasa"
  license "MIT"
  version "0.2.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.2.3/git-kasa-darwin-arm64.tar.gz"
      sha256 "3d114c4c4f973dfb976e305ea05e530732cc487a04b3fc3f4b6260307e2314de"
    else
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.2.3/git-kasa-darwin-x64.tar.gz"
      sha256 "04b09f9a3f0d32f3bacf09d03500b91a021e8a6f57bac56d2fa6526b8ebce1b7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.2.3/git-kasa-linux-arm64.tar.gz"
      sha256 "dcff385bac4937e90c9370a5f3b7359983c325204e180decbe86d590e2701d7d"
    else
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.2.3/git-kasa-linux-x64.tar.gz"
      sha256 "a2c73305266ec02bfe62964125b2764662ad09055cae044eb4c90a5f6a6268cb"
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
