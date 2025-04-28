{ config, lib, ... }:

with lib;

let
  cfg = config.editor;
in
{
 
  options.editor = {
    nvf = {
      enable = mkEnableOption "Enable nvim/nvf.";
      setDefault = mkEnableOption "Set the EDITOR environment variable to nvim";
      languages = mkOption {
        type = types.attrs;
        description = "The whole block for programs.nvf.settings.vim.languages";
        example = "{ python.enable = true; }";
        default = {  
          nix = {
            enable = true;
            lsp.server = "nixd";
          };
        };
      };
    };
  };

  config = mkMerge [

    # Default Settings
    (mkIf cfg.nvf.enable {

      environment.sessionVariables.EDITOR = mkIf cfg.nvf.setDefault "nvim";

      programs.nvf.enable = true;

      programs.nvf.settings.vim.options = {
        tabstop = 2;
        shiftwidth = 2;
        expandtab = true;
        wrap = false;
      };

      # Managed By Stylix
      # programs.nvf.settings.vim.theme = {
      #   enable = true;
      #   name = "catppuccin";
      #   style = "mocha";
      # };

      # Vim Settings
      programs.nvf.settings.vim = {
        useSystemClipboard = true;

        # Plugins
        statusline.lualine.enable = true;
        binds.whichKey.enable = true;
        ui.colorizer.enable = true;
        visuals.rainbow-delimiters.enable = true;
        dashboard.dashboard-nvim.enable = true;
        telescope.enable = true;
        treesitter.enable = true;

        autocomplete.nvim-cmp = {
          enable = true;
          mappings = {
            confirm = "<Tab>";
            next = "<Down>";
            previous = "<Up>";
          };
        };

        mini = {
          indentscope.enable = true;
          pairs.enable = true;
          comment.enable = true;
          surround.enable = true;
        };

        terminal.toggleterm = {
          enable = true;
          mappings.open = "<leader>t";
          setupOpts = {
            direction = "float";
            border = "curved";
          };
        };

        utility.yazi-nvim = {
          enable = true;
          mappings.openYazi = "<leader> ";
          # setupOpts.open_for_directories = true;
        };

        utility.preview.markdownPreview = {
          enable = true;
          autoStart = true;
        };

        projects.project-nvim = {
          enable = true;
          setupOpts = {
            show_hidden = true;
            manual_mode = false;
            patterns = [ ".git" "Makefile" "package.json" "flake.nix" "cargo.toml" ];
          };
        };
      };

      programs.nvf.settings.vim.lsp = {
        enable = true;
        inlayHints.enable = true;
        lspSignature.enable = true;
      };

      # Languages
      programs.nvf.settings.vim.languages = mkMerge [
        {
          # Language Defaults
          enableTreesitter = false;
          enableLSP = true;
          enableFormat = true;
        }
        cfg.nvf.languages
      ];

      programs.nvf.settings.vim.keymaps = [
        {
          key = "<leader>f";
          mode = "n";
          silent = true;
          action = ":Telescope find_files find_command=rg,--ignore,--hidden,--files<CR>";
        }
      ];

      programs.nvf.settings.vim.autocmds = [
        {
          desc = "4 Spacers";
          command = "setlocal shiftwidth=4 | setlocal tabstop=4";
          event = ["BufEnter"];
          pattern = [
            "*.py"
            "*.sass"
            "*.scss"
            "*.css"
          ];
        }
      ];



    }) 
  ];

}
