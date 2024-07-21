{ config, ... }:

{
	programs.tofi = {
		enable = true;
		settings = ''

width = 100%
height = 100%

prompt-text = "> "

text-color = #b8b5b1
selection-color = #de3c3c
input-color = #ede0d1

border-width = 0
outline-width = 0
padding-left = 40%
padding-top = 20%

result-spacing = 15

num-results = 10
font = JetBrainsMono Nerd Font
background-color = #050505cf

terminal = kitty

		''
	};
}
