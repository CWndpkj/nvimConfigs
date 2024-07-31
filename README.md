# AstroNvimV4 Config

<!--toc:start-->
- [AstroNvimV4 Config](#astronvimv4-config)
  - [Support neovim version](#support-neovim-version)
  - [Features](#features)
  - [workflow screenshot](#workflow-screenshot)
  - [other components config](#other-components-config)
  - [🛠️ Installation](#🛠️-installation)
    - [The system should supports commands](#the-system-should-supports-commands)
    - [Recommend install](#recommend-install)
    - [Note: for rust development](#note-for-rust-development)
    - [Make a backup of your current nvim and shared folder](#make-a-backup-of-your-current-nvim-and-shared-folder)
    - [Create a new user repository from this template](#create-a-new-user-repository-from-this-template)
    - [Clone the repository](#clone-the-repository)
    - [Start Neovim](#start-neovim)
  - [Tips](#tips)
    - [NVcheatsheet](#nvcheatsheet)
    - [Use Lazygit](#use-lazygit)
    - [Install unimatrix](#install-unimatrix)
    - [Install TTE](#install-tte)
    - [Neovim requirements](#neovim-requirements)
    - [Markdown Image Paste](#markdown-image-paste)
    - [Input Auto Switch](#input-auto-switch)
    - [Support styled-components](#support-styled-components)
    - [Support for neovide](#support-for-neovide)
    - [Support Lazydocker](#support-lazydocker)
  - [General Mappings](#general-mappings)
  - [NOTE](#note)
    - [_vim.lsp.buf.hover()_ `KK` jump into signature help float window](#vimlspbufhover-kk-jump-into-signature-help-float-window)
  - [Project workspace setup](#project-workspace-setup)
<!--toc:end-->

**NOTE:** This is the latest v4 configuration.

In the course of my daily tasks, I have optimized my workflow by integrating several powerful tools. My terminal of choice is `WezTerm`, which offers a blend of performance and features that cater to my needs. Alongside this, I employ `tmux` to efficiently manage multiple terminal sessions within a single window.

Additionally, I utilize `yazi` as my terminal-based file manager, which seamlessly fits into my terminal-centric workflow. It is also worth noting that my configuration is compatible with `neovide`, eliminating the necessity for additional setups.

This streamlined combination of tools significantly enhances my productivity and provides a robust terminal experience.

## Support neovim version

neovim >= `0.10`, recommend `0.10.0`

## Features

now,this config supports development in `TypeScript`,`Python`,`Go`,`Rust` and `markdown`.

- **_`Typescript`_**: `vtsls` work with `volar2`
- **_`Python`_**: `basedpyright`
- **_`Go`_**: `gopher.nvim` _-- support go zero framework_
- **_`Markdown`_**: `iamcco/markdown-preview.nvim`,
- **_`Rust`_**: `mrcjkb/rustaceanvim`

## workflow screenshot

`wezterm` + `tmux` + `astronvim`

![homepage](assets/imgs/homepage.png)

`wezterm`

![wezterm](assets/imgs/wezterm.png)

`tmux`

![tmux](assets/imgs/tmux.png)

`yazi`

![yazi](assets/imgs/yazi.png)

## other components config

`wezterm`: [https://github.com/chaozwn/wezterm]('https://github.com/chaozwn/wezterm')

`tmux`: [https://github.com/chaozwn/tmux]("https://github.com/chaozwn/tmux")

`yazi`: [https://github.com/chaozwn/yazi]("https://github.com/chaozwn/yazi")

## 🛠️ Installation

### The system should supports commands

`npm`,`rustc`,`go`,`tmux` -- if you want to use `tmux-awesome-manager`

### Recommend install

```shell
brew install fzf
brew install fd
brew install luarocks
brew install lazygit
brew install ripgrep
npm install -g tree-sitter-cli
brew install gdu
brew install bottom
brew install protobuf
brew install trash
brew install gnu-sed

pip install notebook nbclassic jupyter-console
pip install git+https://github.com/will8211/unimatrix.git
npm install -g neovim
pip install pynvim
pip install terminaltexteffects

brew tap daipeihust/tap
brew install im-select

brew install neovide
brew install lazydocker
```

### Note: for rust development

> rustup and mason's installation of rust-analzyer are different and may cause some [bugs](https://github.com/rust-lang/rust-analyzer/issues/17289), manual installation is recommended. 

```
rustup component add rust-analyzer
```

### Make a backup of your current nvim and shared folder

```shell
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

### Create a new user repository from this template

Press the "Use this template" button above to create a new repository to store your user configuration.

You can also just clone this repository directly if you do not want to track your user configuration in GitHub.

### Clone the repository

```shell
git clone https://github.com/chaozwn/astronvim_with_coc_or_mason ~/.config/nvim
```

### Start Neovim

```shell
nvim
```

## Tips

### NVcheatsheet

`<F2>`

![nvcheatsheet](assets/imgs/nvcheatsheet.png)

### Use Lazygit

`<leader>tl`

![lazygit](assets/imgs/lazygit.png)

### Install unimatrix

`<Leader>tm`

```shell
pip install git+https://github.com/will8211/unimatrix.git
```

![unimatrix](assets/imgs/unimatrix.png)

### Install TTE

`<Leader>te`

```shell
pip install terminaltexteffects
```

![](./assets/imgs/tte.png)

### Neovim requirements

```
npm install -g neovim
pip install pynvim
```

### Markdown Image Paste

```shell
pip install pillow
```

### Input Auto Switch

```shell
brew tap daipeihust/tap
brew install im-select
im-select
```

run `im-select` & copy result to `im-select.lua`

```lua
return {
  "chaozwn/im-select.nvim",
  lazy = false,
  opts = {
    default_main_select = "com.sogou.inputmethod.sogou.pinyin", -- update your input method
    set_previous_events = { "InsertEnter", "FocusLost" },
  },
}
```

### Support styled-components

```shell
npm i -g @styled/typescript-styled-plugin typescript-styled-plugin
```

### Support for neovide

```
brew install neovide
neovide .
```

### Support Lazydocker

tigger command: `<leader>td`

```shell
brew install lazydocker
```

## General Mappings

| Action                      | Mappings            | Mode |
| --------------------------- | ------------------- |------|
| Leader key                  | `Space`               |   n  |
| Resize up                   | `Ctrl + Up`           |  n  |
| Resize Down                 | `Ctrl + Down`         |  n  |
| Resize Left                 | `Ctrl + Left`         |  n  |
| Resize Right                | `Ctrl + Right`        |  n  |
| Up Window                   | `Ctrl + k`            |  n  |
| Down Window                 | `Ctrl + j`             |  n  |
| Left Window                 | `Ctrl + h`          |  n  |
| Right Window                | `Ctrl + l`          |  n  |
| Force Write                 | `Ctrl + s`          |  n  |
| Force Quit                  | `Ctrl + q`          |  n  |
| New File                    | `Leader + n`        |  n  |
| Close Buffer                | `Leader + c`        |  n  |
| Next Tab (real vim tab)     | `]t`                |  n  |
| Previous Tab (real vim tab) | `[t`                |  n  |
| Comment                     | `Control + /`        |  n  |
| Horizontal Split            | `\`                 |  n  |
| Vertical Split              | <code>&#124;</code> |  n  |
| Open task menu              | `<Leader>c`          |  n  |

Copilot Mappings

| Action                      | Mappings            | Mode |
|-----------------------------|---------------------|------|
| Open chat panel             |  `<Leader>nc`       |  n     |
| Accept inline suggestion    | `<C-.>`             |    n   |


For more mappings,see which key prompt or mappings config files


## NOTE

### _vim.lsp.buf.hover()_ `KK` jump into signature help float window

> Displays hover information about the symbol under the cursor in a floating window. Calling the function twice will jump into the floating window.

## Project workspace setup
Use`<Leader>c` to open project task menu,and it'll determine the type of current workspace by typical files like node_modules/ for frontend,CMakeLists.txt for c/cpp Cargo.toml for Rust.
For cmake base c/cpp project,we use 'cmake-tools' to run cmake tasks.
For other type of project,we use 'overseer' to run tasks,including c/cpp project base on makefile,Rust project ,Python project,Frontend project,etc

