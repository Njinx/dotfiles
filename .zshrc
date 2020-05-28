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
alias sidequest="/home/ben-allen/Packages/SideQuest-0.10.2/sidequest"

# Variables
EDITOR="vim"; export EDITOR;
VISUAL="vim"; export VISUAL;

GOPATH="$HOME/Go"; export GOPATH;
CPATH="$HOME/C"; export CPATH;
CSC_ROOT="$GOPATH/src/CyberScoreClient"; export CSC_ROOT;
NOTES_ROOT="$HOME/Notes"; export NOTES_ROOT;
BROWSER="firefox-developer-edition"; export BROWSER;
LD_LIBRARY_PATH="/lib"; export LD_LIBRARY_PATH;
LIBCLANG_PATH="/usr/lib64/llvm/*/lib64"; export LIBCLANG_PATH;
JAVA_HOME="/usr/lib/jvm/java-13-openjdk"; export JAVA_HOME;

PATH="${GOPATH}/bin${PATH:+:${PATH}}"; export PATH;

# Directory hashes
hash -d packages="$HOME/Packages"
hash -d go="$HOME/Go/src"
hash -d notes="$HOME/Notes"

# Suffix aliases
alias -s {c,h}=code
alias -s {cpp,hpp}=code
alias -s {css,sass,scss}=code
alias -s html=code
alias -s {js,ts,cs}=code
alias -s {sh,bash}=vim
alias -s {conf,config}=vim
alias -s md=code
alias -s json=vim
alias -s xml=vim
alias -s ini=vim
alias -s go=code

# Temp environments

tmpgo() {
	name=$1

	tmpdir="$(mktemp -p "$GOPATH/src" -d "tmpgo_${name}_XXXX")"
	cd "$tmpdir"

	echo -n "package main\n\nimport (\n\n)\n\nfunc main() {\n\n}" > main.go

	main.go
}

tmpc() {
	name=$1

	tmpdir="$(mktemp -p "$CPATH" -d "tmpgo_${name}_XXXX")"
	cd "$tmpdir"

	echo -n "#include \"stdio.h\"\n\nint main() {\n\n\treturn 0;\n}" > main.c
	echo -n "IN=main.c\nOUT=main\n\nSTD=c99\nCC=gcc\n\nLFLAGS=\nCFLAGS=-o \$(OUT) -std=\$(STD) \$(LFLAGS) -Wall -g\n\ndefault:\n\t\$(CC) \$(CFLAGS) \$(IN)" > Makefile

	main.c
	code Makefile
}
