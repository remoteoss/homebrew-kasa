class GitKasa < Formula
  desc "Stacked Merge Requests CLI for GitLab"
  homepage "https://gitlab.com/remote-com/employ-starbase/kasa"
  license "MIT"
  version "0.2.10"

  on_macos do
    if Hardware::CPU.arm?
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.2.10/git-kasa-darwin-arm64.tar.gz"
      sha256 "51cef81c23945e4e6bb3418f11973abcb22892cebb0360df18d0d366fedb87e0"
    else
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.2.10/git-kasa-darwin-x64.tar.gz"
      sha256 "d0f8982a509231ad8156781a084e2c74c80b74347d0ab6a26ce33e8179a9c42f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.2.10/git-kasa-linux-arm64.tar.gz"
      sha256 "99c70829c79253da83e52b984acfd84a44cc6de5d906660d19c63ae33e7e8b11"
    else
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.2.10/git-kasa-linux-x64.tar.gz"
      sha256 "ba204515268e0e8bfc83d94f4746b72f68c68fdee813ecb311b4d4adcbe251f7"
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
