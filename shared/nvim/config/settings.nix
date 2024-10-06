{
  opts = {
    # Show line numbers
    number = true;

    # Show relative line numbers
    relativenumber = true;

    # Use the system clipboard
    clipboard = "unnamedplus";

    # Show tabline always
    showtabline = 2;

    # Use spaces instead of tabs
    expandtab = true;

    # Enable smart indentation
    smartindent = true;

    # Number of spaces to use for each step of (auto)indent
    shiftwidth = 2;

    # Enable break indent
    breakindent = true;

    # Highlight the screen line of the cursor
    cursorline = true;

    # Minimum number of screen lines to keep above and below the cursor
    scrolloff = 8;

    # Enable mouse support
    mouse = "a";

    # Set folding method to manual
    foldmethod = "manual";

    # Disable folding by default
    foldenable = false;

    # Wrap long lines at a character in 'breakat'
    linebreak = true;

    # Disable spell checking
    spell = false;

    # Disable swap file creation
    swapfile = false;

    # Time in milliseconds to wait for a mapped sequence to complete
    timeoutlen = 300;

    # Enable 24-bit RGB color in the TUI
    termguicolors = true;

    # Don't show mode in the command line
    showmode = false;

    # Open new split below the current window
    splitbelow = true;

    # Keep the screen when splitting
    splitkeep = "screen";

    # Open new split to the right of the current window
    splitright = true;

    # Remove EOB
    fillchars = {
      eob = " ";
    };
  };
}