class GitKasa < Formula
  desc "Stacked Merge Requests CLI for GitLab"
  homepage "https://gitlab.com/remote-com/employ-starbase/kasa"
  license "MIT"
  version "0.1.12"

  on_macos do
    if Hardware::CPU.arm?
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.1.12/git-kasa-darwin-arm64.tar.gz"
      sha256 "a525fa9a4057f16f57de4e139fb2cebd43e5023b5a1456f7e070f19528e7772e"
    else
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.1.12/git-kasa-darwin-x64.tar.gz"
      sha256 "497af2188af840e7e57f1b62d3a08a3dc2e300efa6ef04f89e41a82923955450"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.1.12/git-kasa-linux-arm64.tar.gz"
      sha256 "0e927c927ad59cd328caa7c0a819129b8a07c9f09f5dd85eeea153b669019233"
    else
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.1.12/git-kasa-linux-x64.tar.gz"
      sha256 "9f99545aad692062903d898114c5338b765b1d21dcd95e7d9af286848e3a9864"
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
