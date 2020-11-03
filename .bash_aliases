alias bt='bluetoothctl'

# alias i3c='nvim /home/archie/.config/i3/config'

alias nb='newsboat'
alias nburls='nvim /home/archie/.config/newsboat/urls'

alias nm='neomutt'

alias n='ncmpcpp'

alias q='exit'

alias r='ranger'

alias sp='sudo pacman -S'
alias u='sudo pacman -Syyu'

alias t='tmux'
alias ta='tmux attach -t'
alias tl='tmux list-sessions'

alias trc='transmission-remote-cli'

alias v='nvim'
alias vim='nvim'
alias vimrc='nvim /home/archie/.vimrc'

alias yt='youtube-dl'

alias e='emacs'

alias todo='emacs ~/Notes/Todo/todo.org'

shorten() {
	curl -s "http://tinyurl.com/api-create.php?url=${1}"
	echo
}

alias rickroll="curl -L http://bit.ly/10hA8iC | bash"
# you're welcome ∧∧

