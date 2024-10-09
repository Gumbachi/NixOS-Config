{
  plugins.telescope = {
    enable = true;
    extensions = {
      fzf-native.enable = true;
      file-browser = {
        enable = true;
        settings = {
          hijack_netrw = true;
        };
      };
    };
    settings = {
      defaults = {
      file_ignore_patterns = [
        "^.git/"
        "^.mypy_cache/"
        "^__pycache__/"
        "^output/"
        "^data/"
        "%.ipynb"
      ];
      layout_config = {
        prompt_position = "top";
      }; 
    set_env = {
      COLORTERM = "truecolor";
    };
    sorting_strategy = "ascending";
  };
    };
  };
}
