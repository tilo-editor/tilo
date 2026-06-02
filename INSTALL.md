# Install Tilo

## macOS and Linux

```sh
curl -fsSL https://raw.githubusercontent.com/tilo-editor/tilo/main/install.sh | sh
```

The installer detects your OS and CPU, downloads the latest release asset,
verifies `checksums.txt` when a checksum tool is available, and installs `tilo`
to `~/.local/bin` by default.

To choose a different install directory:

```sh
curl -fsSL https://raw.githubusercontent.com/tilo-editor/tilo/main/install.sh | sh -s -- --dir /usr/local/bin
```

## Manual Install

1. Open [GitHub Releases](https://github.com/tilo-editor/tilo/releases).
2. Download the archive for your platform.
3. Verify it against `checksums.txt`.
4. Move the `tilo` binary into a directory on your `PATH`.

## Supported Release Assets

- `tilo_Darwin_arm64.tar.gz`
- `tilo_Darwin_x86_64.tar.gz`
- `tilo_Linux_arm64.tar.gz`
- `tilo_Linux_x86_64.tar.gz`

## Verify

```sh
tilo --version
tilo --help
```

If your shell cannot find `tilo`, add `~/.local/bin` to your `PATH`.
