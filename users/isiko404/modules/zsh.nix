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

        dig = "q";
        wtf = "wtfutil";
        cb = "cgit add -A && cgit commit -m \"Backup $(date)\" && cgit push";
        ucb = "update && cb";

        ga = "git add";
        gc = "git commit";
        gd = "git diff";
        gpl = "git pull";
        gps = "git push";
        gs = "git status";
        gl = "git log";

        cgit = "git --git-dir /home/isiko404/Github/nix.git --work-tree /etc/nixos";
        cga = "cgit add";
        cgc = "cgit commit";
        cgd = "cgit diff";
        cgpl = "cgit pull";
        cgps = "cgit push";
        cgs = "cgit status";
        cgl = "cgit log";

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
            figlet "$(whoami)@$(hostnamectl hostname)"
        fi
        
        unset SSH_AGENT_PID
        if [ "''${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
            export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
        fi
        export GPG_TTY=$(tty)
        gpg-connect-agent updatestartuptty /bye >/dev/null

        # This speeds up pasting w/ autosuggest
        # https://github.com/zsh-users/zsh-autosuggestions/issues/238
        pasteinit() {
          OLD_SELF_INSERT=''${''${(s.:.)widgets[self-insert]}[2,3]}
          zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
        }

        pastefinish() {
          zle -N self-insert $OLD_SELF_INSERT
        }
        zstyle :bracketed-paste-magic paste-init pasteinit
        zstyle :bracketed-paste-magic paste-finish pastefinish
    '';
  };
}
