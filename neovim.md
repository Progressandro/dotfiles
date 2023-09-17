# Neovim Config

## Plugins

- Neovim:
    - Remaps:
        - Insert:
            - `jj`: exit insert mode
        - Visual:
            - `J`: move current selection up
            - `K`: move current selection down
        - Normal:
            - `<leader>pv`: NetRW
            - `<C-d>`: PgDn and center cursor
            - `<C-u>`: PgUp and center cursor
            - `n`: next result and center
            - `N`: previous result and center
- Telescope
    - Remaps (`<key>`: T):
        - Normal:
            - `<leader><key>f`: find files
            - `<leader><key>g`: find files (git aware)
            - `<leader><key>s`: live grep (needs `rg`)
            - `<leader><key>B`: buffers
            - `<leader><key>b`: file browser (cwd)
            - `<leader><key>h`: help tags
