{
  globals.mapleader = " ";

  keymaps = [
    # Global
    # Default mode is "" which means normal-visual-op
    {
      key = "<C-n>";
      action = "<CMD>NvimTreeToggle<CR>";
      options.desc = "Toggle NvimTree";
    }
    # File
    {
      mode = "n";
      key = "<leader>ff";
      action = "<CMD>Telescope find_files<CR>";
    }
    {
      key = "<leader>fm";
      action = "<CMD>lua vim.lsp.buf.format()<CR>";
      options.desc = "Format the current buffer";
    }
    {
      # Open Yazi
      key = "<leader>e";
      action = "<CMD>Yazi<CR>";
      options.desc = "Open Yazi";
    }
  ];

}
