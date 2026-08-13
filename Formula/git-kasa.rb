class GitKasa < Formula
  desc "Stacked Merge Requests CLI for GitLab"
  homepage "https://gitlab.com/remote-com/employ-starbase/kasa"
  license "MIT"
  version "0.2.13"

  on_macos do
    if Hardware::CPU.arm?
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.2.13/git-kasa-darwin-arm64.tar.gz"
      sha256 "b6c23c101ced6af347e334b3cd326060d980879a638afb8746c63634c37c17c2"
    else
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.2.13/git-kasa-darwin-x64.tar.gz"
      sha256 "bb5c1e4973af0501d64f39d815ad7ba2019beb7741374aa63c836cb23e39f869"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.2.13/git-kasa-linux-arm64.tar.gz"
      sha256 "adb5dc2817b2a720875f81de11ab3d9e607d27658e6edcb555ea0614c9187de1"
    else
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.2.13/git-kasa-linux-x64.tar.gz"
      sha256 "77e682c7d30165322bfb18112ba10ac94d60f14cde78e0bc11c68a67d3ab5af3"
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
