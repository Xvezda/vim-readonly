# readonly.vim
Automatically set readonly option on specific files.

This plugin is useful when if you are person like me,
who likes to look around internal or package manager managed (i.e. pip, npm, etc.)
source codes with vim.

It protects original source code from modifying accidentally by user.


## Installation

Using vim-plug:
```vim
Plug 'Xvezda/vim-readonly'
```

or

```sh
make install
```

## Usage

`g:readonly_automatic` is enabled by default.

Use `:Readonly` to manually enable readonly option, and `:Readonly!` to disable.


## Global options

| Flag                          | Description                                                               | Default                                                       |
| ----------------------        | --------------------------------------------------                        | -------                                                       |
| `g:readonly_automatic`        | Automatically set readonly when patterns are match                        | `1`                                                           |
| `g:readonly_paths`            | Set patterns of path to set readonly option                               | `['/usr/bin/lib/', '/usr/local/lib/', '/usr/local/include/']` |
| `g:readonly_nodejs`           | Add NodeJs package path to readonly paths                                 | `1`                                                           |
| `g:readonly_python`           | Add python package path to readonly paths                                 | `1`                                                           |
| `g:readonly_check_virtualenv` | Add python virtualenv path to readonly paths when virtualenv is activated | `1`                                                           |


## License

[MIT License](LICENSE)
