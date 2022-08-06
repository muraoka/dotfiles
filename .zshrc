PROMPT='%c $ '

export GOPATH=$HOME
export PATH="$GOPATH/bin:$PATH"
export PATH="$PATH:/opt/homebrew/bin"

eval "$(rbenv init - zsh)"

bindkey '^j' peco-src
function peco-src () {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src
