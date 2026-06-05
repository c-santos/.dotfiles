# Neovim Config — Copilot Instructions

This is a personal Neovim configuration using [lazy.nvim](https://github.com/folke/lazy.nvim) as the plugin manager.

## Architecture

- `init.lua` — Entry point. Loads core modules (`vim-options`, `remap`, `autocmd`, `snips`), bootstraps lazy.nvim, then calls `require("lazy").setup("plugins")` to auto-discover all plugin specs in `lua/plugins/`, and sets the active colorscheme via the global `Color()`.
- `lua/vim-options.lua` — All `vim.opt` / `vim.g` settings.
- `lua/remap.lua` — All custom keymaps. Leader key is `<Space>`.
- `lua/autocmd.lua` — Autocommands.
- `lua/snips.lua` — Extra snippet-style keymaps (e.g. quick `console.log`).
- `lua/plugins/` — One file per plugin or plugin group, each returning a lazy.nvim plugin spec table.

## Plugin Conventions

- Every file in `lua/plugins/` must `return` a lazy.nvim spec (a table or list of tables). lazy.nvim auto-loads all files in this directory.
- LSP servers are managed by Mason via `mason-lspconfig`. To add a new server, append it to the `language_servers` list at the top of `lua/plugins/lsp.lua`. The default handler sets up all servers with shared `capabilities` and `on_attach`.
- The `Color(dark, light)` function is a global defined in `lua/plugins/colors.lua`. Call it from `init.lua` to set the active theme. It supports an optional auto-light-mode that switches on specific weekdays/hours.
- `theme-default.lua` defines a default theme table but is not currently wired into the startup flow (the active theme is set directly in `init.lua`).

## Formatting & Linting

- **Lua**: formatted with [StyLua](https://github.com/JohnnyMorganz/StyLua). Config: spaces, 80-column width (`.stylua.toml`).
- **JS/TS/CSS/HTML/JSON/Markdown**: formatted with `prettier` via conform.nvim (`<leader>f`).
- **JS/TS linting**: `eslint_d` via nvim-lint (`<leader>lf`).
- No automated test or build commands exist for this config.

## Key Keymaps (for reference when editing configs)

| Key | Action |
|-----|--------|
| `<leader>pf` | Find files (all) |
| `<leader>pp` | Find git-tracked files |
| `<leader>ps` | Live grep |
| `<leader>f` | Format buffer |
| `<leader>lf` | Lint file |
| `<leader>a` | Harpoon: add file |
| `<leader>h` | Harpoon: quick menu |
| `<leader>rn` | LSP rename |
| `gd` | LSP go to definition |
| `jk` | Exit insert mode |
| `<leader>s` | Substitute word under cursor (whole buffer) |
