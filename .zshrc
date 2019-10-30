autoload -Uz compinit && compinit
autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git
zstyle '*' formats '%b'

precmd() {
	psvar=()

    vcs_info
    [[ -n vcs_info_msg_0_ ]] && print -v 'psvar[1]' -Pr -- "$vcs_info_msg_0_"
}

PROMPT='%(!.%F{red}λ%f.%F{cyan}λ%f) %~
%F{green}%B%b%f '
RPROMPT='%F{green}%B%1v%b%f'

eval $(thefuck --alias)

alias ll="ls -l"
alias la="ls -a"
alias lla="ls -la"
alias please="sudo"
alias genuis="genius"
alias urxvt-reload="xrdb /home/ben-allen/.Xresources"

EDITOR="vim"; export EDITOR;
VISUAL="vim"; export VISUAL;

CSC_ROOT="/home/ben-allen/Go/src/CyberScoreClient"; export CSC_ROOT;
NOTES_ROOT="/home/ben-allen/Notes"; export NOTES_ROOT;
GOPATH="/home/ben-allen/Go"; export GOPATH;
BROWSER="brave"; export BROWSER;
LD_LIBRARY_PATH="/lib"; export LD_LIBRARY_PATH;
LIBCLANG_PATH="/usr/lib64/llvm/*/lib64"; export LIBCLANG_PATH;
PATH="/home/ben-allen/perl5/bin:${GOPATH}/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/ben-allen/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/ben-allen/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/ben-allen/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/ben-allen/perl5"; export PERL_MM_OPT;
