# Keymaps - Nvim Configuration

> Referência rápida de todos os atalhos de teclado configurados nesta configuração do Neovim.
> Pressione `<Space>` (leader key) para ver o menu interativo com which-key.

## Legenda

- **Leader key**: `<Space>`
- **Local leader**: `<Space>` (mesmo que leader)
- Modos: `n` = normal, `i` = insert, `v` = visual, `x` = visual block

---

## General

| Tecla | Descrição | Modo |
|-------|-----------|------|
| `<Esc>` | Clear Search Highlights | n |
| `<C-s>` | Save File | n |
| `<C-q>` | Quit | n |
| `<C-d>` | Scroll Down and Center | n |
| `<C-u>` | Scroll Up and Center | n |
| `n` | Next Search Result | n |
| `N` | Prev Search Result | n |
| `jk` / `kj` | Exit Insert Mode | i |

## Navigation

| Tecla | Descrição | Modo |
|-------|-----------|------|
| `<C-h>` | Go to Left Window | n |
| `<C-j>` | Go to Lower Window | n |
| `<C-k>` | Go to Upper Window | n |
| `<C-l>` | Go to Right Window | n |
| `[d` | Prev Diagnostic | n |
| `]d` | Next Diagnostic | n |

## Buffer Management

| Tecla | Descrição | Modo |
|-------|-----------|------|
| `<Tab>` | Next Buffer | n |
| `<S-Tab>` | Prev Buffer | n |
| `<leader>b` | New Buffer | n |
| `<leader>x` | Delete Buffer | n |
| `<leader><leader>` | Buffers (Telescope) | n |

## Window Management

| Tecla | Descrição | Modo |
|-------|-----------|------|
| `<leader>v` | Split Vertically | n |
| `<leader>h` | Split Horizontally | n |
| `<leader>se` | Equal Window Size | n |
| `<leader>xs` | Close Split | n |

## Tab Management

| Tecla | Descrição | Modo |
|-------|-----------|------|
| `<leader>to` | New Tab | n |
| `<leader>tx` | Close Tab | n |
| `<leader>tn` | Next Tab | n |
| `<leader>tp` | Prev Tab | n |

## File Explorer (Neo-tree)

