# My nvim configs

The configs and plugins I use to develop in nvim.

Feel free to use as your own.

## Configured keybindings

| Description                   | Keybinding         |
|-------------------------------|--------------------|
| Leader key                    | `SP`               |
| Alternative to ESC key        | `::`               |
| Clear search highlights       | `<leader>ch`       |
| Find files                    | `<leader>ff`       |
| Find files using grep         | `<leader>fg`       |
| Find variable definition      | `<leader>fd`       |
| Find variable implementation  | `<leader>fi`       | 
| Find variable references      | `<leader>fr`       |
| Go to next variable usage     | `<leader>gn`       |
| Go to previous variable usage | `<leader>gN`       |
| Go to variable definition     | `<leader>gd`       |
| List opened buffers           | `<leader><leader>` |
| Smart rename variable         | `<leader>rn`       |
 
## Plugins used

- [__Packer__](https://github.com/wbthomason/packer.nvim):
  Plugin and package management

- [__Lualine__](https://github.com/nvim-lualine/lualine.nvim):
  Neovim statusline

- [__Treesitter__](https://github.com/nvim-treesitter/nvim-treesitter):
  Syntax highlighting for neovim

- [__Mason__](https://github.com/williamboman/mason.nvim):
  Easily install and manage LSP servers

- [__Mason LSP Config__](https://github.com/williamboman/mason-lspconfig.nvim):
  Bridges mason.nvim with the lspconfig plugin

- [__LSP Config__](https://github.com/neovim/nvim-lspconfig):
  Configs for the Nvim LSP client

## Color schemes installed
- Gruvbox: https://github.com/ellisonleao/gruvbox.nvim
- Onedark: https://github.com/navarasu/onedark.nvim

# References

- [How to Configure Neovim to make it Amazing](
  https://www.youtube.com/watch?v=J9yqSdvAKXY)

- [Make Neovim BETTER than VSCode - LSP tutorial](
  https://www.youtube.com/watch?v=lpQMeFph1RE)

- [neovim docs](
  https://neovim.io/doc/user/options.html)
