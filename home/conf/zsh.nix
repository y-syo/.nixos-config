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
	  cl = "printf '\\033[2J\\033[3J\\033[1;1H'";
	  clr = "printf '\\033[2J\\033[3J\\033[1;1H'";
	  clear = "printf '\\033[2J\\033[3J\\033[1;1H'";
      re = "sudo nixos-rebuild switch";
      grep = "grep --color=auto";
      kys = "shutdown now";
      c = "gcc -Wall -Werror -Wextra";
	  val = "valgrind --leak-check=full --track-fds=all --suppressions=minishell.supp --show-leak-kinds=all --trace-children=yes ";
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
	    if [ "$DIRENV_DIR" = "-/home/yosyo/Documents/python" ]; then
		  LOGO=" "
	    elif [ "$DIRENV_DIR" = "-/home/yosyo/Documents/python-web" ]; then
		  LOGO="󰖟 "
		elif [ "$DIRENV_DIR" = "-/home/yosyo/Documents/macrolibx" ]; then
		  LOGO="🗿"
		elif [ "$DIRENV_DIR" = "-/home/yosyo/Documents/c" ]; then
		  LOGO=" "
		elif [ "$DIRENV_DIR" = "-/home/yosyo/Documents/c++" ]; then
		  LOGO=" "
		fi
	    PROMPT="%F{magenta}$LOGO%n%f | %F{red}/%1~%f ❯ "
      }
      PROMPT='%F{magenta} %n%f | %F{red}/%1~%f ❯ '
      RPROMPT=\$vcs_info_msg_0_
      '';
  };
}
