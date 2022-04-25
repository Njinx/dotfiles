autoload -Uz compinit && compinit
autoload -Uz vcs_info
autoload -Uz add-zsh-hook
autoload -Uz chpwd_recent_dirs
autoload -Uz cdr

# Git info in prompt
zstyle ':vcs_info:*' enable git
zstyle '*' formats '%b'

precmd() {
	psvar=()
    vcs_info
    [[ -n vcs_info_msg_0_ ]] && print -v 'psvar[1]' -Pr -- "$vcs_info_msg_0_"

    # Print the previously configured title
    print -Pnr -- "$TERM_TITLE"

    # Print a new line before the prompt, but only if it is not the first line
    if [ "$NEWLINE_BEFORE_PROMPT" = yes ]; then
        if [ -z "$_NEW_LINE_BEFORE_PROMPT" ]; then
            _NEW_LINE_BEFORE_PROMPT=1
        else
            print ""
        fi
    fi
}

# Terminal prompt
PROMPT='%(!.%F{red}λ%f.%F{cyan}λ%f) %~
%F{green}%f '
RPROMPT='%F{green}%B%1v%b%f'

source "$HOME/.profile"
source "$HOME/.zsh_aliases"
source "$HOME/.zsh/copython"

# Functions
function dg {
	if [[ -z $1 ]]; then
		echo "4head"
		return
	fi
	if [[ ! -f "/home/ben-allen/.cache/zsh/dirs" ]]; then
		mkdir -p "/home/ben-allen/.cache/zsh/"
		touch "/home/ben-allen/.cache/zsh/dirs"
	fi
		cd -$1
}

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

# Directory hashes
hash -d packages="$HOME/Packages"
hash -d go="$HOME/Go/src"
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

tabs 4

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

WORDCHARS=${WORDCHARS//\/} # Don't consider certain characters part of the word

# Hide EOL sign ('%')
#PROMPT_EOL_MARK=""

# Enable completion features
compinit -d ~/.cache/zcompdump
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' rehash false
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
zstyle ':completion:*:*:cdr:*:*' menu selection

# History configurations
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=2000
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it

# Configure `time` format
TIMEFMT=$'\nreal\t%E\nuser\t%U\nsys\t%S\ncpu\t%P'

# Make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt

if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
else
    color_prompt=
fi

    # Enable syntax-highlighting
    if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
        . /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
        ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
        ZSH_HIGHLIGHT_STYLES[default]=none
        ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=red,bold
        ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=cyan,bold
        ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=green,underline
        ZSH_HIGHLIGHT_STYLES[global-alias]=fg=magenta
        ZSH_HIGHLIGHT_STYLES[precommand]=fg=green,underline
        ZSH_HIGHLIGHT_STYLES[commandseparator]=fg=blue,bold
        ZSH_HIGHLIGHT_STYLES[autodirectory]=fg=green,underline
        ZSH_HIGHLIGHT_STYLES[path]=underline
        ZSH_HIGHLIGHT_STYLES[path_pathseparator]=
        ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]=
        ZSH_HIGHLIGHT_STYLES[globbing]=fg=blue,bold
        ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=blue,bold
        ZSH_HIGHLIGHT_STYLES[command-substitution]=none
        ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]=fg=magenta
        ZSH_HIGHLIGHT_STYLES[process-substitution]=none
        ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]=fg=magenta
        ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=blue
        ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=blue
        ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
        ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]=fg=blue,bold
        ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=yellow
        ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=yellow
        ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]=fg=yellow
        ZSH_HIGHLIGHT_STYLES[rc-quote]=fg=magenta
        ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=magenta
        ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=magenta
        ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]=fg=magenta
        ZSH_HIGHLIGHT_STYLES[assign]=none
        ZSH_HIGHLIGHT_STYLES[redirection]=fg=blue,bold
        ZSH_HIGHLIGHT_STYLES[comment]=fg=black,bold
        ZSH_HIGHLIGHT_STYLES[named-fd]=none
        ZSH_HIGHLIGHT_STYLES[numeric-fd]=none
        ZSH_HIGHLIGHT_STYLES[arg0]=fg=green
        ZSH_HIGHLIGHT_STYLES[bracket-error]=fg=red,bold
        ZSH_HIGHLIGHT_STYLES[bracket-level-1]=fg=blue,bold
        ZSH_HIGHLIGHT_STYLES[bracket-level-2]=fg=green,bold
        ZSH_HIGHLIGHT_STYLES[bracket-level-3]=fg=magenta,bold
        ZSH_HIGHLIGHT_STYLES[bracket-level-4]=fg=yellow,bold
        ZSH_HIGHLIGHT_STYLES[bracket-level-5]=fg=cyan,bold
        ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]=standout

		typeset -A ZSH_HIGHLIGHT_REGEXP
		ZSH_HIGHLIGHT_REGEXP+=('^rm .*' fg=red,bold)
		ZSH_HIGHLIGHT_REGEXP+=('.*\\x[0-9a-fA-F]{2}.*' fg=cyan)
    fi

toggle_oneline_prompt(){
    if [ "$PROMPT_ALTERNATIVE" = oneline ]; then
        PROMPT_ALTERNATIVE=twoline
    else
        PROMPT_ALTERNATIVE=oneline
    fi
    configure_prompt
    zle reset-prompt
}
zle -N toggle_oneline_prompt
bindkey ^P toggle_oneline_prompt

# Enable auto-suggestions based on the history
#if [ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
#    . /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
    # Change suggestion color
#    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#999'
#fi

# Rehash when $PATH contents is modified
zshcache_time="$(date +%s%N)"

rehash_precmd() {
  if [[ -a /var/cache/zsh/pacman ]]; then
    local paccache_time="$(date -r /var/cache/zsh/pacman +%s%N)"
    if (( zshcache_time < paccache_time )); then
      rehash
      zshcache_time="$paccache_time"
    fi
  fi
}

add-zsh-hook -Uz precmd rehash_precmd

# Remember recent directories
DIRSTACKFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/dirs"
if [[ -f "$DIRSTACKFILE" ]] && (( ${#dirstack} == 0 )); then
	dirstack=("${(@f)"$(< "$DIRSTACKFILE")"}")
	[[ -d "${dirstack[1]}" ]] && cd -- "${dirstack[1]}"
fi
chpwd_dirstack() {
	print -l -- "$PWD" "${(u)dirstack[@]}" > "$DIRSTACKFILE"
}
add-zsh-hook -Uz chpwd chpwd_dirstack

DIRSTACKSIZE='20'

setopt AUTO_PUSHD PUSHD_SILENT PUSHD_TO_HOME

## Remove duplicate entries
setopt PUSHD_IGNORE_DUPS

## This reverts the +/- operators.
setopt PUSHD_MINUS

# Unfuck the terminal
function reset_broken_terminal () {
	printf '%b' '\e[0m\e(B\e)0\017\e[?5l\e7\e[0;0r\e8'
}

add-zsh-hook -Uz precmd reset_broken_terminal

# cdr
add-zsh-hook chpwd chpwd_recent_dirs

PATH="/home/ben-allen/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/ben-allen/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/ben-allen/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/ben-allen/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/ben-allen/perl5"; export PERL_MM_OPT;
