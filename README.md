# Omni (`omnishell`)

# About

**Omni** is a speed-optimized, modular shell framework and environment manager for Bash. Designed around on-demand lazy loading (`__lazy`), Omni keeps shell startup instantaneous while providing isolated workspaces (**environments**), strict namespace hygiene (`__<context>__` and `<context>.<method>`), modular **tools**, reusable **contexts**, remote/local **providers**, enhanced shell **builtins**, safe **trash** management with automatic expiration, and environment-scoped **SSH** namespace and key management.

## Key Features

- **Zero-Overhead Lazy Loading**: Commands, tools, contexts, and completions are registered as lightweight stubs and only sourced when first invoked.
- **Environment Isolation (`envs`)**: Switch workspaces seamlessly with environment-specific directories (`PATH`, `BIN`, `TMP`, `SEC`, `MNT`), tools, contexts, builtins, bookmarks, file openers, and SSH keys.
- **Strict Namespacing & Scoping**: Uses `__<name>__` entrypoints, `<name>.<method>` subcommands, and a `private` variable/function mechanism that automatically cleans up on function `RETURN`.
- **Provider Ecosystem (`providers`)**: Discover, install, and synchronize tools and contexts from local directories or remote Git repositories (such as the official `https://github.com/omnishell/provider.git`).
- **Enhanced Builtins (`builtins`)**: Optional drop-in shell ergonomics (`cd`/`back`/`home`, `ls`/`la`/`lf`/`ld`/`laf`/`lad`, `md`, `mf`, `cp`, `mv`, trash-backed `rm`, `clip`, `has`).
- **Builtin Tools**: Ships with `dot` (`.` rapid filesystem navigation), `comma` (`,` hierarchical aliases and path jumping), `open` (environment-scoped file/directory openers), `import` (selective context attribute importer), `private` (function-scoped variables), `compl` (annotation-driven tab completion generator), and `help`.
- **Interactive Documentation (`omni doc`)**: Built-in terminal documentation viewer with rich ANSI formatting rendered through `$PAGER` / `less`.

## Architecture & Directory Structure

```text
omni/
├── init              # Framework entrypoint sourced by ~/.bashrc
├── install           # Installer script that registers __omni__ in ~/.bashrc
├── doc               # Terminal documentation formatter and viewer
├── docs/             # Framework documentation chapters (01-intro .. 05-providers)
├── mods/
│   ├── helper        # Core internal runtime (__lazy, __init, __declare, __compl, etc.)
│   ├── omni          # Main `omni` CLI dispatcher
│   └── omni.d/       # Subcommand modules (envs, tools, providers, contexts, builtins, run, ssh, trash)
├── tools/            # Builtin tools (comma, compl, dot, help, import, open, private)
└── contexts/         # Builtin contexts (helper, types, types.d/list)
```

---

# Install

## Automatic Installation

Clone the repository and run the installer script:

```bash
git clone https://github.com/omnishell/omni.git ~/.omni/core
cd ~/.omni/core
./install
```

The `./install` script appends the `__omni__` initialization block to `~/.bashrc` and loads Omni into the current session.

## Manual Installation

Add the following function to your `~/.bashrc` (adjusting `__OMNI` to point to your cloned `omni` directory):

```bash
function __omni__() {
  export __OMNI="/path/to/omni"
  source "$__OMNI/init"
}
__omni__
```

Then reload your shell:

```bash
source ~/.bashrc
```

## Configuration Files & Paths

When initialized, Omni sets up the following environment variables and user directories:

| Variable | Default Path | Description |
| :--- | :--- | :--- |
| `__OMNI` | `/path/to/omni` | Root directory of the Omni framework installation |
| `OMNI` | `~/.omni` | User data root directory |
| `OMNIRC` | `~/.omni/omnirc` | Persistent configuration state file |
| `OMNI_PROVIDERS` | `~/.omni/providers` | Installed remote provider repositories |
| `OMNI_TOOLS` | `~/.omni/tools` | Standalone cloned tools |
| `__ENV` | `main` | Active Omni environment name |

---

# Usage

```bash
omni [-c|--conf <omnirc>] <command> [args...]
```

## Core Commands

### Initialize Configuration (`omni init`)

Load or reload an `omnirc` configuration file:

```bash
omni init [-c|--conf <rcfile>]
```

### View Documentation (`omni doc`)

Open the interactive framework manual in `$PAGER` (`less -R`):

```bash
omni doc
```

### Run Isolated Commands (`omni run`)

Execute a script or command inside an isolated subshell, optionally switching to a target environment for the duration of the command:

```bash
omni run [-e|--env <env>] <file_or_command> [args...]
```

---

## Environments (`omni envs`)

Environments isolate workspace paths, active tools, contexts, builtins, trash directories, and SSH keys.

