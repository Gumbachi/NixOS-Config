{ ... }: {
  programs.nixvim = {
    enable = true;

    colorschemes.catppuccin.enable = true;

    plugins = {
      treesitter.enable = true;
      lsp.enable = true;
      lsp-format.enable = true;
      lsp-status.enable = true;

      telescope = {
        enable = true;
        extensions.fzf-native.enable = true;
      };

      yazi.enable = true;
      nix.enable = true;
      which-key.enable = true;
      direnv.enable = true;

      web-devicons.enable = true;
      rainbow-delimiters.enable = true;
      virt-column.enable = true;
      cursorline.enable = true;
      indent-o-matic.enable = true;
      lualine.enable = true;
      neoscroll.enable = true;
  
      coq-nvim = {
        enable = true;
        settings.auto_start = true;
      };
    };

    opts = {
      
    };

    
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
  };
}
  
