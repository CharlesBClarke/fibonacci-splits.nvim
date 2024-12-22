# fibonacci-splits.nvim
A Neovim plugin that enables Fibonacci-based window splitting, inspired by tiling window managers, for an optimized and aesthetically pleasing layout.
## Features
- Adds a new buffer or opens a file in the first window.
- Shifts existing buffers down the line.
- Splits the last window horizontally (default) or vertically.
- Simple and lightweight, with no dependencies.
## Installation

### lazy.nvim
\```lua
{
  "username/FibSplit.nvim",
  config = function()
    require("fibsplit").setup {
      -- Example configuration (optional)
      default_split_vertical = false, -- Set to true for vertical splits
    }
  end,
}
\```

### packer.nvim
\```lua
use {
  "username/FibSplit.nvim",
  config = function()
    require("fibsplit").setup {
      -- Example configuration (optional)
      default_split_vertical = false,
    }
  end,
}
\```
## Usage

### Commands

- `:FibSplit`: Adds a new buffer (or opens a file if provided) in the first window, shifts buffers down, and splits the last window horizontally.
  - Usage:
    \`:FibSplit\`
    \`:FibSplit path/to/file\`

