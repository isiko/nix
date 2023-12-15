let 
  user = {
    userName = "isiko404";
    homeDir = "/home/${user.userName}";
  };
  wallPapers = {
    defaultPath = "${user.homeDir}/Pictures/wallpaper";
    files = [
      "37C3-noLogo.png"
      "37C3.png"
      "unifest.png"
      "voronoi-dithered.png"
      "voronoi.png"
    ];
    index = 0;
  };
in
{
  user = user;
  wallpaperPath = "${wallPapers.defaultPath}/${builtins.elemAt wallPapers.files wallPapers.index}";
}
