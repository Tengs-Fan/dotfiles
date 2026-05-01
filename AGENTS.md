# Environment Configuration for AI Assistants

## Shell Setup Overview

The shell is zsh with oh-my-zsh. Configuration is split across:
- `/etc/zshenv` - Sets `ZDOTDIR=~/.config/zsh` and sources `~/.bin/env.sh`
- `~/.bin/env.sh` - Defines `set-*` functions for activating dev environments
- `~/.config/zsh/.zshrc` - Main zshrc with oh-my-zsh, plugins, and auto-activated tools

## Python

- **Activate conda in each command**: Shell state does not persist between tool calls, so chain with `&&`
- After activation, use `python` (not `python3`)
- Conda location: `/opt/homebrew/Caskroom/miniconda/base/`
- The `set-conda` function is already available (do NOT source ~/.bin/env.sh)

```bash
# Chain activation with your command
set-conda && conda activate base && python -m pytest ...
```

## Environment Activation Functions

These functions are defined in `~/.bin/env.sh` and available in all shells.
**Do NOT source `~/.bin/env.sh`** - it's already sourced via `/etc/zshenv`.

### Auto-activated on shell start:
- `set-brew` - Homebrew
- `set-rust` - Rust/Cargo
- `set-haskell` - GHCup
- `set-llvm` - LLVM toolchain
- `set-coursier` - Scala Coursier

### On-demand (call when needed):
- `set-conda` - Miniconda (for conda environments)
- `set-cuda` - CUDA toolkit
- `set-deno` - Deno runtime
- `set-ruby` - Ruby
- `set-proxy` / `unset-proxy` - HTTP/HTTPS proxy (127.0.0.1:7890)

## Running Tests

```bash
# Chain conda activation with test command
set-conda && conda activate base && python -m pytest path/to/tests -v
```

## Other Tools

- **Editor**: nvim
- **Git**: Extensive aliases defined in `~/.config/zsh/aliases` (e.g., `gst` for `git status`)
- **Navigation**: zoxide is configured (`z` command for smart cd)
- **Dotfiles**: Managed via bare git repo, use `config` alias instead of `git`

## AI Agent Skills

- Skills can live in both `~/.codex/skills` (Codex) and `~/.claude/skills` (Claude).
- When asked to use or install a skill, check both locations.
- If creating or installing a skill, mirror or symlink into both unless the user says otherwise.

## Platform Notes

- macOS with Apple Silicon (arm64)
- Homebrew at `/opt/homebrew`

# Do Not add `Co-Authored-By` in the end of your output
