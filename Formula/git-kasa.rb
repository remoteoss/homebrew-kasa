class GitKasa < Formula
  desc "Stacked Merge Requests CLI for GitLab"
  homepage "https://gitlab.com/remote-com/employ-starbase/kasa"
  license "MIT"
  version "0.2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.2.0/git-kasa-darwin-arm64.tar.gz"
      sha256 "0fb6812329f53185c96d58f92e114ec973196ae7ec16c6d2cda1ec91c4a27e0f"
    else
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.2.0/git-kasa-darwin-x64.tar.gz"
      sha256 "e88a707e7692e570f1920979d69634c84e1a563f9d7a335562ab8c6778b5dc7e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.2.0/git-kasa-linux-arm64.tar.gz"
      sha256 "8a0c88c86253b9fdf3ecb57f23b8fae3ec9819f2c14e53bb13c493602bd76915"
    else
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.2.0/git-kasa-linux-x64.tar.gz"
      sha256 "cb08c948cdefcd1a611a1862554ce8c12efa21c5580c986def61e29757442360"
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
