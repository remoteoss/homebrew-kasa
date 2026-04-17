class GitKasa < Formula
  desc "Stacked Merge Requests CLI for GitLab"
  homepage "https://gitlab.com/remote-com/employ-starbase/kasa"
  license "MIT"
  version "0.1.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.1.4/git-kasa-darwin-arm64.tar.gz"
      sha256 "0f9774cc2531a36c80242f40d9492826bc9b31c858113f6b09dbf1234af424cf"
    else
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.1.4/git-kasa-darwin-x64.tar.gz"
      sha256 "909aacceac02efb5624e7afab1f4c135b13e9d1de4477c2b342ba265c92034e0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.1.4/git-kasa-linux-arm64.tar.gz"
      sha256 "02df6b4561f79138685d75106b5618658f125bb743da2a3f060a0221c2ce94f4"
    else
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.1.4/git-kasa-linux-x64.tar.gz"
      sha256 "8ed1bf559a2fcaebb62e63845e463156fbc3efe6b5e8c775d51db25d24656edf"
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
