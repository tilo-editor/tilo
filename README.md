# Tilo

**Tilo - the tiled terminal editor.**

Tilo is a terminal-native code editor for developers who live in shells, SSH
sessions, headless machines, and fast keyboard workflows. It keeps the feel of a
real TUI: tiled panes, command palette, timeline, settings, help, Markdown
preview, diagnostics, and mouse support without pretending to be a GUI app.

> Tilo turns the terminal into a tiled coding workspace.

## Install

macOS and Linux:

```sh
curl -fsSL https://raw.githubusercontent.com/tilo-editor/tilo/main/install.sh | sh
```

Manual downloads are available from
[GitHub Releases](https://github.com/tilo-editor/tilo/releases).

After installing:

```sh
tilo --version
tilo README.md
tilo .
```

## Why Tilo

- Terminal-native editing for local shells, SSH, VMs, and containers.
- Tiled workspace model for files, previews, diagnostics, terminals, and future
  agent panes.
- Fast command palette and keyboard-first navigation.
- Markdown split preview, timeline, settings, themes, and built-in help.
- No telemetry in v1.

## Configuration

Config lives at:

```text
~/.config/tilo/config.toml
```

See [CONFIG.md](CONFIG.md) for settings, palette customization, keybindings,
and themes.

## Source Availability

Tilo source is private during the early release period. This public repository
hosts documentation, issue tracking, install scripts, and binary releases.

## Support

Use [GitHub Issues](https://github.com/tilo-editor/tilo/issues) for bug reports
and release feedback. See [SUPPORT.md](SUPPORT.md).

## License

Prebuilt binaries are distributed under the
[Tilo Preview Binary License](LICENSE-BINARY.md).
