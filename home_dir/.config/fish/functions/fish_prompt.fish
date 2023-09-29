function fish_prompt
    set_color 91B362 # green
    echo -n $USER@$(prompt_hostname)

    set_color normal
    echo -n :

    # only show current directory
    set_color 53BDFA # blue
    echo -n (path basename $(prompt_pwd))

    set_color F9AF4F # yellow
    echo -n (fish_git_prompt)

    set_color normal
    echo -n ' → '
end
