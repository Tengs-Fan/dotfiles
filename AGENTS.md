# Please push back

I don't need a sycophant, I need real argument, I don't have ego, fight me with your better idea.
Keep challanging me if you think your idea is better.

# Working

## No Hard Line Break when Writing Documents

Use semantic line breaks in prose and Markdown.
One physical line per prose paragraph. Newlines only for paragraph boundaries, lists, tables, code blocks, or structural source formatting.
Break lines at sentence or meaningful clause boundaries, not at an arbitrary column width.
Do not manually hard-wrap text for visual formatting.

#3 Worktrees

Put worktrees under `~/Projects/WORKTREES/<repository>/<task-or-branch-name>`.
Do not create worktrees beside the primary checkout or under repository-internal directories such as `.worktrees`, `/tmp`.
Use the primary checkout's repository name as the `<repository>` directory and a unique descriptive task or branch slug as the final directory.
Temporary tool-owned worktrees outside `~/Projects`, such as one-shot subprocess scratch directories, are acceptable only when they are created and cleaned by that tool lifecycle.

## Collaboration mode

By default my checkouts are mine: work in a worktree, push, and never edit or clean my working tree.

When collaboration mode is declared, continue using the declared shared checkout instead of creating a worktree.

I declare collaboration mode per directory or branch — "we collaborate", "I'll edit after you", "we'll start collaboration mode in there".
Once declared, that checkout is the shared workspace and we alternate turns in it.

While it is on:

- Edit in my checkout on that branch. Do not isolate into a worktree and push around me.
- My uncommitted changes are my latest turn. Read them, build on them, never discard them. Back up before replacing anything.
- Leave the tree clean and the branch pushed when your turn ends.
- Say what you changed and what you deliberately left alone.

Never rewrite pushed history — force-push, amend, rebase — unless I ask for it in those words.
Push a follow-up commit instead.

## Do Not add author information like
  - `Co-Authored-By` 
  - Generated with 
  - etc.

# Environment Configuration for AI Assistants

## Shell Setup Overview

The shell is zsh with oh-my-zsh. Configuration is split across:
- `/etc/zshenv` - Sets `ZDOTDIR=~/.config/zsh` and sources `~/.bin/env.sh`
- `~/.bin/env.sh` - Defines `set-*` functions for activating dev environments
- `~/.config/zsh/.zshrc` - Main zshrc with oh-my-zsh, plugins, and auto-activated tools

## Python

- **Activate conda when using python**: 
- Conda location: `/opt/homebrew/Caskroom/miniconda/base/`
- The `set-conda` function is already available (do NOT source ~/.bin/env.sh)

```bash
# Chain activation with your command
set-conda && python -m pytest ...
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
- `set-gtl-token` - set NVM_GTLAPI_TOKEN, and NVM_GTLAPI_USER, for GTL authentification
- `set-llm-api-key` - set LLM_API_KEY for OneAPI and INFERENCE_HUB_KEY for inference hub
- `set-jira-token` - set JIRA_API_TOKEN for Jira access
- `set-gitlab-token` - set GITLAB_READ_TOKEN and GITLAB_TOKEN for gitlab access

### Python Environment

```bash
# This uses the base conda environment
set-conda
```

```bash
# This uses the given conda environment
set-conda && conda activate <env-name>
```

```bash
# Chain conda activation with test command
set-conda && python -m pytest path/to/tests -v
```

## Other Tools

- **Editor**: nvim
- **Gitlab**: glab

## AI Agent Skills

- Skills lives in ~/.agents/skills/, sometimes symlinked to `~/.codex/skills` and `~/.claude/skills`.
- If creating or installing a skill, mirror or symlink into both unless the user says otherwise.
