# halostatue/fish-chezmoi

[![Version][version]](https://github.com/halostatue/fish-chezmoi/releases)

A mostly unopinionated [fish shell][fish shell] plugin for [chezmoi][chezmoi].
It provides automatic completion and a function wrapper around `chezmoi` to not
force a sub-shell when calling `chezmoi cd`.

## Completions

Chezmoi completions behaviour (which is only run in interactive shells) can be
adjusted with the universal variable `$halostatue_fish_chezmoi_completion_mode`.
This can be set to one of the following values:

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

## `chezmoi cd` and `chezmoi cdsh`

A function wrapper for `chezmoi` has been provided to permit `chezmoi cd` to
work without creating a sub-shell. To use the original functionality, use
`command chezmoi cd`.

This can be disabled by setting `$halostatue_fish_chezmoi_cd` to the value
`subshell`.

## Installation

Install with [Fisher][fisher]:

```fish
fisher install halostatue/fish-chezmoi@v1
```

### System Requirements

- [fish][fish] 3.4+

## Functions

### fish-chezmoi

```fish
$ fish-chezmoi example
example output
```

## Licence

[MIT](./LICENCE.md)

## Change Log

[CHANGELOG](./CHANGELOG.md)

## Contributing

- [Contributing](./CONTRIBUTING.md)
- [Contributors](./CONTRIBUTORS.md)
- [Code of Conduct](./CODE_OF_CONDUCT.md)

[fish shell]: https://fishshell.com 'friendly interactive shell'
[fisher]: https://github.com/jorgebucaran/fisher
[fish]: https://github.com/fish-shell/fish-shell
[chezmoi]: https://www.chezmoi.io
[version]: https://img.shields.io/github/tag/halostatue/fish-chezmoi.svg?label=Version