```bash
# List all registered environments (* marks the active environment)
omni envs ls

# Create or update an environment
omni envs set <env> -p|--path=<path> \
  [-b|--bin=<bin_dir>] \
  [-t|--tmp=<tmp_dir>] \
  [-s|--sec=<sec_dir>] \
  [-m|--mnt=<mnt_dir>]

# Inspect paths (ENV_PATH, BIN, TMP, SEC, MNT) for an environment (defaults to current)
omni envs get [<env>]

# Switch to an environment (optionally persist as default with -g/--global)
omni envs use <env> [-g|--global] [-b|--builtins=ls,cd,rm,...]

# Re-initialize an environment
omni envs init [<env>]

# Remove an environment
omni envs rm <env>
```

---

## Providers (`omni providers`)

Providers supply catalogs of tools and contexts from local paths or remote Git URLs. By default, Omni registers the local `builtins` provider and the remote `omni` provider (`https://github.com/omnishell/provider.git`).

```bash
# List registered providers (filter by -l/--local or -r/--remote)
omni providers ls [-l|--local] [-r|--remote]
omni providers la

# Register a local or remote provider
omni providers set <name> --type local -d|--dir <directory>
omni providers set <name> --type remote -u|--url <git_url>

# Clone/install a remote provider into ~/.omni/providers/<name>
omni providers install <name>

# Pull latest updates for an installed remote provider
omni providers sync <name>

# Inspect tools and contexts offered by a provider (or -a/--all)
omni providers get <name>
omni providers get -a|--all

# Uninstall a remote provider clone or remove provider registration
omni providers uninstall <name>
omni providers rm <name>
```

---

## Tools (`omni tools`)

Tools are modular CLI extensions lazy-loaded into specific environments.

```bash
# List active tools in an environment, or list available tools from a provider
omni tools ls [-e|--env <env>] [-p|--provider <provider>] [-a|--all]

# Enable a tool from a provider (defaults to builtins, or specify --provider omni)
omni tools use <tool> [-e|--env <env>] [--provider <provider>]

# Enable a tool directly from a local directory path
omni tools use -p|--path <path> [-e|--env <env>] [<tool>]

# Clone and enable a tool directly from a Git URL
omni tools use -u|--url <git_url> [-e|--env <env>] [<tool>]

# Disable/remove a tool from an environment
omni tools rm <tool> [-e|--env <env>] [-p|--provider <provider>] [--path <path>]

# Invoke a tool one-off without permanently enabling it in the environment
omni tools call <tool> [-p|--provider <provider>] [args...]
```

---

## Contexts (`omni contexts`)

Contexts encapsulate reusable helper functions, data structures, and state that can be loaded into environments or selectively imported.

```bash
# List active or available contexts
omni contexts ls [-e|--env <env>] [-p|--provider <provider>] [-a|--all]

# Activate a context in an environment
omni contexts use <context> [-e|--env <env>] [-p|--provider <provider>]

# Remove a context from an environment
omni contexts rm <context> [-e|--env <env>] [-p|--provider <provider>]

# Inspect a context's functions or print a specific attribute/method body
omni contexts get <context> [<attr>] [-p|--provider <provider>]
```

### Builtin Contexts

- **`helper`**: Provides utility functions (`helper.is` for file/type checks).
- **`types`**: Provides data structure manipulation methods (`types.list` with `.append`, `.rm`/`.remove`, `.extend`, `.reverse`).

---

## Builtins (`omni builtins`)

Omni includes optional enhanced shell builtins that can be enabled globally or per environment.

```bash
# List available and active builtins
omni builtins ls [-e|--env <env>] [-a|--all]

# Enable a specific builtin or all builtins
omni builtins use <builtin> [-e|--env <env>]
omni builtins use -a|--all [-e|--env <env>]

# Bind a custom function as a builtin
omni builtins set <builtin> <func_name> [-e|--env <env> | -g|--global]

# Disable a builtin or reset all builtins to standard shell defaults
omni builtins rm <builtin> [-e|--env <env> | -g|--global]
omni builtins reset
```

### Default Builtins Reference

| Builtin | Alias | Description |
| :--- | :--- | :--- |
| `has <cmd>` | — | Check if a command, function, or binary exists in `$PATH` |
| `clip` | — | Pipe stdin to system clipboard (`xclip -selection clipboard` or `xsel --clipboard --input`) |
| `cd [<dir>]` | — | Push directory onto directory stack (`pushd`) quietly |
| `back [<N>]` | `-` | Pop `<N>` directories from stack (`popd`) |
| `home` | `--` | Jump to `$HOME` and list contents |
| `ls` / `la` | — | Colorized directory listing (`la` includes hidden files) |
| `lf` / `laf` | — | List regular files/symlinks only (`laf` includes hidden files) |
| `ld` / `lad` | — | List directories only (`lad` includes hidden directories) |
| `ln <src> <dst>` | — | Symbolic link with `ln -sf` |
| `md <dirs...>` | — | Create directories recursively (`mkdir -p`) |
| `mf <files...>` | — | Create parent directories automatically and touch file(s) |
| `cp` | — | Copy files/dirs (supports `-e\|--exclude <glob>`), or copy stdin/single file content directly to clipboard |
| `mv` | — | Move files/dirs (supports `-e\|--exclude <glob>` and auto-creates destination parent dirs) |
| `rm` | — | Safe delete: moves targets to environment trash and cleans expired items (`-e\|--exclude <glob>`, `-t\|--trash <name>`, `-f\|--force` for permanent `rm -rf`) |

