# Neovim Config

Neovim configuration for web development (TypeScript, React, CSS).

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
git clone https://github.com/georgiKi/dotfiles/tree/main/.config/nvim ~/.config/nvim

# Open Neovim (plugins will auto-install)
nvim
```
