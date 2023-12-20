{config, pkgs, ... }:

let 
  any = "*";

  integrated_data = {
    criteria = "eDP-1";
    diagonalLength = 13.3;
    width = 1920;
    height = 1080;
    refreshRate = 60;
  };

  home_wide_data = {
    #criteria = "GIGA-BYTE TECHNOLOGY CO., LTD. G34WQC A";
    diagonalLength = 34;
    criteria = any;
    width = 3440;
    height = 1440;
    refreshRate = 60;
  };

  home_top_data = {
    criteria = "AOC 24G2W1G5 0x00001E62";
    diagonalLength = 24;
    width = 1920;
    height = 1080;
    refreshRate = 75;
  };

  ATIS_generic_data = monitor: {
    criteria = "Philips Consumer Electronics Company PHL 241B8Q ${monitor}";
    diagonalLength = 24;
    width = 1920;
    height = 1080;
    refreshRate = 59.95;
  };
  ATIS_left_data = ATIS_generic_data "ZV02019005049";

  fachschaft_generic_data = monitor: {
    criteria = "LG Electronics 24EB23 ${monitor}";
    diagonalLength = 24;
    width = 1920;
    height = 1200;
    refreshRate = 59.95;
  };
  fachschaft_left_data = fachschaft_generic_data "609NTFAF4483";
  fachschaft_right_data = fachschaft_generic_data "305NDGL87831";

  ppi2 = data: (data.width * data.width + data.height * data.height) / data.diagonalLength * data.diagonalLength;

  dataToConfig = data: position: {
    position = position;
    criteria = data.criteria;
    #scale = 1.0 * integrated_data.height / data.height;
    scale = 1.0;
    mode = "${builtins.toString data.width}x${builtins.toString data.height}@${builtins.toString data.refreshRate}";
  };

  laptopDisplay = dataToConfig integrated_data;
  home_top = dataToConfig home_top_data;
  home_wide = dataToConfig home_wide_data;

  ATIS_left = dataToConfig ATIS_left_data;

  fachschaft_left = dataToConfig fachschaft_left_data; 
  fachschaft_right = dataToConfig fachschaft_right_data;
in
{
  services.kanshi = {
    enable = true;
    systemdTarget = "graphical-session.target";
    profiles = {
      standalone = {
        outputs = [
          (laptopDisplay "0,0")
        ];
      };
      presentation = {
        outputs = [
          (laptopDisplay "0,0")
          {
            criteria = "Sony SONY PJ 0x01010101";
            position = "1920,0";
            status = "enable";
            mode = "1920x1080@60";
          }
        ];
      };
      home_docked = {
        ## Vertical 
        #outputs = [
        #  (home_top "760,0")
        #  (home_wide "0,1080")
        #  (laptopDisplay "760,2520")
        #];

        ## Horizontal
        outputs = [
          (home_top "2680,0")
          (home_wide "1920,1080")
          (laptopDisplay "0,1900")
        ];
      };
      fachschaft = {
        outputs = [
          (laptopDisplay "960,1200")
          (fachschaft_left "0,0")
          (fachschaft_right "1920,0")
        ];
      };
      ATIS = {
        outputs = [
          (ATIS_left "0,0")
          (laptopDisplay "0,1080")
        ];
      };
    };
  };
}
