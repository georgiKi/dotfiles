# Neovim Config

A modern Neovim configuration for web development (TypeScript, React, CSS).

## Installation

```bash
git clone https://github.com/georgi2411/nvim-config.git ~/.config/nvim
```

Open Neovim and lazy.nvim will automatically install all plugins:

```bash
nvim
```

---

## Prerequisites

### Required

| Tool | Install | Purpose |
|------|---------|---------|
| [Neovim](https://neovim.io) >= 0.12 | `brew install neovim` | Editor |
| [Git](https://git-scm.com) | `brew install git` | Plugin manager & lazygit |
| [Node.js](https://nodejs.org) >= 18 | `brew install node` | LSP servers |
| [Rust](https://rustup.rs) | `curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs \| sh` | blink.cmp build |
| [Cargo](https://doc.rust-lang.org/cargo) | Included with Rust | blink.cmp build |
| [tree-sitter CLI](https://github.com/tree-sitter/tree-sitter) | `npm install -g tree-sitter-cli` | Parser compilation for nvim-treesitter |
| [RipGrep](https://github.com/BurntSushi/ripgrep) | `brew install ripgrep` | Telescope live grep |
| [fd](https://github.com/sharkdp/fd) | `brew install fd` | Telescope file finder |
| [lazygit](https://github.com/jesseduffield/lazygit) | `brew install lazygit` | Git UI |
| [SQLite](https://www.sqlite.org) | `brew install sqlite` | bookmarks.nvim |

### LSP Servers (auto-installed via Mason)

These are installed automatically when you first open Neovim:

- `lua_ls` — Lua
- `ts_ls` — TypeScript / JavaScript
- `cssls` — CSS
- `cssmodules_ls` — CSS Modules
- `jsonls` — JSON
- `eslint` — ESLint

### Formatters (install manually)

| Tool | Install | Purpose |
|------|---------|---------|
| [Prettier](https://prettier.io) | `npm install -g prettier` or per-project | JS/TS/CSS/HTML formatting |
| [Stylua](https://github.com/JohnnyMorganz/StyLua) | `brew install stylua` | Lua formatting |

### Optional

| Tool | Install | Purpose |
|------|---------|---------|
| [GitHub Copilot](https://github.com/features/copilot) | Requires subscription | AI completions |
| [opencode](https://opencode.ai) | See docs | AI coding assistant |
| A [Nerd Font](https://www.nerdfonts.com) | Download & set in terminal | Icons |

---

## macOS Full Setup (from scratch)

```bash
# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install required tools
brew install neovim git node ripgrep fd lazygit sqlite stylua

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install tree-sitter CLI (required for nvim-treesitter parser compilation)
npm install -g tree-sitter-cli

# Install global prettier (optional, project-local is preferred)
npm install -g prettier

# Clone config
git clone https://github.com/georgi2411/nvim-config.git ~/.config/nvim

# Open Neovim (plugins will auto-install)
nvim
```

---

## Keymaps

### General

| Key | Action |
|-----|--------|
| `<leader>x` | Delete buffer |
| `<leader>c` | Toggle comment |
| `<leader>sr` | Restore session |
| `<Esc>` | Clear search highlight |

### File Navigation

| Key | Action |
|-----|--------|
| `<leader>e` | Toggle file explorer |
| `<leader>E` | Find file in explorer |
| `<leader>f` | Find files |
| `<leader>i` | Search text (live grep) |
| `<leader>fw` | Search word under cursor |
| `<leader>fb` | Find buffer |
| `<leader>fr` | Recent files |
| `<leader>fs` | Document symbols |
| `<leader>fd` | Workspace diagnostics |
| `<leader>fk` | Find keymaps |
| `<leader>/` | Search in buffer |
| `<leader>h` | Hop to word |
| `<leader>b` | Reach buffers |

### LSP

| Key | Action |
|-----|--------|
| `<leader>p` | Hover documentation |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code action |
| `<leader>z` | Code action |
| `<leader>r` | LSP references |
| `<leader>R` | Grep references |
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gi` | Go to implementation |
| `gy` | Go to type definition |
| `gr` | References |
| `[d` | Previous diagnostic |
| `]d` | Next diagnostic |
| `<leader>dt` | Open diagnostic float |

### Definition Preview

| Key | Action |
|-----|--------|
| `<leader>dd` | Floating definition preview |
| `<leader>dv` | Open definition in split |
| `<leader>db` | Close preview float |
| `<leader>dc` | Close definition splits |

### Git

| Key | Action |
|-----|--------|
| `<leader>g` | Lazygit |
| `<leader>gd` | Diff view |
| `<leader>gh` | File history |
| `<leader>gq` | Close diff view |
| `<leader>gb` | Toggle line blame |
| `<leader>gB` | Blame window |
| `<leader>gp` | Preview hunk |
| `<leader>gs` | Stage hunk |
| `<leader>gu` | Undo stage hunk |
| `<leader>gr` | Reset hunk |
| `<leader>gR` | Reset buffer |
| `]h` | Next hunk |
| `[h` | Previous hunk |

### Diagnostics & Code

| Key | Action |
|-----|--------|
| `<leader>t` | Toggle trouble diagnostics |
| `<leader>O` | Toggle outline |
| `<leader>ns` | LSP symbols (namu) |
| `<leader>nw` | Workspace symbols (namu) |

### Bookmarks

| Key | Action |
|-----|--------|
| `<leader>ba` | Add bookmark |
| `<leader>be` | Bookmarks tree |
| `<leader>bg` | Go to bookmark |
| `<leader>bn` | Next bookmark |
| `<leader>bp` | Previous bookmark |
| `<leader>bl` | List bookmarks |

### AI

| Key | Action |
|-----|--------|
| `<leader>og` | Toggle opencode |
| `<leader>oi` | Open input |
| `<leader>oo` | Open output |
| `¬` (Option+L) | Accept copilot suggestion |
| `<M-w>` | Accept copilot word |
| `<M-e>` | Accept copilot line |
| `<M-]>` | Next copilot suggestion |
| `<M-[>` | Previous copilot suggestion |

### Terminal

| Key | Action |
|-----|--------|
| `<leader>tt` | Toggle terminal |
| `<C-x>` | Close terminal |

### Window Navigation

| Key | Action |
|-----|--------|
| `<C-h/j/k/l>` | Navigate windows |
| `<S-l>` | Next buffer |
| `<S-h>` | Previous buffer |
| `<Up/Down>` | Resize horizontal |
| `<Left/Right>` | Resize vertical |
