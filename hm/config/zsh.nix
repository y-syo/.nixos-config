{ config, ... }:

{
  programs.zsh = {
	enable = true;
	enableCompletion = true;
	shellAliases = {
		re = "sudo nixos-rebuild switch --impure";
		ls = "lsd";
        grep = "grep --color=auto";
		kys = "shutdown now";
		c = "gcc -Wall -Werror -Wextra";
	};
	initExtra = ''
	#Prompt
	autoload -Uz vcs_info

	zstyle ':vcs_info:git*' formats "%F{yellow}( %b)%f %F{cyan}%r%f "
	precmd() {vcs_info}
	setopt prompt_subst

	PROMPT='%F{blue} %n%f | %F{green}/%1~%f ❯ '
	RPROMPT=\$vcs_info_msg_0_
	'';
	};
}
