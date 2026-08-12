# List available commands
default:
    @just --list

# Syntax-check casks, then run brew style if available
[group("dev")]
lint:
    ruby -c Casks/*.rb
    if command -v brew >/dev/null; then brew style Casks; fi
