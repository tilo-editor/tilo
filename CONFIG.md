# Configure Tilo

Tilo uses a small TOML-like config file and built-in defaults. You can edit the
file directly or use the in-editor settings screen.

```text
~/.config/tilo/config.toml
```

## In-editor settings

Open settings with `Alt+,`.

The settings screen can directly change scalar options such as toolbar
visibility, theme, update checks, palette layout/appearance, soft wrap, line
numbers, tab size, mouse wheel step, and completion prefix length.

List-like settings are still edited in the config file because they are command
ID arrays or key/value maps. From settings, `Pinned commands`, `Hidden commands`,
`Group order`, and `Keybindings` open `config.toml` for direct editing.

Use `Reload config` after hand-editing the file. `Reset defaults` writes the
built-in default config back to disk.

## Example

```toml
[ui]
toolbar = "hidden"
theme = "high-contrast"

[palette]
layout = "contextual"
pinned = ["file.open", "file.save", "help.show"]
hidden = []
group_order = ["File", "Edit", "View", "Tools", "Help"]
density = "comfortable"
border = "tile"

[editor]
tab_size = 4
wheel_step = 2
completion_min_prefix = 2
soft_wrap = false
show_line_numbers = true

[updates]
check = "manual"

[keys]
"alt+p" = "palette.commands"
"alt+\\" = "view.toggle_columns"
```

## UI

- `toolbar`: `hidden` or `visible`
- `theme`: built-in theme name or a user theme file name

## Palette

- `layout`: `contextual` or `all`
- `pinned`: command IDs promoted near the top
- `hidden`: command IDs omitted from contextual lists
- `group_order`: category order
- `density`: `comfortable` or `compact`
- `border`: `tile`, `rounded`, or `none`

## Editor

- `tab_size`: spaces per tab stop
- `wheel_step`: mouse wheel scroll rows
- `completion_min_prefix`: minimum completion prefix length
- `soft_wrap`: wrap long lines
- `show_line_numbers`: show line numbers

## Updates

- `check`: `off`, `manual`, or `weekly`

`manual` is the default. Tilo only checks for a new public release when you run
`Check for Updates` from the command palette or settings screen. `weekly` adds a
quiet non-blocking startup check at most once per week.

## Themes

Built-in themes:

- `high-contrast`
- `catppuccin-mocha`
- `catppuccin-frappe`
- `tokyo-night`

Custom themes live in:

```text
~/.config/tilo/themes/<name>.toml
```

Theme files can override these keys:

```toml
background = "#000000"
bar_bg = "#0a0a0a"
bar_bg_alt = "#000000"
cursor_line = "#1c1c1c"
border = "#5f5f5f"
text = "#ffffff"
muted = "#bcbcbc"
muted_soft = "#e4e4e4"
cursor = "#ffff00"
selection = "#005f87"
find_match = "#ffaf00"
unsaved = "#ffaf00"
save_accent = "#00ff00"
accent_blue = "#00afff"
button_hover = "#005f87"
error_accent = "#ff5f5f"
```
