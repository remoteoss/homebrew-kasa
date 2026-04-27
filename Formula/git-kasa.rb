class GitKasa < Formula
  desc "Stacked Merge Requests CLI for GitLab"
  homepage "https://gitlab.com/remote-com/employ-starbase/kasa"
  license "MIT"
  version "0.1.10"

  on_macos do
    if Hardware::CPU.arm?
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.1.10/git-kasa-darwin-arm64.tar.gz"
      sha256 "4c33e7554305dbaa4c189c9042d32787a5199af5dc42b089eb0c682e5e5db8de"
    else
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.1.10/git-kasa-darwin-x64.tar.gz"
      sha256 "904ff7460d3a6f2011c7568f7f07d6c95fc20a0484ffe4e575c72c4a9a9a780a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.1.10/git-kasa-linux-arm64.tar.gz"
      sha256 "33e65c3d46d59d92e6fb1bf44c52dc8fd8e08cbad9d6afbadef5467f24a6f0af"
    else
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.1.10/git-kasa-linux-x64.tar.gz"
      sha256 "8cc34433cbcd4c183dfe16f3708949fe2470fc11d3955dead980c9546d8df0af"
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
