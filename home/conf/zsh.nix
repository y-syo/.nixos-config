{ config, ... }:

{
  programs.zsh = {
    enable = true;
    autocd = true;
    enableCompletion = true;
    shellAliases = {
      v = "nvim";
      vi = "nvim";
      vim = "nvim";
      l = "ls -lA --color=auto";
      ls = "ls -A --color=auto";
      re = "sudo nixos-rebuild switch";
      grep = "grep --color=auto";
      kys = "shutdown now";
      c = "gcc -Wall -Werror -Wextra";
    };
    initExtra = ''
      autoload -Uz compinit
      compinit
      zstyle ':completion:*' matcher-list "" 'm:{a-zA-Z}={A-Za-z}'

      export DIRENV_LOG_FORMAT=
      eval "$(direnv hook zsh)"

      #Prompt
      autoload -Uz vcs_info

      zstyle ':vcs_info:git*' formats "%F{yellow}( %b)%f %F{blue}%r%f "
      setopt prompt_subst
	  precmd() {
	    vcs_info
	    LOGO="󱄅 "
	    if [ "$DIRENV_DIR" = "-/home/yosyo/Documents/Python" ]; then
		  LOGO=" "
	    elif [ "$DIRENV_DIR" = "-/home/yosyo/Documents/MacroLibX" ]; then
		  LOGO="🗿 "
		fi
	    PROMPT="%F{magenta}$LOGO%n%f | %F{red}/%1~%f ❯ "
      }
      PROMPT='%F{magenta} %n%f | %F{red}/%1~%f ❯ '
      RPROMPT=\$vcs_info_msg_0_
      '';
  };
}
