class GitKasa < Formula
  desc "Stacked Merge Requests CLI for GitLab"
  homepage "https://gitlab.com/remote-com/employ-starbase/kasa"
  license "MIT"
  version "0.2.9"

  on_macos do
    if Hardware::CPU.arm?
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.2.9/git-kasa-darwin-arm64.tar.gz"
      sha256 "7189c8331dbeb70df030e58c059c278a98e08bb4ad3ef59d2ef2a83346be19f5"
    else
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.2.9/git-kasa-darwin-x64.tar.gz"
      sha256 "4f8f30224529643f9a9858cab4e72c5906f177dd82a51f17d212b23edd340087"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.2.9/git-kasa-linux-arm64.tar.gz"
      sha256 "960f2628c58b9278c96daa8a0e312575cc99218eaf6219527cd7506a3e649cdf"
    else
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.2.9/git-kasa-linux-x64.tar.gz"
      sha256 "a247faef9fb474d427e4002e6545f8c9f24204e8c99b6f7b6365c06bc321cda1"
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
