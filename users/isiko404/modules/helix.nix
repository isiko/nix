{config, pkgs, ...}:
{
  programs.helix = {
    enable = true;
    defaultEditor = true;
    languages = {};
    settings = {
      theme = "gruvbox";
      editor = {
        line-number = "relative";
        lsp.display-messages = true;
      };
      keys.normal = {
        space.space = "file_picker";
        space.w = ":w";
        space.q = ":q";
      };
      editor.cursor-shape = {
        insert = "bar";
        normal = "block";
        select = "block";
      };
    };
    themes = {
      "37C3" = let
        transparent = "none";
        gray = "#aaaaaa";
        dark-gray = "#7a7a7a";
        white = "#ffffff";
        black = "#202020";
        red = "#de4040";
        blue = "#2d42ff";
        green = "#79ff5e";
        yellow = "#f6f675";
        orange = "#fe8019";
        magenta = "#de37ff";
        cyan = "#29ffff";
      in {
        "attributes" = yellow;
        "comment" = { fg = gray; };
        "error" = red;
        "function" = blue;
        "hint" = dark-gray;
        "info" = blue;
        "keyword" = magenta;
        "label" = magenta;
        "namespace" = blue;
        "special" = blue;
        "string" = green;
        "type" = yellow;

        "constant" = orange;
        "constant.numeric" = orange;
        "constant.character.escape" = cyan;
        "constructor" = blue;
        "debug" = dark-gray;
        "diff.plus" = green;
        "diff.delta" = yellow;
        "diff.minus" = red;
        "diagnostic" = { modifiers = [ "underlined" ]; };
        "ui.menu" = transparent;
        "ui.menu.selected" = { modifiers = [ "reversed" ]; };
        "ui.linenr" = { fg = gray; bg = transparent; };
        "ui.popup" = { modifiers = [ "reversed" ]; };
        "ui.linenr.selected" = { fg = white; bg = black; modifiers = [ "bold" ]; };
        "ui.selection" = { fg = black; bg = blue; };
        "ui.selection.primary" = { modifiers = [ "reversed" ]; };
        "ui.help" = { fg = dark-gray; bg = white; };
        "ui.cursor" = { modifiers = [ "reversed" ]; };
        "ui.cursor.match" = { fg = yellow; modifiers = [ "underlined" ]; };
        "ui.statusline" = { fg = white; bg = dark-gray; };
        "ui.statusline.inactive" = { fg = dark-gray; bg = white; };
        #"ui.gutter" = { bg = black; };
        "variable" = red;
        "variable.builtin" = orange;
        "variable.other.member" = red;
        "warning" = yellow;
      };
    };
  };
}
