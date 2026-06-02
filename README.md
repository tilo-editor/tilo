# Tilo

**Tilo - the tiled terminal editor.**

Tilo is a terminal-native code editor for developers who live in shells, SSH
sessions, containers, headless VMs, and fast keyboard workflows.

It is built around tiles: buffers, Markdown previews, diagnostics, command
surfaces, settings, help, timeline history, and future agent panes arranged as
one clean TUI workspace.

```text
+-----+-----+-----+
| ### | ### | ### |
+-----+-----+-----+
|     | ### |  |  |
+-----+-----+-----+
|     | ### |     |
+-----+-----+-----+
```

> Tilo turns the terminal into a tiled coding workspace.

## Install

Homebrew:

```sh
brew tap tilo-editor/tap
brew install tilo
```

macOS and Linux installer:

```sh
curl -fsSL https://raw.githubusercontent.com/tilo-editor/tilo/main/install.sh | sh
```

Manual downloads:

```text
https://github.com/tilo-editor/tilo/releases
```

Verify:

```sh
tilo --version
tilo --help
```

## Quick Start

```sh
tilo README.md
tilo .
```

Useful first keys:

- `Alt+P` or `F2`: command palette
- `Ctrl+P`: open file
- `F1`: help
- `Alt+,`: settings
- `Alt+M`: Markdown source/preview split
- `Alt+\`: two-column continuous editor view
- `Alt+T`: timeline
- `Ctrl+S`: save
- `Ctrl+Q`: quit

Mouse support is enabled for buttons, tabs, palette items, settings controls,
two-column editing, and timeline interaction where the terminal supports it.

## Why Use Tilo

Tilo is for developers who want an editor that belongs in the terminal instead
of a GUI editor projected into a terminal-shaped window.

Good fits:

- Editing over SSH without forwarding a full desktop app.
- Working inside containers, remote shells, cloud VMs, and recovery sessions.
- Keeping editor, command output, diagnostics, and notes close to the shell.
- Using a low-latency keyboard-first editor with enough mouse affordances to be
  discoverable.
- Running on machines where installing a full IDE is heavy or impractical.
- Building toward AI/agent workflows that should live beside code, not outside
  the terminal session.

Tilo is not trying to replace every mature IDE feature on day one. The goal is a
small, fast, terminal-native workspace that earns trust by doing the core
editing loop well.

## Features

Current preview features:

- Terminal-native editor built in Go with Bubble Tea/Lip Gloss.
- Tiled mental model with tabs, preview panes, overlays, and modal tools.
- Command palette with contextual commands and mouse-clickable rows.
- TUI settings backed by `~/.config/tilo/config.toml`.
- Built-in help/about surface.
- Markdown source/preview split editing with live preview.
- Two-column continuous editor view for seeing more of one file at once.
- Manual update checks, with optional weekly passive notices.
- Timeline view for buffer history.
- Diagnostics/problem panel from run output and LSP.
- LSP hooks for diagnostics, completion, hover, and go-to-definition.
- Multi-cursor editing.
- Themes and user theme files.
- Soft wrap, line numbers, search, file open, save, save as, and session restore.
- No telemetry in v1 preview.

The current preview supports prebuilt binaries for:

- macOS arm64
- macOS x86_64
- Linux arm64
- Linux x86_64

Windows binaries are intentionally not part of the first preview release.

## Split Views

Tilo currently has two split-style surfaces:

- `Alt+M`: Markdown source/preview split. The source stays editable on the left
  while the rendered preview tracks it on the right. Narrow terminals fall back
  to a full-window preview.
- `Alt+\`: two-column continuous editor view. The active file is rendered as two
  side-by-side columns, with the right column continuing after the left. This is
  useful for scanning long files and needs a terminal at least 64 columns wide.

The general multi-pane layout system is still a v2 proposal; the current
two-column view is a rendering mode for one buffer, not arbitrary pane splitting.

## Configuration

Config file:

```text
~/.config/tilo/config.toml
```

Theme directory:

```text
~/.config/tilo/themes/
```

Tilo can be configured from inside the editor with `Alt+,`, or by editing the
config file directly.

The settings screen exposes toolbar/theme, update checks, command palette
layout and appearance, editor defaults, keybinding entry points, config reload,
and reset-to-defaults.

Update checks are manual by default. Run `Check for Updates` from the command
palette or settings screen, or set `updates.check = "weekly"` for a quiet
weekly notice when a newer public release exists.

See [CONFIG.md](CONFIG.md) for:

- editor settings
- palette layout
- update checks
- pinned/hidden commands
- keybindings
- theme keys
- custom theme files

## Install Details

See [INSTALL.md](INSTALL.md) for:

- Homebrew install
- one-line installer
- manual release downloads
- checksum verification
- custom install directories

## Reporting Bugs

Use [GitHub Issues](https://github.com/tilo-editor/tilo/issues).

Issue templates are enabled for:

- bug reports
- feature requests

When reporting a bug, include:

- `tilo --version`
- OS and CPU architecture
- terminal app
- shell
- reproduction steps
- screenshots or terminal recordings when useful

See [SUPPORT.md](SUPPORT.md) for support expectations and report details.

## Security

Tilo v1 preview has no telemetry.

Do not post secrets, proprietary source, or private logs in public issues. See
[SECURITY.md](SECURITY.md) for security reporting guidance.

## Source Availability

Tilo source is private during the early release period. This public repository
hosts:

- install docs
- configuration docs
- issue tracking
- release binaries
- checksums
- public support material

## License

Prebuilt binaries are distributed under the
[Tilo Preview Binary License](LICENSE-BINARY.md).
