# dotfiles

Personal macOS dotfiles, managed with [GNU Stow](https://www.gnu.org/software/stow/).

Each top-level directory is a **Stow package** whose contents mirror their target
location relative to `$HOME`. Running `stow <package>` from the repo root symlinks
that package's files into place, so the working config always lives in git.

## What's included

| Package      | Target                | Description                                                        |
| ------------ | --------------------- | ----------------------------------------------------------------- |
| `zsh`        | `~/.zshrc`, `~/.p10k.zsh`, `~/.zsh/` | Zsh + oh-my-zsh + Powerlevel10k                    |
| `nvim`       | `~/.config/nvim/`     | Neovim, lazy.nvim-managed, modular Lua config                     |
| `tmux`       | `~/.tmux.conf`        | tmux: truecolor, mouse, vi copy-mode → `pbcopy`                   |
| `aerospace`  | `~/.aerospace.toml`   | AeroSpace tiling window manager (i3-style keybinds)               |
| `alacritty`  | `~/.alacritty.toml`   | Alacritty terminal (JetBrainsMono Nerd Font, blur)               |
| `ghostty`    | `~/.config/ghostty/config` | Ghostty terminal (Catppuccin Frappé)                        |

## Prerequisites

Everything is installed via [Homebrew](https://brew.sh):

```sh
# Core
brew install stow git zsh neovim tmux fzf nvm go

# oh-my-zsh + Powerlevel10k
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
brew install powerlevel10k

# Custom zsh plugins (into $ZSH_CUSTOM/plugins)
git clone https://github.com/zsh-users/zsh-autosuggestions \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Nerd Font (required by the terminals + p10k glyphs)
brew install --cask font-jetbrains-mono-nerd-font

# Optional apps referenced by the configs
brew install --cask aerospace alacritty ghostty
brew install lazydocker superfile
```

> **Install oh-my-zsh and the two custom plugins *before* linking `zsh`.** The
> stow-linked `.zshrc` sources them on startup and will error if they're missing.

## Install

```sh
git clone https://github.com/<you>/dotfiles.git ~/dotfiles
cd ~/dotfiles

# Link packages into $HOME
stow zsh nvim tmux aerospace alacritty ghostty
```

Handy stow commands (run from the repo root):

```sh
stow -n -v zsh   # dry-run: preview what would be linked
stow -R zsh      # restow (re-link after adding/removing files)
stow -D zsh      # delete: remove the symlinks
```

> If stow reports a conflict, an existing real file is in the way — back it up
> and remove it, then re-run stow.

## Tool details

### zsh
- **Framework:** oh-my-zsh with the `powerlevel10k` theme. Prompt is configured in
  `~/.p10k.zsh` — re-run `p10k configure` to change it.
- **Plugins:** `git`, `zsh-autosuggestions`, `zsh-syntax-highlighting`.
- **Editor:** `nvim` locally, `vim` over SSH.
- **fzf:** sourced from `~/.zsh/.fzf.zsh` (`Ctrl-R` history, `Ctrl-T` files).
- **nvm:** Node version manager loaded from `~/.nvm`.
- **PATH additions:** Homebrew `curl` & `postgresql@15`, `$HOME/go/bin`, plus the
  Google Cloud SDK.
- **Extras:** 
  `ld` is an alias for `lazydocker`.
- **Completions:** custom completions in `~/.zsh/completion/` (`_docker`).

### nvim
Managed by [lazy.nvim](https://github.com/folke/lazy.nvim) with plugin versions
pinned in `lazy-lock.json`. Config is split under `lua/config/`: `options`,
`mappings`, `plugins`, `lsp`, `telescope`, `completion`.

**Plugins:** catppuccin (theme), nerdtree, fzf + fzf.vim, vim-javascript,
typescript-vim, vim-airline, nerdcommenter, nvim-lspconfig, telescope (+ fzf-native,
plenary), friendly-snippets, nvim-autopairs, conform.nvim.

**Keybindings** (leader = `Space`):

| Key           | Action                        |
| ------------- | ----------------------------- |
| `<leader>w`   | Write                         |
| `<leader>q`   | Quit                          |
| `<leader>pv`  | Open file explorer (`:Vex`)   |
| `<C-p>`       | Fuzzy file finder (`:Files`)  |
| `jk` (insert) | Escape                        |
| `<leader>c`   | Copy to system clipboard      |
| `<leader>gf`  | Format current file with `gofmt` |
| `<leader>pf`  | Format current file with `black` |
| `<leader><CR>`| Reload `init.lua`             |

Run `:Lazy` to manage plugins; commit `lazy-lock.json` to pin updates.

### tmux
Truecolor, mouse enabled, 10k-line history, vi copy-mode.

| Key                      | Action                            |
| ------------------------ | --------------------------------- |
| `prefix r`               | Reload `~/.tmux.conf`             |
| `prefix %`               | Split horizontally (keeps cwd)   |
| `prefix "`               | Split vertically (keeps cwd)     |
| mouse-drag / `Enter`     | Copy selection to macOS clipboard (`pbcopy`) |

### aerospace
[AeroSpace](https://github.com/nikitabobko/AeroSpace) tiling WM with i3-style bindings.

| Key                  | Action                          |
| -------------------- | ------------------------------- |
| `alt-h/j/k/l`        | Focus left/down/up/right        |
| `alt-shift-h/j/k/l`  | Move window                     |
| `alt-minus/equal`    | Resize window                   |
| `alt-1…9`, `alt-a…`  | Switch to workspace             |
| `alt-/`              | Tiles layout                    |
| `alt-,`              | Accordion layout                |

### Terminals
- **Alacritty** — JetBrainsMono Nerd Font 13pt, 0.88 opacity + blur, no window
  decorations.
- **Ghostty** — JetBrainsMono Nerd Font 13pt, Catppuccin Frappé (Ghostty's
  built-in `Catppuccin Frappe` theme), 0.88 opacity + blur, blinking block cursor. 
