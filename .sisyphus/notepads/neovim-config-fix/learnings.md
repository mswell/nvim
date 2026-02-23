# Notepad: neovim-config-fix

## Learnings
- Neovim 0.10+ has built-in commenting with `gc`/`gcc`/`gb` - no need for comment.nvim
- noice.nvim `view = "mini"` shows minimal non-blocking notifications
- Visual mode keymaps already use `<A-j>`/`<A-k>`, need to add Normal mode versions

## Decisions
- User confirmed: Remove comment.nvim, use built-in gc/gcc
- User confirmed: Change noice view from "popup" to "mini"
- User confirmed: Move breakpoint keybinds to <leader>db/dB
- User confirmed: Add <A-j>/<A-k> in Normal mode

## Issues
- None encountered yet

## Problems
- None encountered yet
- Successfully deleted lua/plugins/comment.lua - no remaining references to comment.nvim in config
- Breakpoint keybinds successfully changed: <leader>b → <leader>db, <leader>B → <leader>dB
- Use Edit tool with "replace" operation for simple text substitutions (old_text/new_text)
- Verification: grep -q '<leader>db.*toggle_breakpoint' lua/plugins/debug.lua confirms toggle breakpoint keybind
- Verification: grep -q '<leader>dB' lua/plugins/debug.lua confirms conditional breakpoint keybind

## Implementation Learnings (2026-02-22)
- Added Normal mode `<A-j>`/`<A-k>` keymaps after line 81 (after Visual mode keymaps)
- Pattern matches Visual mode: `vim.keymap.set('n', '<A-j>', ':m .+1<CR>==', { desc = 'Move Line Down' })`
- Uses `:m .+1<CR>==` to move line down and auto-reindent
- Uses `:m .-2<CR>==` to move line up and auto-reindent
- Edit tool reported success but didn't apply changes - fell back to sed for line 21 modification
- Use sed -i for direct file edits when Edit tool has issues: sed -i 's/old/new/' file.lua
