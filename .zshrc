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
%F{green}%f '
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
alias sidequest="/home/ben-allen/Packages/SideQuest-*/sidequest"
alias pubip="curl http://ipecho.net/plain ; echo"
alias clip="xclip -selection c"
alias sysinfo="inxi -Fxxx"
alias firefox="firefox-developer-edition"
alias yt2mp3="youtube-dl --extract-audio --audio-format mp3"
alias thewisecrab="rustc --explain "
alias http-server="$HOME/node_modules/http-server/bin/http-server -c-1"
alias fuckingupdate="pacman -Syyu --overwrite \"*\""
alias define="zdict -dt wiktionary"
alias mntjohnchung="sudo sshfs -o allow_other,uid=33,gid=33,umask=660 -F /home/ben-allen/.ssh/config Karate:/var/www/johnchung.com /mnt/johnchung"
alias reoob="reboot"
# Functions
function mkcd {
	mkdir -p "$1"
	cd "$1"
}
function pname {
	cat "/proc/$1/status" | grep "Name:" | cut -f2-
}
function say {
	mpg123 "http://translate.google.com/translate_tts?tl=en-US&client=tw-ob&q=$(echo -n "$1" | urlencode)" 2>/dev/null
}
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
JAVA_HOME="/usr/lib/jvm/java-11-openjdk"; export JAVA_HOME;
RUSTPATH="$HOME/Rust"
CARGO_HOME="$HOME/.cargo"
#PATH="${GOPATH}/bin:${CARGO_HOME}/bin${PATH:+:${PATH}}"; export PATH;
PATH="${PATH}:${GOPATH}/bin:${CARGO_HOME}/bin"; export PATH;
# Directory hashes
hash -d packages="$HOME/Packages"
hash -d go="$HOME/Go/src"
hash -d notes="$HOME/Notes"
hash -d mt="$HOME/Documents/Mantech/chatapplicationsproject"
hash -d cs="$HOME/C291"
hash -d htb="$HOME/HackTheBox"
hash -d latex="$HOME/LaTeX"
# Suffix aliases
alias -s {c,h}=code
alias -s {cpp,hpp}=code
alias -s {css,sass,scss}=code
alias -s html=code
alias -s {js,ts,cs}=code
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
	tmpdir="$(mktemp -p "$CPATH" -d "tmpc_${name}_XXXX")"
	cd "$tmpdir"
	echo -n "#include \"stdio.h\"\n\nint main() {\n\n\treturn 0;\n}" > main.c
	echo -n "IN=main.c\nOUT=main\n\nSTD=c99\nCC=gcc\n\nLFLAGS=\nCFLAGS=-o \$(OUT) -std=\$(STD) \$(LFLAGS) -Wall -g\n\ndefault:\n\t\$(CC) \$(CFLAGS) \$(IN)" > Makefile
	main.c
	code Makefile
}
fshare() {
	tmpdir="$(mktemp -p "/tmp" -d "tmpc_XXXX")"
	cp "$1" "$tmpdir"
	ngrok http "file://${tmpdir}"
	
	rm -rf "$tmpdir"
}
# Misc functions
tabs 4
mksh() {
	fname="$1"
	if [[ -f "$fname" ]]; then
		echo "File \"$fname\" already exists"
	else
		echo -n "#!/bin/sh\n\n\n" > "$fname"
		$EDITOR "$fname"
	fi
}
mkbash() {
	fname="$1"
	if [[ -f "$fname" ]]; then
		echo "File \"$fname\" already exists"
	else
		echo -n "#!/bin/bash\n\n\n" > "$fname"
		$EDITOR "$fname"
	fi
}
mkpy() {
	if [[ -z "$1" ]]; then
		v="3"
	else
		v="$1"
	fi
	fname="${2}.py"
	if [[ -f "$fname" ]]; then
		echo "File \"$fname\" already exists"
	else
		echo "#!/usr/bin/env python${v}
def main():
\tpass
if __name__ == \"__main__\":
\tmain()" > "$fname"
	fi
}


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
