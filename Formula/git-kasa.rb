class GitKasa < Formula
  desc "Stacked Merge Requests CLI for GitLab"
  homepage "https://gitlab.com/remote-com/employ-starbase/kasa"
  license "MIT"
  version "0.1.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.1.5/git-kasa-darwin-arm64.tar.gz"
      sha256 "0da55883eca23274f49b849d50f0b97c1a3847d2f96f0639cbcea6a52a6d79d2"
    else
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.1.5/git-kasa-darwin-x64.tar.gz"
      sha256 "ca166a43d164202875c3a9feb5a02b529e37236163df63841d49552a9007180e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.1.5/git-kasa-linux-arm64.tar.gz"
      sha256 "0aaeb3291e59e3921d265a509f2fbfddc9d3a821f70e5e5061a37b271eb93689"
    else
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.1.5/git-kasa-linux-x64.tar.gz"
      sha256 "92391b1f3eb4fc6c12012bf17420813dfc46527d30e8d38bd37b59691e7548e9"
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
