{ config, pkgs, ...}:

{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableVteIntegration = true;
    autocd = true;
    shellAliases = {
        ll = "ls -l";
        update = "sudo nixos-rebuild switch";
        pdf = "zathura";
        vi = "nvim";
        vim = "neovide";

        htop = "btop";
        dig = "q";
        wtf = "wtfutil";
        cgit = "git --git-dir /home/isiko404/Github/nix.git --work-tree /etc/nixos";
        cb = "cgit add -A && cgit commit -m \"Backup $(date)\" && cgit push";
        ucb = "update && cb";

        wlp = "wl-present";
    };
    history = {
        ignoreDups = true;
        ignoreSpace = true;
        size = 10000;
        path = "${config.xdg.dataHome}/zsh/history";
    };
    historySubstringSearch = {
      enable = true;
    };
    syntaxHighlighting = {
        enable = true;
        highlighters = [
            "main"
            "brackets"
            "cursor"
            "root"
            "line"
        ];
    };
    oh-my-zsh = {
        enable = true;
        plugins = [ "git" "fzf" ];
        theme = "agnoster";
    };
    initExtra = ''
        #FZF
        export FZF_COMPLETION_TRIGGER=""
        setopt vi # Reset <TAB> binding

        fzf-and-run-widget() {
            fzf-completion
            zle accept-line
        }
        zle -N         fzf-and-run-widget
        bindkey '^[^I' fzf-and-run-widget

        add_sudo (){
          prefix="sudo"
          BUFFER="$prefix $BUFFER"
          CURSOR=$(($CURSOR + $#prefix + 1))
        }
        zle -N add_sudo
        bindkey "^f" add_sudo

        if command -v figlet &> /dev/null
        then
            figlet "$(whoami) - $(hostnamectl hostname)"
        fi
        
        unset SSH_AGENT_PID
        if [ "''${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
            export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
        fi
        export GPG_TTY=$(tty)
        gpg-connect-agent updatestartuptty /bye >/dev/null
    '';
  };
}
