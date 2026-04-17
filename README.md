# Homebrew Tap for Kasa

[Kasa](https://gitlab.com/remote-com/employ-starbase/kasa) is a stacked merge requests CLI for GitLab. It lets you split your work into small, dependent MRs that are easy to review and merge.

## Install

```bash
brew tap remoteoss/kasa
brew install git-kasa
```

## Upgrade

```bash
brew upgrade git-kasa
```

## Usage

Kasa installs as a git subcommand:

```bash
git kasa status    # show your MR stack
git kasa update    # create or update stacked MRs
git kasa merge     # merge the stack
git kasa clean     # clean up merged branches
```

Run `git kasa --help` for the full list of commands.

## Requirements

- Git
- A GitLab project with API access (`GITLAB_TOKEN` or `glab` CLI configured)

## Supported platforms

| OS    | Architecture |
|-------|-------------|
| macOS | Apple Silicon (ARM64) |
| macOS | Intel (x64) |
| Linux | x64 |
| Linux | ARM64 |

## License

MIT
