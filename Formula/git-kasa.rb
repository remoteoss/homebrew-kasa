class GitKasa < Formula
  desc "Stacked Merge Requests CLI for GitLab"
  homepage "https://gitlab.com/remote-com/employ-starbase/kasa"
  license "MIT"
  version "0.2.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.2.4/git-kasa-darwin-arm64.tar.gz"
      sha256 "064ccc9ce034ee7b7e08c6c5a2a413a65d4fc6f02e1f38bebccc65b5cf40638d"
    else
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.2.4/git-kasa-darwin-x64.tar.gz"
      sha256 "8c66f7aa08f2c32f0fe592fbb090b7046e54f64b56bf8838c7ac9e9e28a53fc0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.2.4/git-kasa-linux-arm64.tar.gz"
      sha256 "76ca6f2aa31dfea59c94fafc93aafc07a08efd5bbcf79213b14e936804319e3e"
    else
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.2.4/git-kasa-linux-x64.tar.gz"
      sha256 "cfd57e8bfd64ab6c59427b5bd2f9b48bd1d561f82fbe12821ed84ad86a7c9b2b"
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
