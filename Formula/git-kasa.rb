class GitKasa < Formula
  desc "Stacked Merge Requests CLI for GitLab"
  homepage "https://gitlab.com/remote-com/employ-starbase/kasa"
  license "MIT"
  version "0.1.11"

  on_macos do
    if Hardware::CPU.arm?
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.1.11/git-kasa-darwin-arm64.tar.gz"
      sha256 "324d30816bb691524310b0bf0832645af1fa3a82035df53d9e243f278a6e151c"
    else
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.1.11/git-kasa-darwin-x64.tar.gz"
      sha256 "227d4cdbc27abc8e8f6f45ca2b38dfe4d193fd23fae91086a607d2d7d06b9833"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.1.11/git-kasa-linux-arm64.tar.gz"
      sha256 "d9c163cc861fc2bd066246b559ca5de48e69310738be831eb4b117a9142fbf8c"
    else
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.1.11/git-kasa-linux-x64.tar.gz"
      sha256 "ceff3984c2e12883152de59703c598310150e8aa90afd9b49d3908edf5429736"
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
