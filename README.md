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

★ ★ ★ ★ ★ = Core part of workflow, can't live without it.
★ ★ ★ ★ ☆ = Used daily, makes certain workflows so much better
★ ★ ★ ☆ ☆ = Solid usage, just barely better than the default option
★ ★ ☆ ☆ ☆ = Little usage, good for specific scenarios
★ ☆ ☆ ☆ ☆ = Rarely used, only for style / effects

| Package | Rating    | Description                                                               |
| ------- | --------- | ------------------------------------------------------------------------- |
| bacon   | ★ ★ ★ ☆ ☆ | Whatever your Rust LSP is telling you, the compiler errors say it better. |

#### bat

Cat, but cooler. I barely use this anyways, it just seems fancier.

#### git-delta

I'm not against the standard diff formatter, but it's nice to spice things up once in a while.

#### hyperfine

#### jj

#### nvim

#### presenterm

#### ripgrep

#### starship

#### zoxide

#### zsh
