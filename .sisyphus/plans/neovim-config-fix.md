# Neovim Config Cleanup & Enhancement

## TL;DR

> **Quick Summary**: Fix popup blocking workflow, remove obsolete comment.nvim plugin, resolve keybind conflicts, and add VSCode-like line movement.
> 
> **Deliverables**:
> - No more blocking popups when deleting lines
> - Remove comment.nvim (use Neovim 0.10+ built-in)
> - Clean debug keybinds (<leader>db/dB)
> - Alt+j/k line movement in Normal mode

> **Estimated Effort**: Quick (~10 min)
> **Parallel Execution**: NO - sequential changes to independent files
> **Critical Path**: All tasks independent, can run in any order

---

## Context

### Original Request
User reported a popup appearing when deleting multiple lines, blocking their workflow. Also wanted to review plugins/keybinds for redundancy with modern Neovim built-ins, and add VSCode-like line movement.

### Interview Summary
**Key Discussions**:
- Popup caused by noice.nvim's `messages.view = "popup"` showing center-screen
- comment.nvim is redundant with Neovim 0.10+ built-in `gc`/`gcc`
- Keybind conflict: `<leader>b` used for both "new buffer" and "toggle breakpoint"
- User wanted Alt+j/k line movement in Normal mode (already had it in Visual)

**Research Findings**:
- noice.nvim: `lua/plugins/noice.lua`
- comment.nvim: `lua/plugins/comment.lua` (only file, no dependencies)
- debug keybinds: `lua/plugins/debug.lua`
- keymaps: `lua/core/keymaps.lua`

### Metis Review
**Identified Gaps** (addressed):
- Ctrl-key commenting shortcuts (`<C-c>`, `<C-/>`): User confirmed they don't use them
- Conditional breakpoint `<leader>B`: User wants to move to `<leader>dB` for consistency
- "mini" view behavior: User accepted the change

---

## Work Objectives

### Core Objective
Fix annoying popup, modernize config by removing obsolete plugin, resolve keybind conflicts, and add requested feature.

### Concrete Deliverables
- `lua/plugins/noice.lua` - messages.view changed to "mini"
- `lua/plugins/comment.lua` - DELETED
- `lua/plugins/debug.lua` - breakpoints moved to <leader>db/dB
- `lua/core/keymaps.lua` - Alt+j/k added in Normal mode

### Definition of Done
- [ ] No blocking popup when deleting lines
- [ ] gc/gcc still works for commenting (built-in)
- [ ] <leader>db toggles breakpoint, <leader>dB sets conditional
- [ ] <leader>b creates new buffer
- [ ] Alt+j/k moves current line up/down in Normal mode

### Must Have
- All 4 files modified correctly
- No syntax errors in Lua files
- Lazy.nvim syncs successfully

### Must NOT Have (Guardrails)
- DO NOT modify which-key group definitions in misc.lua
- DO NOT modify any other keymaps in keymaps.lua
- DO NOT touch theme files
- DO NOT remove any other plugins

---

## Verification Strategy

> **ZERO HUMAN INTERVENTION** — ALL verification is agent-executed.

### Test Decision
- **Infrastructure exists**: NO (no test framework for Lua config)
- **Automated tests**: None
- **Framework**: N/A
- **Agent-Executed QA**: YES - verify via nvim headless commands and file checks

### QA Policy
Every task includes agent-executed QA scenarios with evidence capture.

---

## Execution Strategy

### Parallel Execution Waves

```
Wave 1 (All tasks independent - can run in parallel):
├── Task 1: Fix noice.lua popup view [quick]
├── Task 2: Delete comment.nvim plugin [quick]
├── Task 3: Fix debug.lua breakpoint keybinds [quick]
└── Task 4: Add move line keymaps in keymaps.lua [quick]

Wave FINAL (After ALL tasks):
├── Task F1: Lazy.nvim sync verification [quick]
├── Task F2: Config syntax validation [quick]
└── Task F3: Feature verification [quick]
```

