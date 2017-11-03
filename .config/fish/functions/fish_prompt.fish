function fish_prompt --description 'Write out the prompt'
    set -l last_status $status

    set -l color_cwd
    set -l prefix
    set -l suffix
    switch $USER
        case root toor
            if set -q fish_color_cwd_root
                set color_cwd $fish_color_cwd_root
            else
                set color_cwd $fish_color_cwd
            end
            set suffix '#'
        case '*'
            set color_cwd $fish_color_cwd
            set suffix '$'
    end

    echo

    # PWD

    set_color $color_cwd
    echo -n (prompt_pwd)
    set_color normal

    set vcs_prompt (git rev-parse --abbrev-ref HEAD 2> /dev/null)
    if [ "$vcs_prompt" ]
	set_color brred
	printf ' %s' "$vcs_prompt"
	set_color normal
    end

    # Status-colored suffix

    if test $last_status -eq 0
	set_color brgreen
    else
        set_color bryellow
    end

    echo -n "$suffix "
    set_color normal
end