| Tecla | Descrição | Modo |
|-------|-----------|------|
| `<leader>e` | Explorer (Left) | n |
| `<leader>w` | Explorer (Float) | n |
| `<leader>ngs` | Git Status (Neotree) | n |
| `\` | Reveal Current File | n |

### Dentro do Neo-tree:

- `<Space>` - Toggle node
- `<CR>` / `l` - Open file
- `a` - Add file
- `A` - Add directory
- `d` - Delete
- `r` - Rename
- `y` - Copy to clipboard
- `x` - Cut to clipboard
- `p` - Paste from clipboard
- `q` - Close window
- `H` - Toggle hidden files
- `/` - Fuzzy finder
- `[g` / `]g` - Prev/Next git modified

## Search (Telescope)

| Tecla | Descrição | Modo |
|-------|-----------|------|
| `<leader>sf` | Find Files | n |
| `<leader>sg` | Grep (Root Dir) | n |
| `<leader>sw` | Grep Word | n |
| `<leader>sb` | Buffers | n |
| `<leader>sh` | Help Pages | n |
| `<leader>sd` | Diagnostics | n |
| `<leader>sr` | Resume | n |
| `<leader>sm` | Marks | n |
| `<leader>s.` | Recent Files | n |
| `<leader>s/` | Grep Open Files | n |
| `<leader>/` | Search in Buffer | n |
| `<leader>sds` | Document Symbols | n |

## Git (Telescope)

| Tecla | Descrição | Modo |
|-------|-----------|------|
| `<leader>gf` | Git Files | n |
| `<leader>gc` | Git Commits | n |
| `<leader>gcf` | Git Commits (Buffer) | n |
| `<leader>gb` | Git Branches | n |
| `<leader>gs` | Git Status | n |

## LSP (Language Server)

| Tecla | Descrição | Modo |
|-------|-----------|------|
| `gd` | Goto Definition | n |
| `gr` | Goto References | n |
| `gI` | Goto Implementation | n |
| `gD` | Goto Declaration | n |
| `K` | Hover Documentation | n |
| `<leader>D` | Type Definition | n |
| `<leader>rn` | Rename | n |
| `<leader>ca` | Code Action | n |
| `<leader>ds` | Document Symbols | n |
| `<leader>ws` | Workspace Symbols | n |
| `<leader>wa` | Add Workspace Folder | n |
| `<leader>wr` | Remove Workspace Folder | n |
| `<leader>wl` | List Workspace Folders | n |

## Code

| Tecla | Descrição | Modo |
|-------|-----------|------|
| `<C-/>` / `<C-c>` | Toggle Comment | n, v |
| `<leader>lw` | Toggle Line Wrap | n |
| `<` | Indent Left | v |
| `>` | Indent Right | v |
| `<A-j>` | Move Line Down | v |
| `<A-k>` | Move Line Up | v |

## Harpoon (Quick File Navigation)

| Tecla | Descrição | Modo |
|-------|-----------|------|
| `<leader>m` | Harpoon Add File | n |
| `<leader>M` | Harpoon Quick Menu | n |
| `<leader>1` | Harpoon to File 1 | n |
| `<leader>2` | Harpoon to File 2 | n |
| `<leader>3` | Harpoon to File 3 | n |
| `<leader>4` | Harpoon to File 4 | n |
| `<leader>p` | Harpoon Prev | n |
| `<leader>n` | Harpoon Next | n |

## Aerial (Code Outline)

| Tecla | Descrição | Modo |
|-------|-----------|------|
| `<leader>o` | Toggle Aerial | n |
| `<leader>on` | Aerial Navigation | n |
| `{` | Prev Symbol (dentro do Aerial) | n |
| `}` | Next Symbol (dentro do Aerial) | n |

## Debug (DAP)

| Tecla | Descrição | Modo |
|-------|-----------|------|
| `<F5>` | Debug: Continue | n |
| `<F1>` | Debug: Step Into | n |
| `<F2>` | Debug: Step Over | n |
| `<F3>` | Debug: Step Out | n |
| `<F7>` | Debug: Toggle UI | n |
| `<leader>b` | Toggle Breakpoint | n |
| `<leader>B` | Breakpoint Condition | n |

## Diagnostics

| Tecla | Descrição | Modo |
|-------|-----------|------|
| `<leader>d` | Show Diagnostic | n |
| `<leader>do` | Toggle Diagnostics | n |
| `<leader>q` | Diagnostic List | n |
| `[d` | Prev Diagnostic | n |
| `]d` | Next Diagnostic | n |

## Clipboard

| Tecla | Descrição | Modo |
|-------|-----------|------|
| `<leader>y` | Yank to System Clipboard | n, v |
| `<leader>Y` | Yank Line to System Clipboard | n |
| `p` | Paste Without Yank | v |

## Utilities

| Tecla | Descrição | Modo |
|-------|-----------|------|
| `<leader>+` | Increment Number | n |
| `<leader>-` | Decrement Number | n |
| `<leader>j` | Replace Word Under Cursor | n |
| `<leader>sn` | Save Without Formatting | n |
| `<leader>ss` | Save Session | n |
| `<leader>sl` | Load Session | n |

---

## Which-Key Groups

Quando você pressiona `<leader>` (Space), o which-key mostra os seguintes grupos organizados:

- **`<leader>b`** - buffer
- **`<leader>c`** - code  
- **`<leader>d`** - diagnostics/debug
- **`<leader>f`** - find/file
- **`<leader>g`** - git
- **`<leader>l`** - lsp
- **`<leader>n`** - neotree
- **`<leader>o`** - outline/aerial
- **`<leader>s`** - search
- **`<leader>t`** - tab
- **`<leader>w`** - window/workspace
- **`<leader>x`** - close
- **`g`** - goto
- **`[`** - prev
- **`]`** - next

---

## Dicas

1. **Descoberta de keymaps**: Pressione `<Space>` e aguarde - o which-key mostrará todas as opções disponíveis
2. **Navegação em splits**: Use `<C-h/j/k/l>` para navegar rapidamente entre janelas
3. **Telescope**: Após abrir qualquer picker do Telescope, use `<C-j/k>` para navegar, `<C-l>` para abrir
4. **LSP**: Posicione o cursor sobre um símbolo e pressione `K` para ver documentação
5. **Harpoon**: Marque seus arquivos mais usados com `<leader>m` e acesse rapidamente com `<leader>1-4`
6. **Git**: Use `<leader>g` + uma letra para acessar rapidamente funções git via Telescope

---

**Última atualização**: 2025-10-29
**Baseado em**: LazyVim keymaps style guide
