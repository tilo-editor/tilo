# Tilo Guide

Tilo is a terminal-native editor for shell-first development. It is designed to
feel like a TUI workspace, not a GUI IDE squeezed into a terminal.

## First Run

Open a file or a directory:

```sh
tilo README.md
tilo .
```

Start with these commands:

- `Alt+P` or `F2`: command palette
- `Ctrl+P`: file picker
- `F1`: help
- `Alt+,`: settings
- `Ctrl+S`: save
- `Ctrl+Q`: quit

The toolbar is mouse-clickable when visible. The command palette remains the
main way to discover commands.

## Editing

Tilo includes the expected editing loop:

- tabs and session restore
- syntax highlighting
- find/replace with regex controls
- soft wrap and line numbers
- multi-cursor editing
- clipboard operations
- undo/redo
- run command and problems panel

Useful editing commands:

- `Ctrl+D`: add next matching cursor
- `Ctrl+Shift+L`: select all matches
- `Alt+Z`: toggle soft wrap
- `Alt+E`: show problems
- `F8` / `Shift+F8`: next / previous problem

## Source Control

Tilo uses your local `git` executable. It does not embed a Git library and does
not perform network operations except when you explicitly run Git commands such
as push, pull, or fetch.

Common Git actions:

- `Alt+G`: Source Control panel
- `Alt+Up` / `Alt+Down`: previous / next changed hunk
- `Alt+B`: toggle inline blame for the current line
- `Alt+S`: stage the hunk under the cursor
- `Git: Revert Hunk`: revert the hunk under the cursor
- `Git: Switch Branch...`: open the branch picker

Source Control supports status, diffs, stage, unstage, discard, commit, push,
pull, fetch, branch switching, a change gutter, inline blame, and hunk-level
stage/revert.

Safety rules:

- Hunk stage/revert requires the file to be saved first.
- Revert Hunk edits the buffer and is undoable.
- Stage Hunk uses `git apply --cached`; failed applies leave the index unchanged.
- Branch switching uses `git switch`; Git blocks unsafe switches with local
  conflicts.
- Blame and the change gutter refresh on save and active-file changes, not every
  keystroke.

## Formatting

Use `Alt+F` or run `Format Document` from the command palette.

Supported formats:

- Go: `go/format`
- JSON: built-in formatter and validation
- YAML: built-in formatter that preserves comments and key order
- TOML: built-in whitespace tidy, with optional Taplo for deep formatting
- XML: `xmllint` when available, otherwise built-in whitespace tidy

Run `Install TOML Formatter (taplo)` from the command palette if you want deep
TOML formatting. Tilo keeps external tools optional so the editor remains a
single small binary.

## Split Views

Tilo has two current split-style modes:

- `Alt+M`: Markdown source and live preview.
- `Alt+\`: two-column continuous view of the active file.

The broader pane system is future work. Today these modes are focused, reliable
views for one active buffer.

## Settings

Open settings with `Alt+,`.

The settings screen can change common scalar options directly: toolbar,
theme, update checks, palette layout/appearance, soft wrap, line numbers, tab
size, wheel step, and completion prefix length.

List and map settings are edited in:

```text
~/.config/tilo/config.toml
```

Use `Reload config` after hand-editing. Use `Reset defaults` to write the built-in
defaults back to disk.

## Updates

Update checks are manual by default:

- Run `Check for Updates` from the command palette or settings.
- Set `updates.check = "weekly"` for a quiet weekly startup notice.

Tilo does not include telemetry.

## Current Preview Constraints

- Windows release assets are not published yet.
- Some language intelligence depends on external language servers.
- Git conflict resolution UI, stash UI, and git-history timeline fusion are
  planned future work.
- The source repository is private during the early release period; this public
  repository hosts documentation, issues, install scripts, checksums, and release
  binaries.
