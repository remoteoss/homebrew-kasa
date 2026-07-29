class GitKasa < Formula
  desc "Stacked Merge Requests CLI for GitLab"
  homepage "https://gitlab.com/remote-com/employ-starbase/kasa"
  license "MIT"
  version "0.2.11"

  on_macos do
    if Hardware::CPU.arm?
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.2.11/git-kasa-darwin-arm64.tar.gz"
      sha256 "aac70e2129229b3fb84eb916457fe707e0b9a0b55ab8901c7b45bc8099ac447b"
    else
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.2.11/git-kasa-darwin-x64.tar.gz"
      sha256 "0ed70ef3bad66c48fdf9b445cd0da5993c011fec04920488ff79dbc94332cc47"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.2.11/git-kasa-linux-arm64.tar.gz"
      sha256 "1dcd27c4e34a092596116eeeb313795bffdf8604f5005fab31fbb2d80f5efac5"
    else
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.2.11/git-kasa-linux-x64.tar.gz"
      sha256 "352c9e9b61fa17d42fd35d5f64948fac7363857c9a4a670ce27387364963e25e"
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
