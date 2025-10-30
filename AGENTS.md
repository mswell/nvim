# Agent Guidelines for Neovim Configuration

## Project Overview
Personal Neovim configuration based on Launch.nvim using Lazy.nvim plugin manager.

## Build/Test Commands
- **Format Lua code**: `stylua .` or `stylua <file>`
- **Check Neovim config**: `nvim --headless "+Lazy! sync" +qa` (sync plugins)
- **No formal tests**: This is a config repo - validate by launching `nvim` and testing features

## Code Style & Structure

### File Organization
- `lua/core/`: Core settings (options.lua, keymaps.lua, snippets.lua)
- `lua/plugins/`: Plugin configurations (one file per plugin/feature)
- `lua/plugins/themes/`: Theme-specific configurations
- Plugin files should return a Lazy.nvim spec table

### Lua Formatting (StyLua)
- **Indentation**: 2 spaces (not tabs)
- **Quote style**: Single quotes preferred (AutoPreferSingle)
- **Call parentheses**: None (omit where possible)
- **Column width**: 160 characters max
- **Line endings**: Unix (LF)

### Naming Conventions
- **Files**: lowercase with hyphens (e.g., `auto-completion.lua`, `neo-tree.lua`)
- **Variables**: snake_case (e.g., `local server_name`, `ensure_installed`)
- **Functions**: snake_case (e.g., `function file_exists(file)`)
- **Plugin specs**: Return table directly with `return { 'plugin/name', ... }`

### Import/Require Patterns
- Use `require 'module'` syntax (single quotes, no parentheses per StyLua)
- Core modules loaded at top of init.lua: `require 'core.options'`
- Plugin specs required in Lazy setup: `require 'plugins.telescope'`
- Late requires inside functions when needed: `local cmp = require 'cmp'`

### Plugin Configuration Pattern
```lua
return {
  'author/plugin-name',
  dependencies = { ... },
  config = function()
    -- Setup code here
  end,
}
```

### Options/Settings
- Use `vim.o` for global options, `vim.wo` for window, `vim.opt` for complex options
- Indentation default: 4 spaces (shiftwidth, tabstop, softtabstop)
- expandtab = true (convert tabs to spaces)

### Error Handling & Diagnostics
- LSP diagnostics handled by lspconfig + mason
- Use `---@diagnostic disable-next-line: <warning>` to suppress specific warnings
- Ruff for Python linting/formatting, Clippy for Rust

### Comments
- Use `--` for single-line comments
- Document complex autocmds and functions with explanatory comments above

### Type Annotations
- Use LuaLS annotations where helpful: `---@diagnostic`, `---@type`, etc.
- Lua language server configured with runtime = 'LuaJIT'

## Common Patterns
- Keymaps defined with descriptions: `vim.keymap.set('n', '<leader>x', func, { desc = '[X] Description' })`
- LSP keymaps use `map()` helper in LspAttach autocmd
- Lazy loading: Use `event`, `cmd`, or `keys` fields in plugin specs when appropriate
