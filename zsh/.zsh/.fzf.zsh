if [[ ! "$PATH" == */opt/homebrew/fzf/bin/* ]]; then
  PATH="${PATH:+${PATH}:}/opt/homebrew/fzf/bin"
fi

source <(fzf --zsh)
