set fish_greeting

function __check_for_fisherman --description "Initialize @erichdongubler's common shell configuration"
	set fisherman_location "$HOME/.config/fish/functions/fisher.fish"
	if not test -e "$fisherman_location"
		echo "Fisherman not found, downloading..."
		curl -Lo "$fisherman_location" --create-dirs https://git.io/fisher
		fisher
	end
end
__check_for_fisherman
