# nvim config

## dependencies

tbh i'm totally unsure about the version numbers, except that `neovim` needs to be recent enough to include native lsp support

- `neovim >= 0.11`
- `typescript-language-server >= 0.1`
- `cargo >= 0.7` with `rust-analyzer`
- `treesitter-cli` in some way shape or form

## gotchas

- only a few languages are configured for the lsp. add more if you want more
- there's a bug where opening a file in a subdirectory takes two key presses. idk

## commands

most of these are defaults. i'm just forgetful

- `jk` (at the same time) to escape
- `;touch` to create a new file
- `;find` to find file by name
- `;grep` to grep all files
- `gcc` to toggle comment on a line
- `gra` to get code actions
- `grr` to get references
- `grn` to rename
- `<C-]>` to jump to definition
- `<C-Space>` to manually start code completion
- `<C-N>`/`<C-P>` to go to next/previous in code completion
- `?` to show diagnostics
