class GitKasa < Formula
  desc "Stacked Merge Requests CLI for GitLab"
  homepage "https://gitlab.com/remote-com/employ-starbase/kasa"
  license "MIT"
  version "0.2.8"

  on_macos do
    if Hardware::CPU.arm?
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.2.8/git-kasa-darwin-arm64.tar.gz"
      sha256 "a7ef679526529486ed76f31031ab3376f19521ca0a3780000af179f0c5b5fb79"
    else
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.2.8/git-kasa-darwin-x64.tar.gz"
      sha256 "44e6f0e75321a2bf6029b11e3a64dfbfe6abdb1ed0d7fbb78055b98d7b095422"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.2.8/git-kasa-linux-arm64.tar.gz"
      sha256 "9ecdf9d400b61fbb33f8b1505182b448d4cc4c6430834b2e76262644570e28c0"
    else
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.2.8/git-kasa-linux-x64.tar.gz"
      sha256 "0ad9ae30353b70c6583d4962a5a55f26a4943c78d3c06acfc04b3c068ff83a54"
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
