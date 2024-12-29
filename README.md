# fibonacci-splits.nvim

A Neovim plugin that enables Fibonacci-based window splitting, inspired by tiling window managers, for an optimized and aesthetically pleasing layout.

## Features

- Adds the command `:FibSplit`, which opens windows in a manner similar to the [Fibonacci layout in dwm](https://dwm.suckless.org/patches/fibonacci/).
- Adds the command `:FibPop`, which moves the buffer with the cursor to the front, shifting everything else down.

## Installation

### Using `lazy.nvim`

```lua
{
  "username/FibSplit.nvim",
  config = function()
    require("fibsplit").setup {
      -- Example configuration (optional)
      default_split_vertical = false, -- Set to true for vertical splits
    }
  end,
}
```

### Using `packer.nvim`

```lua
use {
  "username/FibSplit.nvim",
  config = function()
    require("fibsplit").setup {
      -- Example configuration (optional)
      default_split_vertical = false, -- Set to true for vertical splits
    }
  end,
}
```

## Usage

### Commands

- `:FibSplit`: Adds a new buffer (or opens a file if provided) in the first window, shifts buffers down, and splits the last window horizontally.
  - Usage:
    - `:FibSplit`
    - `:FibSplit path/to/file`
    - `:FibPop`: Moves the current buffer to the front and shifts other buffers down.
