Dotfiles for my dev environment.

Simply clone this repository into your `~/.config`.

## Dev Environment

### Setup

To setup the dev environment, run the following:

```shell
chmod -x dev-setup.sh
./dev-setup.sh
```

This will do the following:

1. Setup common task and package managers (homebrew, mise, uv)
2. Optionally setup symlinks for common config files (.gitconfig, .zshrc, etc)
3. Setup packages

### Used Packages

Below are all the packages I use in my dev environment, along with my personal rating.

| Package                                                | Rating | Description                                                               |
| ------------------------------------------------------ | ------ | ------------------------------------------------------------------------- |
| [bat](https://github.com/sharkdp/bat)                  | ★☆☆☆☆  | Visually stunning, but I barely use this function.                        |
| [bacon](https://github.com/Canop/bacon)                | ★★★☆☆  | Whatever your Rust LSP is telling you, the compiler errors say it better. |
| [delta](https://github.com/dandavison/delta)           | ★☆☆☆☆  | Prettier diff formats, but I was never too against the default one.       |
| [hyperfine](https://github.com/sharkdp/hyperfine)      | ★★★★☆  | Amazing benchmarking tool. Shouldn't be using anything else.              |
| [imageoptim](https://github.com/ImageOptim/ImageOptim) | ★★☆☆☆  | Super niche one-purpose use, but it is good at it.                        |
| [jj](https://github.com/jj-vcs/jj)                     | ★★★★★  | Completely replaced git for me. The best way to version control IMO.      |
| [neovim](https://github.com/neovim/neovim)             | ★★★★★  | Don't think I have to explain this one.                                   |
| [ripgrep](https://github.com/BurntSushi/ripgrep)       | ★★☆☆☆  | Niche usage for me, but definitely better than using grep.                |
| [starship](https://github.com/starship/starship)       | ★★★★★  | Technically this is only visual, but I can't use zsh without it.          |
| [zoxide](https://github.com/ajeetdsouza/zoxide)        | ★★★★★  | Sceptical at first, but I don't use cd anymore because of this.           |
| [ohmyzsh](https://github.com/ohmyzsh/ohmyzsh)          | ★★★★★  | Handles everything I could ever want for zsh.                             |

### Rating System

| Rating | Meaning                                                      |
| ------ | ------------------------------------------------------------ |
| ★★★★★  | **Core part of workflow** — can't live without it            |
| ★★★★☆  | **Used daily** — makes certain workflows much better         |
| ★★★☆☆  | **Solid usage** — just barely better than the default option |
| ★★☆☆☆  | **Little usage** — good only for specific scenarios          |
| ★☆☆☆☆  | **Rarely used** — mainly for style/effects                   |
