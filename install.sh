#!/usr/bin/env sh
set -eu

REPO="${TILO_REPO:-tilo-editor/tilo}"
INSTALL_DIR="${HOME}/.local/bin"
VERSION="latest"

usage() {
	cat <<'USAGE'
Install Tilo.

Usage:
  install.sh [--dir <path>] [--version <version>]

Examples:
  curl -fsSL https://raw.githubusercontent.com/tilo-editor/tilo/main/install.sh | sh
  curl -fsSL https://raw.githubusercontent.com/tilo-editor/tilo/main/install.sh | sh -s -- --dir /usr/local/bin
  curl -fsSL https://raw.githubusercontent.com/tilo-editor/tilo/main/install.sh | sh -s -- --version v0.1.0
USAGE
}

while [ "$#" -gt 0 ]; do
	case "$1" in
		--dir)
			shift
			[ "$#" -gt 0 ] || { echo "install.sh: --dir needs a path" >&2; exit 2; }
			INSTALL_DIR="$1"
			;;
		--version)
			shift
			[ "$#" -gt 0 ] || { echo "install.sh: --version needs a value" >&2; exit 2; }
			VERSION="$1"
			;;
		--help|-h)
			usage
			exit 0
			;;
		*)
			echo "install.sh: unknown argument $1" >&2
			usage >&2
			exit 2
			;;
	esac
	shift
done

os="$(uname -s)"
arch="$(uname -m)"

case "$os" in
	Darwin) os_label="Darwin" ;;
	Linux) os_label="Linux" ;;
	*) echo "install.sh: unsupported OS: $os" >&2; exit 1 ;;
esac

case "$arch" in
	arm64|aarch64) arch_label="arm64" ;;
	x86_64|amd64) arch_label="x86_64" ;;
	*) echo "install.sh: unsupported architecture: $arch" >&2; exit 1 ;;
esac

asset="tilo_${os_label}_${arch_label}.tar.gz"
if [ "$VERSION" = "latest" ]; then
	base_url="https://github.com/${REPO}/releases/latest/download"
else
	base_url="https://github.com/${REPO}/releases/download/${VERSION}"
fi

tmp="${TMPDIR:-/tmp}/tilo-install.$$"
mkdir -p "$tmp"
trap 'rm -rf "$tmp"' EXIT INT TERM

download() {
	url="$1"
	dest="$2"
	if command -v curl >/dev/null 2>&1; then
		curl -fsSL "$url" -o "$dest"
	elif command -v wget >/dev/null 2>&1; then
		wget -q "$url" -O "$dest"
	else
		echo "install.sh: curl or wget is required" >&2
		exit 1
	fi
}

echo "Downloading $asset"
download "$base_url/$asset" "$tmp/$asset"

if download "$base_url/checksums.txt" "$tmp/checksums.txt" 2>/dev/null; then
	(
		cd "$tmp"
		grep "  $asset\$" checksums.txt > checksums.selected
		if command -v sha256sum >/dev/null 2>&1; then
			sha256sum -c checksums.selected
		elif command -v shasum >/dev/null 2>&1; then
			shasum -a 256 -c checksums.selected
		else
			echo "No checksum tool found; skipping checksum verification"
		fi
	)
else
	echo "No checksums.txt found; skipping checksum verification"
fi

tar -xzf "$tmp/$asset" -C "$tmp"
mkdir -p "$INSTALL_DIR"
install -m 0755 "$tmp/tilo_${os_label}_${arch_label}/tilo" "$INSTALL_DIR/tilo"

echo "Tilo installed to $INSTALL_DIR/tilo"
echo "Run: tilo --version"
