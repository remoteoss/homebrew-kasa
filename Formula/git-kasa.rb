class GitKasa < Formula
  desc "Stacked Merge Requests CLI for GitLab"
  homepage "https://gitlab.com/remote-com/employ-starbase/kasa"
  license "MIT"
  version "0.1.14"

  on_macos do
    if Hardware::CPU.arm?
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.1.14/git-kasa-darwin-arm64.tar.gz"
      sha256 "e2c4cf8810b67d337aadde12b414c71518bde9663ddc6bf3e6d7f0a27badb5d8"
    else
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.1.14/git-kasa-darwin-x64.tar.gz"
      sha256 "4ac0d7b9cee715ed26f7e2a8b17326b4644a86606fc56e6850cbb6b5a0c29b5b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.1.14/git-kasa-linux-arm64.tar.gz"
      sha256 "063225b49182d31cd5c1cac291d8f9a9164b1d4b2be1533efda6d5d19c827872"
    else
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.1.14/git-kasa-linux-x64.tar.gz"
      sha256 "fc5908b961cf2b8df708b94fefc5f6b73366e50a9a1fb18b72d3d41b8f97efed"
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
