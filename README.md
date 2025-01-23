# halostatue/fish-plugin-template

> [!INFORMATION]
>
> Run `just init OWNER REPO *NAME` to make this your own. It will make changes
> that prepare your plug-in repository. This does _not_ commit the changes or
> make all changes for you.

> This repository is a template for creating [fisher][fisher]-compatible plugins
> for the Fish shell.
>
> From [creating a plugin][creating a plugin]:
>
>> A plugin can be any number of files in a `functions`, `conf.d`, and
>> `completions` directory. Most plugins consist of a single function, or
>> configuration [snippet][snippet]. This is what a typical plugin looks like.
>>
>> ```
>> flipper
>> ├── completions
>> │   └── flipper.fish
>> ├── conf.d
>> │   └── flipper.fish
>> └── functions
>>     └── flipper.fish
>> ```
>
> When using this repository, remember to remove the `.keep` files, as their
> presence will cause installation failures.

A short description of this module for [fish shell][fish shell].

## Installation

Install with [Fisher][fisher]:

```fish
fisher install OWNER/REPONAME@v1
```

### System Requirements

- [fish][fish] 3.0+

## Functions

> A description of the functions added by this plugin.

### flipper

> A description of the function `flipper`.

```fish
$ flipper example
example output
```

## Licence

> The licence for the plug-in. I habitually choose MIT for my Fish plugins.

[MIT](LICENCE.md)

[fish shell]: https://fishshell.com 'friendly interactive shell'
[fisher]: https://github.com/jorgebucaran/fisher
[fish]: https://github.com/fish-shell/fish-shell
[creating a plugin]: https://github.com/jorgebucaran/fisher#creating-a-plugin
[snippet]: https://fishshell.com/docs/current/index.html#configuration-files
[events]: https://fishshell.com/docs/current/cmds/emit.html
