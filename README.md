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

### Packages / Tools

Below are all the packages I use in my dev environment, along with my personal rating.

| Package                                                | Rating | Comments                                                                  |
| ------------------------------------------------------ | ------ | ------------------------------------------------------------------------- |
| [jj](https://github.com/jj-vcs/jj)                     | ★★★★★  | Completely replaced git for me. The best way to version control IMO.      |
| [ghostty](https://github.com/ghostty-org/ghostty)      | ★★★★★  | Blazingly fast and smooth terminal that works right out the box.          |
| [zed](https://github.com/zed-industries/zed)           | ★★★★★  | My favourite editor. Limited support for Python development.              |
| [rectangle](https://github.com/rxhanson/Rectangle)     | ★★★★★  | The easiest and simplest tiling manager I've had the pleasure of using.   |
| [neovim](https://github.com/neovim/neovim)             | ★★★★★  | I do prefer Zed generally, but I use nvim to fill in the gaps.            |
| [zoxide](https://github.com/ajeetdsouza/zoxide)        | ★★★★★  | Sceptical at first, but I don't use cd anymore because of this.           |
| [ohmyzsh](https://github.com/ohmyzsh/ohmyzsh)          | ★★★★★  | Handles everything I could ever want for zsh.                             |
| [starship](https://github.com/starship/starship)       | ★★★★   | Technically this is only visual, but I can't use zsh without it.          |
| [hyperfine](https://github.com/sharkdp/hyperfine)      | ★★★★   | Amazing benchmarking tool. Shouldn't be using anything else.              |
| [bacon](https://github.com/Canop/bacon)                | ★★★    | Whatever your Rust LSP is telling you, the compiler errors say it better. |
| [imageoptim](https://github.com/ImageOptim/ImageOptim) | ★★     | Super niche one-purpose use, but it is good at it.                        |
| [ripgrep](https://github.com/BurntSushi/ripgrep)       | ★★     | Niche usage for me, but definitely better than using grep.                |
| [astroterm](https://github.com/da-luce/astroterm)      | ★      | Pretty stars. Cool tool to look at, cool repo to read.                    |
| [bat](https://github.com/sharkdp/bat)                  | ★      | Visually stunning, but I barely use this function.                        |
| [delta](https://github.com/dandavison/delta)           | ★      | Prettier diff formats, but I was never too against the default one.       |

---

### Applications

Below are all the applications I use, either proprietary or open-source.

| Application                                                 | Open Source | Comments                                                   |
| ----------------------------------------------------------- | ----------- | ---------------------------------------------------------- |
| [anki](https://github.com/ankitects/anki)                   | 🟢          | Useful flashcard app, especially for language acquisition. |
| [audacity](https://github.com/audacity/audacity)            | 🟢          | Couldn't live without this for audio editing.              |
| [inky](https://github.com/inkle/inky)                       | 🟢          | Amazing narrative engine for games.                        |
| [godot](https://github.com/godotengine/godot)               | 🟢          | Absolutely amazing game engine.                            |
| [obs-studio](https://github.com/obsproject/obs-studio)      | 🟢          | Super good recording / streaming software.                 |
| [licecap](https://github.com/justinfrankel/licecap)         | 🟢          | Handy gif capturing application.                           |
| [obsidian](https://obsidian.md/)                            | ❌          | Handles all my notetaking and thoughts.                    |
| [spotify](https://spotify.com/)                             | ❌          | My go-to music player.                                     |
| [slack](https://slack.com/)                                 | ❌          | Better than Teams, I guess.                                |
| [jetbrains-toolbox](https://www.jetbrains.com/toolbox-app/) | ❌          | I don't like this at all.                                  |
| [rider](https://www.jetbrains.com/rider/)                   | ❌          | My second home, at times.                                  |
| [postman](https://www.postman.com/)                         | ❌          | Handy for its use-case.                                    |
| [raycast](https://www.raycast.com/)                         | ❌          | Drop-in replacement for Cmd+Space.                         |

#### Unlisted

- Aseprite
- Unity Hub & Unity

#### Wishlist

-

### Rating System

| Rating | Meaning                                                      |
| ------ | ------------------------------------------------------------ |
| ★★★★★  | **Core part of workflow** — can't live without it            |
| ★★★★☆  | **Used daily** — makes certain workflows much better         |
| ★★★☆☆  | **Solid usage** — just barely better than the default option |
| ★★☆☆☆  | **Little usage** — good only for specific scenarios          |
| ★☆☆☆☆  | **Rarely used** — mainly for style/effects                   |
