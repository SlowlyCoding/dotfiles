# user@hostname:~/Documents >
function fish_prompt
    set_color $fish_color_user
    echo -n $USER@$hostname

    set_color normal
    echo -n :

    set_color $fish_color_cwd
    echo -n (prompt_pwd)

    set_color normal
    echo -n ' > '
end
