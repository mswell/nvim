# Notepad: neovim-config-fix

## Decisions Made
- 2026-02-23: Remove comment.nvim plugin (use Neovim 0.10+ built-in commenting)
- 2026-02-23: Change noice messages.view from "popup" to "mini"
- 2026-02-23: Move toggle breakpoint to <leader>db, conditional to <leader>dB
- 2026-02-23: Add <A-j>/<A-k> in Normal mode for line movement

## Architectural Choices
- Keeping noice.nvim but changing view to "mini" - balances notification utility with non-blocking UX
- Using built-in commenting (gc/gcc) reduces plugin count
- Debug keybinds now use <leader>db/dB to avoid conflict with <leader>b (new buffer)

## Gotchas
- No gotchas discovered yet
