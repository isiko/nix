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
          key = "key::ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCU2ZHQBOK804tkILdm5pCki8JiGwSWzAyEQYN+zxPUJCJU8Hc4JfpPibTuaZZGkISFJp+H+oa31c9sE/cZRh6IgyfhglqKZnAxgsNDXJvM/MeuUdn4bbDpoZWtxTa0zKvhz6IKG4Qpc9iWXgPzBUABQlsv/BAxr24Ctqa/jswc9miYw0VplWuW1oGxNVi2jweP05oORXg/pkxNChMgGy6Vfo+scDQ4CjAWeF8xGI6GoDgWDywOx3nJqqdLcMUuILPo80HrUqqFNdobRTx5zV7rZLI3kfCpGEVNNidUELl/UGke/2CFcvqd+0V+tOfp9ZcIMAsUr3H0ci9Nkbd+nArIRYOKzE3JmbhTZ/Wf0BKll8YgNsyIbFcZZBSnvq6TTDpVygKtv1YAm9XXo1H6Hjusetcaaqcfnt+irqNOXg5D6vlwiISgPAFWZhjsiV2dDcL/dFd05kcCpEHOkaFeoL1a7JoDqthcahFLFXbS8NV3OshC7L5RZzPUre2DB0g/jzs= isi_ko404@Github (isihd.ko@gmail.com)";
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
