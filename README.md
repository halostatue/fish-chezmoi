# halostatue/fish-chezmoi

[![Version][version]](https://github.com/halostatue/fish-chezmoi/releases)
[![MIT](https://img.shields.io/badge/licence-MIT-blue?style=for-the-badge "MIT")](https://github.com/halostatue/fish-chezmoi/blob/main/LICENCE.md)

A mostly unopinionated [fish shell][fish shell] plugin for [chezmoi][chezmoi].
It provides automatic completion and a function wrapper around `chezmoi` to not
force a sub-shell when calling `chezmoi cd`.

## Completions

Chezmoi completions behaviour (only run in interactive shells) can be adjusted
with the universal variable `$halostatue_fish_chezmoi_completion_mode`. This can
be set to one of the following values:

- `never`: Do nothing.
- `source`: Always source the output of `chezmoi completion fish`.
- `save`: If `chezmoi` is newer than the first `chezmoi.fish` completion file
  found in `$fish_complete_path`, save the output of `chezmoi completion fish`
  to the local `vendor_completions.d` path.
- `default` (or unset): If `chezmoi` is newer than the first `chezmoi.fish`
  completion file in `$fish_complete_path`, source the output of
  `chezmoi completion fish`.

If `chezmoi` is newer than a local `vendor_completions.d/chezmoi.fish`, the
local completion file will be removed.

> [!NOTE]
>
> The local completion path is `$XDG_DATA_HOME/fish/vendor_completions.d`, or
> `$HOME/.local/share/fish/vendor_completions.d` if `$XDG_DATA_HOME` is unset.

## `chezmoi cd-sh`, and `chezmoi cd-sub`, and `chezmoi cd`

`fish-chezmoi` wraps `chezmoi` in a function with two additional functions,
`cd-sh` and `cd-sub`.

- `cd-sh`: Uses `chezmoi source-path` to determine the location of the chezmoi
  home directory (or the parent directory of a file in the chezmoi home
  directory) and then changes the directory _in the current shell_ (`$SHLVL`
  remains the same).

- `cd-sub`: Calls `command chezmoi cd $argv` to switch to the chezmoi home
  directory in a new shell (default chezmoi behaviour, `$SHLVL` increments).

The wrapper function changes `chezmoi cd` to work like `chezmoi cd-sh` by
default, but retains default `chezmoi` behaviour if
`$halostatue_fish_chezmoi_cd` is set to `subshell`.

## Installation

Install with [Fisher][fisher]:

```fish
fisher install halostatue/fish-chezmoi@v1
```

### System Requirements

- [fish][fish] 4+
- [chezmoi][chezmoi]

[fish shell]: https://fishshell.com 'friendly interactive shell'
[fisher]: https://github.com/jorgebucaran/fisher
[fish]: https://github.com/fish-shell/fish-shell
[chezmoi]: https://www.chezmoi.io
[version]: https://img.shields.io/github/tag/halostatue/fish-chezmoi.svg?label=Version
