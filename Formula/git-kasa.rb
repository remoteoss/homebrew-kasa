class GitKasa < Formula
  desc "Stacked Merge Requests CLI for GitLab"
  homepage "https://gitlab.com/remote-com/employ-starbase/kasa"
  license "MIT"
  version "0.1.7"

  on_macos do
    if Hardware::CPU.arm?
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.1.7/git-kasa-darwin-arm64.tar.gz"
      sha256 "9e4295d1c4d57d046febebac38cf1d2e1742dd36a48b1a6439a0dc0a1545d18e"
    else
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.1.7/git-kasa-darwin-x64.tar.gz"
      sha256 "9dd6d58479c11d4f755e25a71771cd55b67b55fc1e37363683180b0a4b3fc420"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.1.7/git-kasa-linux-arm64.tar.gz"
      sha256 "94a4aa4e37468345be5c42b16c2a106b281d76081bcbf5e398ef22a8ab6d5f9f"
    else
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.1.7/git-kasa-linux-x64.tar.gz"
      sha256 "4128374aa9f91bc44466c5f52d0af682da9072f34d9a94b083725b2baacb5b18"
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
