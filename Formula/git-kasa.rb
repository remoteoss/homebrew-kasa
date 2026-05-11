class GitKasa < Formula
  desc "Stacked Merge Requests CLI for GitLab"
  homepage "https://gitlab.com/remote-com/employ-starbase/kasa"
  license "MIT"
  version "0.1.13"

  on_macos do
    if Hardware::CPU.arm?
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.1.13/git-kasa-darwin-arm64.tar.gz"
      sha256 "314646838df194ea66f40ae2137ccd2dda0684a81cd7a5ff0f38223eb580df9a"
    else
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.1.13/git-kasa-darwin-x64.tar.gz"
      sha256 "35864a651e26f0065b1ef525bc6492a7cae0df305c9b692b5589527d7b04a21f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.1.13/git-kasa-linux-arm64.tar.gz"
      sha256 "a7739fcc73064038ef498200357a5a30e4babb6c780117a21460830430d33972"
    else
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.1.13/git-kasa-linux-x64.tar.gz"
      sha256 "6f6f69f2434415fb818b9d4d03b5db41a8167ad1bde2cda33842cb86cb55a099"
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
