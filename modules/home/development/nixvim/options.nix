{
  programs.nixvim.opts = {
    shiftwidth = 2;
    expandtab = true;
    tabstop = 2;
    softtabstop = 2;
    number = true;
    mouse = "a"; # Enables mouse mode
    clipboard = "unnamedplus"; # Sync clipboard between OS and Neovim
    breakindent = true;
    undofile = true; # Saves undo history
    ignorecase = true; # Case insensitive searching UNLESS \C
    smartcase = true;
    signcolumn = "yes";
    splitright = true;
    splitbelow = true;
    inccommand = "split";
    cursorline = true; # Show which line your cursor is on
    scrolloff = 10; # Number of lines to keep above and below the cursor
    showmode = false; # Lualine takes care of showing the mode
  };
}