### Dependency Matrix
- **1-4**: — — F1-F3
- **F1**: 1, 2, 3, 4 — F3
- **F2**: 1, 3, 4 — F3
- **F3**: F1, F2 —

---

## TODOs
- [ ] 1. **Fix Noice Popup View**

  **What to do**:
  - Change `messages.view` from `"popup"` to `"mini"` in `lua/plugins/noice.lua`
  - This makes notifications appear in a minimal non-blocking way

  **File**: `lua/plugins/noice.lua`
  **Line**: 21 (change `view = "popup"` to `view = "mini"`)

  **Must NOT do**:
  - DO NOT change other noice settings (cmdline, lsp, presets)
  - DO NOT remove the entire messages block

  **Recommended Agent Profile**:
  - **Category**: `quick`
    - Reason: Single line change, well-defined scope
  - **Skills**: []

  **Parallelization**:
  - **Can Run In Parallel**: YES
  - **Parallel Group**: Wave 1 (with Tasks 2, 3, 4)
  - **Blocks**: F1, F2, F3
  - **Blocked By**: None

  **References**:
  - `lua/plugins/noice.lua:19-31` - Current messages config block
  - Noice docs: https://github.com/folke/noice.nvim#-views

  **Acceptance Criteria**:
  - [ ] `grep -q 'view = "mini"' lua/plugins/noice.lua` returns success
  - [ ] File still valid Lua (no syntax errors)

  **QA Scenarios**:
  ```
  Scenario: Verify mini view is set
    Tool: Bash
    Steps:
      1. grep 'view = ' lua/plugins/noice.lua | grep messages -A1
    Expected Result: Output contains 'view = "mini"'
    Evidence: .sisyphus/evidence/task-1-mini-view.txt
  ```

  **Commit**: NO (commit all changes together)

---