---

## Trash Management (`omni trash`)

Works alongside the `rm` builtin to provide per-environment trash directories with configurable retention windows.

```bash
# Configure a trash directory for an environment
omni trash new|set <trash_name> \
  -p|--path <path> \
  -E|--expire <days> \
  -d|--default <true|false> \
  [-e|--env <env>]

# List configured trash directories
omni trash ls [-e|--env <env> | -a|--all]

# Purge expired items from a trash directory
omni trash clean <trash_name> [-e|--env <env>]

# Remove a trash configuration (pass -f/--force to also delete the directory on disk)
omni trash rm <trash_name> [-e|--env <env>] [-f|--force]
```

---

## SSH Management (`omni ssh`)

Manage isolated SSH directory namespaces and keys per environment.

```bash
# Create or register an SSH namespace
omni ssh set <namespace> -e|--env <env> -p|--path <path> [-d|--default]

# Activate an SSH namespace
omni ssh use <namespace> [-e|--env <env>]

# List or remove SSH namespaces
omni ssh ls [-e|--env <env> | -a|--all]
omni ssh rm <namespace> [-e|--env <env>]

# Generate or register an SSH key inside a namespace
omni ssh keys new|set <key> \
  [-e|--env <env>] \
  [-n|--namespace <ns>] \
  [-t|--type <ed25519|rsa|...>] \
  [-m|--message <comment>]

# List, inspect, activate (starts ssh-agent & runs ssh-add), or remove SSH keys
omni ssh keys ls [-e|--env <env>] [-n|--namespace <ns>] [-a|--all]
omni ssh keys get <key> [-e|--env <env>] [-n|--namespace <ns>]
omni ssh keys use <key> [-e|--env <env>] [-n|--namespace <ns>]
omni ssh keys rm <key> [-e|--env <env>] [-n|--namespace <ns>]
```

---

## Builtin Tools Reference

Enable any builtin tool via `omni tools use <tool>`:

### 1. `dot` (`.` Rapid Navigation)
- `.` (`dot`): List current directory (`ls`)
- `.,` (`dot ,`): List all files including hidden (`la`)
- `.f` / `.d`: List only files (`lf`) or only directories (`ld`)
- `..` (`dot ..`): Go up one directory and list contents
- `dot -` / `dot ...`: Pop back in directory stack (`back`) and list contents
- `dot .`: Go to `$HOME` and list contents
- `. <dir>`: Enter `<dir>` and list contents
- `. <file>`: Open `<file>` using the configured `open` handler

### 2. `comma` (`,` Hierarchical Aliases & Jumps)
- `comma add|set <alias> [-p|--path <dir>] [-c|--cmd <command>] [-e|--env <env>]` (alias: `,a`)
- `comma ls [-e|--env <env>] [-a|--all]`
- `comma rm <alias> [-e|--env <env>]` (alias: `,d`)
- `, <alias> [args...]` (`comma --`): Jump to the configured path and/or run the configured command. Supports multi-word hierarchical resolution (e.g., `, work api` resolves `work.api`).

### 3. `open` (Custom File & Directory Openers)
- `open set <ext_or_kind> -c|--command <cmd> [-e|--env <env>]` (use `/` for directories, `*` for fallback default, or file extensions like `pdf`, `md`)
- `open ls [-e|--env <env>]`
- `open rm <ext_or_kind> [-e|--env <env>]`
- `open [--] <target> [args...]`

### 4. `import` (Context Importer)
- `import <context> [of <provider>]`
- `import <attr> from <context> [in|of <provider>]` (supports wildcard `import list.* from types`)

### 5. `private` (Function-Scoped Variables)
- `private [-s|--string | -i|--int | -a|--array | -d|--dict | -f|--func] <name>[=<value>]`
- Automatically unsets the variable or function when the enclosing function returns.

### 6. `compl` (Completion Generator)
- Generates Bash programmable completion functions from `# @opt` and `# @flag` doc-comment annotations (`compl spec <func>`, `compl build <func>`, `compl set <ctx> <func>`, `compl use <ctx>`).

### 7. `help` (Contextual Help)
- `help <target> [<subcommand>]`: Displays extracted usage and option specifications for Omni modules and tools.
