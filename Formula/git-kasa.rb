class GitKasa < Formula
  desc "Stacked Merge Requests CLI for GitLab"
  homepage "https://gitlab.com/remote-com/employ-starbase/kasa"
  license "MIT"
  version "0.1.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.1.3/git-kasa-darwin-arm64.tar.gz"
      sha256 "7bb13f5dbd581c44b930776538968f7fd48e00fc28457fc9a6bcd2aac13c4b11"
    else
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.1.3/git-kasa-darwin-x64.tar.gz"
      sha256 "d79dd057e3156abe9b780d5c357d576418f179142beb999e0287058e7b524338"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.1.3/git-kasa-linux-arm64.tar.gz"
      sha256 "5d2b201df23d18bf0cbac294ff9bf481502df4129204720d59494dbca5eb6b15"
    else
      url "https://gitlab.com/api/v4/projects/81261636/packages/generic/git-kasa/0.1.3/git-kasa-linux-x64.tar.gz"
      sha256 "a00f4027997d08ffda421dd5cefdf4f406d4efff4d7bb971a31c998c5428b94b"
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