- [ ] 2. **Delete comment.nvim Plugin**

  **What to do**:
  - DELETE the entire file `lua/plugins/comment.lua`
  - Neovim 0.10+ has built-in commenting with `gc`/`gcc`/`gb`

  **File**: `lua/plugins/comment.lua` (DELETE)

  **Must NOT do**:
  - DO NOT search for and remove comment-related keybinds elsewhere (user confirmed they don't use Ctrl-key shortcuts)
  - DO NOT modify any other files

  **Recommended Agent Profile**:
  - **Category**: `quick`
    - Reason: Simple file deletion
  - **Skills**: []

  **Parallelization**:
  - **Can Run In Parallel**: YES
  - **Parallel Group**: Wave 1 (with Tasks 1, 3, 4)
  - **Blocks**: F1, F3
  - **Blocked By**: None

  **References**:
  - `lua/plugins/comment.lua` - File to delete (contains Comment.nvim config)
  - Neovim 0.10 release notes: Built-in commenting support

  **Acceptance Criteria**:
  - [ ] `test ! -f lua/plugins/comment.lua` returns success
  - [ ] No references to comment.nvim in other config files

  **QA Scenarios**:
  ```
  Scenario: Verify comment.lua is deleted
    Tool: Bash
    Steps:
      1. test -f lua/plugins/comment.lua && echo "FAIL: file exists" || echo "PASS: file deleted"
    Expected Result: "PASS: file deleted"
    Evidence: .sisyphus/evidence/task-2-comment-deleted.txt

  Scenario: Verify no comment.nvim references remain
    Tool: Bash
    Steps:
      1. grep -r "Comment" lua/ --include="*.lua" 2>/dev/null || true
    Expected Result: No output (no references)
    Evidence: .sisyphus/evidence/task-2-no-refs.txt
  ```

  **Commit**: NO (commit all changes together)

---

- [ ] 3. **Fix Debug Breakpoint Keybinds**

  **What to do**:
  - Change `<leader>b` to `<leader>db` for toggle breakpoint (line 47)
  - Change `<leader>B` to `<leader>dB` for conditional breakpoint (line 48-50)

  **File**: `lua/plugins/debug.lua`
  **Lines**: 47-50

  **Current code**:
  ```lua
  vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = 'Toggle Breakpoint' })
  vim.keymap.set('n', '<leader>B', function()
    dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
  end, { desc = 'Breakpoint Condition' })
  ```

  **New code**:
  ```lua
  vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = 'Toggle Breakpoint' })
  vim.keymap.set('n', '<leader>dB', function()
    dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
  end, { desc = 'Breakpoint Condition' })
  ```

  **Must NOT do**:
  - DO NOT change F-key mappings (F1-F7)
  - DO NOT change any other keybinds in this file
  - DO NOT modify the dapui.setup() or other config

  **Recommended Agent Profile**:
  - **Category**: `quick`
    - Reason: Two simple keybind changes
  - **Skills**: []

  **Parallelization**:
  - **Can Run In Parallel**: YES
  - **Parallel Group**: Wave 1 (with Tasks 1, 2, 4)
  - **Blocks**: F2, F3
  - **Blocked By**: None

  **References**:
  - `lua/plugins/debug.lua:47-50` - Keybinds to change
  - `lua/core/keymaps.lua:44` - `<leader>b` for new buffer (confirm no conflict after change)
  - `lua/plugins/misc.lua:22` - `<leader>d` group for "diagnostics/debug"

  **Acceptance Criteria**:
  - [ ] `grep -q '<leader>db.*toggle_breakpoint' lua/plugins/debug.lua` returns success
  - [ ] `grep -q '<leader>dB.*Breakpoint Condition' lua/plugins/debug.lua` returns success
  - [ ] No `<leader>b` or `<leader>B` (alone) in debug.lua

  **QA Scenarios**:
  ```
  Scenario: Verify toggle breakpoint keybind
    Tool: Bash
    Steps:
      1. grep "<leader>db" lua/plugins/debug.lua | grep toggle_breakpoint
    Expected Result: Line contains '<leader>db' and 'toggle_breakpoint'
    Evidence: .sisyphus/evidence/task-3-toggle-bp.txt

  Scenario: Verify conditional breakpoint keybind
    Tool: Bash
    Steps:
      1. grep "<leader>dB" lua/plugins/debug.lua | grep -i condition
    Expected Result: Line contains '<leader>dB' and 'condition'
    Evidence: .sisyphus/evidence/task-3-cond-bp.txt

  Scenario: Verify no old keybinds remain
    Tool: Bash
    Steps:
      1. grep "<leader>b" lua/plugins/debug.lua | grep -v "<leader>db" | grep -v "<leader>dB" || echo "PASS"
    Expected Result: "PASS" (no old keybinds)
    Evidence: .sisyphus/evidence/task-3-no-old-binds.txt
  ```

  **Commit**: NO (commit all changes together)

---

- [ ] 4. **Add Move Line Keymaps in Normal Mode**

  **What to do**:
  - Add `<A-j>` and `<A-k>` keymaps for Normal mode to move current line up/down
  - This matches VSCode behavior (Alt+Up/Down moves line)
  - User already has these in Visual mode (lines 80-81)

  **File**: `lua/core/keymaps.lua`
  **Insert after**: Line 81 (after the existing visual mode keymaps)

  **Code to add**:
  ```lua
  -- Move line up and down (Normal mode - like VSCode)
  vim.keymap.set('n', '<A-j>', ':m .+1<CR>==', { desc = 'Move Line Down' })
  vim.keymap.set('n', '<A-k>', ':m .-2<CR>==', { desc = 'Move Line Up' })
  ```

  **Must NOT do**:
  - DO NOT modify existing visual mode keymaps (lines 80-81)
  - DO NOT change any other keybinds in this file
  - DO NOT use `<A-Down>`/`<A-Up>` (user prefers j/k)

  **Recommended Agent Profile**:
  - **Category**: `quick`
    - Reason: Adding 2 lines of code
  - **Skills**: []

  **Parallelization**:
  - **Can Run In Parallel**: YES
  - **Parallel Group**: Wave 1 (with Tasks 1, 2, 3)
  - **Blocks**: F2, F3
  - **Blocked By**: None

  **References**:
  - `lua/core/keymaps.lua:80-81` - Existing visual mode keymaps (pattern to follow)
  - `:help :move` - Vim move command documentation

  **Acceptance Criteria**:
  - [ ] `grep -q "vim.keymap.set('n', '<A-j>'" lua/core/keymaps.lua` returns success
  - [ ] `grep -q "vim.keymap.set('n', '<A-k>'" lua/core/keymaps.lua` returns success
  - [ ] Visual mode keymaps still present (lines 80-81 unchanged)

  **QA Scenarios**:
  ```
  Scenario: Verify normal mode move down keymap
    Tool: Bash
    Steps:
      1. grep "<A-j>" lua/core/keymaps.lua | grep "'n'"
    Expected Result: Line with mode 'n' and <A-j>
    Evidence: .sisyphus/evidence/task-4-move-down.txt

  Scenario: Verify normal mode move up keymap
    Tool: Bash
    Steps:
      1. grep "<A-k>" lua/core/keymaps.lua | grep "'n'"
    Expected Result: Line with mode 'n' and <A-k>
    Evidence: .sisyphus/evidence/task-4-move-up.txt

  Scenario: Verify visual mode keymaps preserved
    Tool: Bash
    Steps:
      1. grep "<A-j>" lua/core/keymaps.lua | grep "'v'"
    Expected Result: Line with mode 'v' and <A-j> (unchanged)
    Evidence: .sisyphus/evidence/task-4-visual-preserved.txt
  ```

  **Commit**: NO (commit all changes together)

---
## Final Verification Wave

 [x] F1. **Lazy.nvim Sync** — `quick`
  Run `nvim --headless "+Lazy! sync" +qa` to ensure plugins sync correctly after comment.nvim removal.
  **QA Scenario**: Command exits with code 0.

 [x] F2. **Config Syntax Validation** — `quick`
  Run `nvim --headless -c "lua print('OK')" +qa` to verify no Lua syntax errors.
  **QA Scenario**: Command exits with code 0, prints "OK".

 [x] F3. **Feature Verification** — `quick`
  Verify all changes work:
  - `grep -q 'view = "mini"' lua/plugins/noice.lua`
  - `test ! -f lua/plugins/comment.lua`
  - `grep -q '<leader>db' lua/plugins/debug.lua`
  - `grep -q '<A-j>' lua/core/keymaps.lua`

---

## Commit Strategy

Single commit after all changes:
- Message: `fix(config): resolve popup, remove comment.nvim, fix keybinds, add move line`
- Files: `lua/plugins/noice.lua`, `lua/plugins/comment.lua` (deleted), `lua/plugins/debug.lua`, `lua/core/keymaps.lua`
- Pre-commit: `stylua lua/`

---

## Success Criteria

### Verification Commands
```bash
# 1. Noice mini view
grep -q 'view = "mini"' lua/plugins/noice.lua && echo "PASS" || echo "FAIL"

# 2. comment.nvim deleted
test ! -f lua/plugins/comment.lua && echo "PASS" || echo "FAIL"

# 3. Debug keybinds updated
grep -q '<leader>db.*toggle' lua/plugins/debug.lua && echo "PASS" || echo "FAIL"
grep -q '<leader>dB.*conditional' lua/plugins/debug.lua && echo "PASS" || echo "FAIL"

# 4. Move line keymaps added
grep -q "vim.keymap.set('n', '<A-j>'" lua/core/keymaps.lua && echo "PASS" || echo "FAIL"

# 5. No syntax errors
nvim --headless -c "lua print('OK')" +qa 2>&1 | grep -q "OK" && echo "PASS" || echo "FAIL"
```

### Final Checklist
- [ ] All "Must Have" present
- [ ] All "Must NOT Have" absent
- [ ] Lazy sync succeeds
- [ ] No Lua syntax errors
