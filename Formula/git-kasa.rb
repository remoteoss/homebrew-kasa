class GitKasa < Formula
  desc "Stacked Merge Requests CLI for GitLab"
  homepage "https://gitlab.com/remote-com/employ-starbase/kasa"
  license "MIT"
  version "0.2.7"

  on_macos do
    if Hardware::CPU.arm?
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.2.7/git-kasa-darwin-arm64.tar.gz"
      sha256 "1c412cdabaac83ebba3b37e7f657c0163fa8f33607f915339ce8fb89874c8d70"
    else
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.2.7/git-kasa-darwin-x64.tar.gz"
      sha256 "2da278a1039711d4a2b7e9f9c015e61cf785fcbfe5f14ff476d555c9e3504c2e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.2.7/git-kasa-linux-arm64.tar.gz"
      sha256 "d24f04eed10710e0a0d56577458516e589c57b475d45520698a5b27cf53a8c95"
    else
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.2.7/git-kasa-linux-x64.tar.gz"
      sha256 "ab003b3371f9793f307b3c77ef40b187416bd90fbfb013b6729e3abe404fdb0b"
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
