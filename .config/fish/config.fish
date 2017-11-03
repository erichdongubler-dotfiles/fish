function __erichdongubler_fish_init --description "Initialize @erichdongubler's common shell configuration"
	set fisherman_location "$HOME/.config/fish/functions/fisher.fish"
	if not test -e "$fisherman_location"
		echo "Fisherman not found, downloading..."
		curl -Lo "$fisherman_location" --create-dirs https://git.io/fisher
	end

	fisher
end

__erichdongubler_fish_init

set fish_greeting
