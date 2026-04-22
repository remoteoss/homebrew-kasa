class GitKasa < Formula
  desc "Stacked Merge Requests CLI for GitLab"
  homepage "https://gitlab.com/remote-com/employ-starbase/kasa"
  license "MIT"
  version "0.1.8"

  on_macos do
    if Hardware::CPU.arm?
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.1.8/git-kasa-darwin-arm64.tar.gz"
      sha256 "665f5336dfb33651564a463b40cbaf7dc0dda5090e2f8838a1654c2f9ca73117"
    else
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.1.8/git-kasa-darwin-x64.tar.gz"
      sha256 "d27477fa7d0f0ece65e5518fe569da1e6067289540d99db52a97b68ef9416a98"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.1.8/git-kasa-linux-arm64.tar.gz"
      sha256 "c5b3d7ccc23a5d37c7032d3bdf8c1ca157956bce6c294536a4ba94c87014a50b"
    else
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.1.8/git-kasa-linux-x64.tar.gz"
      sha256 "44ae7b02498829d1015d9b1f7f07722c1f252f51c3c4ae2de6c85d1084111ffe"
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
