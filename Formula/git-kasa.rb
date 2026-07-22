class GitKasa < Formula
  desc "Stacked Merge Requests CLI for GitLab"
  homepage "https://gitlab.com/remote-com/employ-starbase/kasa"
  license "MIT"
  version "0.2.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.2.6/git-kasa-darwin-arm64.tar.gz"
      sha256 "bf6fcb3f704db4b694c3aeac6ebedef32a38364fea8f9d7a924557c3eb6c0ab8"
    else
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.2.6/git-kasa-darwin-x64.tar.gz"
      sha256 "827cadbd222476597891cf843c08f635c284405bc9c63252d89d293df81cc83b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.2.6/git-kasa-linux-arm64.tar.gz"
      sha256 "09c94307aa5f3b4321d52173be6e2dceb23fc3164f6d08e0f3dc3ef3ade7bc56"
    else
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.2.6/git-kasa-linux-x64.tar.gz"
      sha256 "4c292166f1a7eaae77411156087ab1c8d3b12b41a7338c3bb4ee6c2b3ce426da"
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
