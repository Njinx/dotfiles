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
%F{green}%b%b%f '
RPROMPT='%F{green}%B%1v%b%f'

alias ll="ls -l"
alias la="ls -a"
alias lla="ls -la"
alias p="pause"
alias please="sudo"
alias genuis="genius"
alias urxvt-reload="xrdb /home/ben-allen/.Xresources"
alias getwinclass="xprop WM_CLASS"
alias rsync="rsync -avs --progress"
alias zsource="source $HOME/.zshrc"
alias vsource="source $HOME/.vimrc"

EDITOR="vim"; export EDITOR;
VISUAL="vim"; export VISUAL;

CSC_ROOT="/home/ben-allen/Go/src/CyberScoreClient"; export CSC_ROOT;
NOTES_ROOT="/home/ben-allen/Notes"; export NOTES_ROOT;
GOPATH="/home/ben-allen/Go"; export GOPATH;
BROWSER="firefox-developer-edition"; export BROWSER;
LD_LIBRARY_PATH="/lib"; export LD_LIBRARY_PATH;
LIBCLANG_PATH="/usr/lib64/llvm/*/lib64"; export LIBCLANG_PATH;
PERL5LIB="/home/ben-allen/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/ben-allen/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/ben-allen/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/ben-allen/perl5"; export PERL_MM_OPT;
JAVA_HOME="/usr/lib/jvm/java-13-openjdk"

PATH="/home/ben-allen/perl5/bin:${GOPATH}/bin${PATH:+:${PATH}}"; export PATH;

hash -d packages="$HOME/Packages"
hash -d go="$HOME/Go/src"
hash -d notes="$HOME/Notes"
