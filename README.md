# nvim config

## dependencies

tbh i'm totally unsure about the version numbers, except that `neovim` needs to be recent enough to include native lsp support

- `neovim >= 0.11`
- `typescript-language-server >= 0.1`
- `cargo >= 0.7` with `rust-analyzer`

## gotchas

- packer bootstraps itself, so on first boot, it'll probably pump a bunch of error messages. the only way out is through
- only a few languages are configured for the lsp. add more if you want more

## commands

most of these are defaults. i'm just forgetful

- `<leader>` is set to space
- `gcc` to toggle comment on a line
- `<leader>touch` to create a new file
- `gra` to get code actions
- `grr` to get references
- `grn` to rename
- `<C_]>` to jump to definition
- `<C_X><C_O>` to start code completion
- `<C_N>`/`<C_P>` to go to next/previous in code completion
- `<C_Y>` to accept autocomplete
- `<leader>pf` to find file by name
- `<leader>ps` to grep all files
