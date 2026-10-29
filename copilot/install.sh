SCRIPT_DIR=$(CDPATH= cd "$(dirname "$0")" && pwd)

ln -s "$SCRIPT_DIR/copilot-instructions.md" "$HOME/.copilot/copilot-instructions.md"
ln -s "$SCRIPT_DIR/settings.json" "$HOME/.copilot/settings.json"
ln -s "$SCRIPT_DIR/skills/" "$HOME/.copilot/skills/"
