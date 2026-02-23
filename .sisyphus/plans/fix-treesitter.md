# Fix nvim-treesitter Breaking Change

## TL;DR

> **Quick Summary**: O nvim-treesitter mudou de `master` para `main` branch com API completamente diferente. A config antiga (`require('nvim-treesitter.configs').setup`) não funciona mais.
> 
> **Deliverables**:
> - Atualizar treesitter.lua para nova API
> - Atualizar/criar config para textobjects
> - Neovim abre sem erros

> **Estimated Effort**: Quick (~5 min)

---

## Context

### Problem
O erro é:
```
module 'nvim-treesitter.configs' not found
```

O `nvim-treesitter` versão 1.x (branch `main`) é uma **reescrita completa** e **incompatível** com a versão antiga (branch `master` congelada).

### Key Changes

| Antigo (master) | Novo (main) |
|-----------------|-------------|
| `require('nvim-treesitter.configs').setup{}` | Não existe mais |
| `ensure_installed = {...}` | `ts.install(parser)` loop |
| Config única | Config separada por plugin |

### Solution
1. Atualizar `treesitter.lua` para nova API
2. Separar textobjects em plugin próprio com branch `main`

---

## TODOs

 [x] 1. **Atualizar treesitter.lua para nova API**

  **What to do**:
  - Remover `require('nvim-treesitter.configs').setup`
  - Usar `ts.install(parser)` para instalar parsers
  - Usar `vim.treesitter.start()` via autocmd
  - Configurar incremental_selection via API direta

  **File**: `lua/plugins/treesitter.lua`

  **New code**:
  ```lua
  return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    config = function()
      local ts = require 'nvim-treesitter'
      local parsers = {
        'lua', 'python', 'javascript', 'typescript', 'vimdoc', 'vim',
        'regex', 'terraform', 'sql', 'dockerfile', 'toml', 'json',
        'java', 'groovy', 'go', 'gitignore', 'graphql', 'yaml',
        'make', 'cmake', 'markdown', 'markdown_inline', 'bash',
        'tsx', 'css', 'html',
      }
      for _, parser in ipairs(parsers) do
        ts.install(parser)
      end
      -- filetype registrations...
      vim.api.nvim_create_autocmd('FileType', {
        pattern = patterns,
        callback = function() vim.treesitter.start() end,
      })
    end,
  }
  ```

 [x] 2. **Criar treesitter-textobjects.lua separado**

  **What to do**:
  - Criar novo arquivo `lua/plugins/treesitter-textobjects.lua`
  - Usar branch `main` para ambos
  - Configurar keymaps via nova API

  **File**: `lua/plugins/treesitter-textobjects.lua`

  **New code**:
  ```lua
  return {
    'nvim-treesitter/nvim-treesitter-textobjects',
    branch = 'main',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('nvim-treesitter-textobjects').setup {
        select = { lookahead = true },
        move = { set_jumps = true },
      }
      -- keymaps using select, swap, move modules
    end,
  }
  ```

---

## Success Criteria

```bash
# No errors on startup
nvim --headless -c "lua print('OK')" +qa 2>&1 | grep -q "OK" && echo "PASS" || echo "FAIL"
```
