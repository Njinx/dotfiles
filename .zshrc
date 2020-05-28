autoload -Uz compinit && compinit
autoload -Uz vcs_info

# Git info in prompt
zstyle ':vcs_info:*' enable git
zstyle '*' formats '%b'

precmd() {
	psvar=()

    vcs_info
    [[ -n vcs_info_msg_0_ ]] && print -v 'psvar[1]' -Pr -- "$vcs_info_msg_0_"
}

# Terminal prompt
PROMPT='%(!.%F{red}λ%f.%F{cyan}λ%f) %~
%F{green}%b%b%f '
RPROMPT='%F{green}%B%1v%b%f'

# Aliases
alias ll="ls -l"
alias la="ls -a"
alias lla="ls -la"
alias pause="watch -n 60 -t echo \"CTRL-C to exit\""
alias p="pause"
alias please="sudo"
alias genuis="genius"
alias urxvt-reload="xrdb $HOME/.Xresources"
alias getwinclass="xprop WM_CLASS"
alias rsync="rsync -avs --progress"
alias zsource="source $HOME/.zshrc"
alias vsource="source $HOME/.vimrc"

# Variables
EDITOR="vim"; export EDITOR;
VISUAL="vim"; export VISUAL;

GOPATH="$HOME/Go"; export GOPATH;
CSC_ROOT="$GOPATH/src/CyberScoreClient"; export CSC_ROOT;
NOTES_ROOT="$HOME/Notes"; export NOTES_ROOT;
BROWSER="firefox-developer-edition"; export BROWSER;
LD_LIBRARY_PATH="/lib"; export LD_LIBRARY_PATH;
LIBCLANG_PATH="/usr/lib64/llvm/*/lib64"; export LIBCLANG_PATH;
JAVA_HOME="/usr/lib/jvm/java-13-openjdk"

PATH="${GOPATH}/bin${PATH:+:${PATH}}"; export PATH;

# Directory hashes
hash -d packages="$HOME/Packages"
hash -d go="$HOME/Go/src"
hash -d notes="$HOME/Notes"

# Suffix aliases
alias {c,h}=code
alias {cpp,hpp}=code
alias {css,sass,scss}=code
alias html=code
alias {js,ts,cs}=code
alias {sh,bash}=vim
alias {conf,config}=vim
alias md=code
alias json=vim
alias xml=vim
alias ini=vim
