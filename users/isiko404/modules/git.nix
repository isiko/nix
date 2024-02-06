{config, pkgs, ... }:

{
  programs.git = {
      enable = true;
      package = pkgs.gitAndTools.gitFull;

      userName = "isiko";
      userEmail = "mail@isiko404.dev";

      delta = {
        enable = true;
        options = {
          plus-style = "syntax #012800";
          minus-style = "syntax #340001";
          theme = "Monokai Extended";
          navigate = true;
        };
      };

      aliases = {
          gs = "status";
          gaa = "add . ";
      };

      signing = {
          key = "key::ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCkoCbuexrrqh4o563F8dbKut6ZiIo1HL7/fTmoizhkCUI5K7YlCJZV8D9vsjhzgJh4aWT2V7vnTbJXXw6CObLhXU5+WmP41i/qavTKRlsg9b55lH96AezkJVSsKQ3o9+FRGqa7+EjGOIIZU56bdcVttAFA9rNOWQiJhyb3k5p4+PkFh5UIhSXhLl9wSMmbBRNlT4wcM2tz3pROKvJdGR49cgqnHfn/pZxWQziNG4RaWXjNImx5zp+TcJGPO2BH545Ki1sZh+sx1E2YAjyyQ/tJTP2rOdH2tp0KUi+TIJEuFypS0xPw/rSOhCsMdAfeAgaHbI7wnrg8k2TxwmX99uer cardno:23_654_190";
          signByDefault = true;
      };

      extraConfig = {
          gpg.format = "ssh";
          core.editor = "nvim";
          init.defaultBranch = "main";

          # Use abbrev SHAs whenever possible/relevant instead of full 40-character SHAs
          log.abbrevCommit = true;

          push.followTags = true;
          push.autoSetupRemote = true;

          tag.sort = "version:refname";

          pull.rebase = true;

          status.branch = true;
          status.showStash = true;

          rebase.autoStash = true;
      };
  };
}
