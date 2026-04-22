class GitKasa < Formula
  desc "Stacked Merge Requests CLI for GitLab"
  homepage "https://gitlab.com/remote-com/employ-starbase/kasa"
  license "MIT"
  version "0.1.9"

  on_macos do
    if Hardware::CPU.arm?
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.1.9/git-kasa-darwin-arm64.tar.gz"
      sha256 "b8f4aa5936ea7ef1e0d700ca057dc15fb35d9be3d2089eea961c927a070179b0"
    else
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.1.9/git-kasa-darwin-x64.tar.gz"
      sha256 "e6e6ae7c1dfa6eb691b2e1c4ad0d5bb35daec0492455ff3bb2ff3f65f4b7ab7d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.1.9/git-kasa-linux-arm64.tar.gz"
      sha256 "562c3268064b2b7aec85e79543e6a2a3d672aa91676cc10234b0cc31e2892ffa"
    else
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.1.9/git-kasa-linux-x64.tar.gz"
      sha256 "08962f0b522a8bbd51d5e9ed95ab2cae0e1d3b014e6faa942ddd273979c2c5b7"
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
