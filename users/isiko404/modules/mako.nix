{config, pkgs, ...}:

{
  services.mako = {
    enable = true;
    groupBy = null;
    actions = true;
    defaultTimeout = 1000 * 10;
    maxVisible = 10;

    borderSize = 2;
    borderRadius = 0;
    borderColor = "#FFFFFFFF";
    progressColor = "#2D42FFFF";
    textColor = "#FFFFFFFF";
    backgroundColor = "#DE4040FF";
    anchor = "top-right";
    font = "monospace 8";
    layer = "overlay";
    #padding = "30";

    icons = true;
    maxIconSize = 64;
  };
}
