class GitKasa < Formula
  desc "Stacked Merge Requests CLI for GitLab"
  homepage "https://gitlab.com/remote-com/employ-starbase/kasa"
  license "MIT"
  version "0.1.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.1.6/git-kasa-darwin-arm64.tar.gz"
      sha256 "9b714df26e4819502fcaba3418cbfb76702de4815cd50ab41993abe125ad0796"
    else
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.1.6/git-kasa-darwin-x64.tar.gz"
      sha256 "c80fbdbeebb2e21c7a47415ce47cb8d60d9ca982c7a0fcdeede0a702fbf55bee"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.1.6/git-kasa-linux-arm64.tar.gz"
      sha256 "5e045164b427ef20f807c15496ba9e91969fba9458fedbce1971f0b582ed195a"
    else
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.1.6/git-kasa-linux-x64.tar.gz"
      sha256 "2dd0ee2b115537a747009b554b18cf56feaba972a10e5531585e7e2dd1dfd177"
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
