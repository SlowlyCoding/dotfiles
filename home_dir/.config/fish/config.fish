if status is-interactive
  set -U fish_greeting # disable greeting
  set fish_color_valid_path # disable underline for path

  alias cat "bat"
  alias ls "lsd"
  alias tree "lsd --tree"
end
