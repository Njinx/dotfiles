# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
precmd() {
	vcs_info
}

PROMPT='%(!.%F{red}λ%f.%F{cyan}λ%f) %~ %F{green}→%f '

eval $(thefuck --alias)

#function powerline_precmd() {
#    PS1="$(powerline-shell --shell zsh $?)"
#}

#function install_powerline_precmd() {
#  for s in "${precmd_functions[@]}"; do
#    if [ "$s" = "powerline_precmd" ]; then
#      return
#    fi
#  done
#  precmd_functions+=(powerline_precmd)
#}

if [ "$TERM" != "linux" ]; then
#    install_powerline_precmd
fi

NOTES_ROOT=/home/ben-allen/Notes; export NOTES_ROOT;
GOPATH="/home/ben-allen/Go"; export GOPATH;
LD_LIBRARY_PATH="/lib"; export LD_LIBRARY_PATH;
PATH="/home/ben-allen/perl5/bin:${GOPATH}/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/ben-allen/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/ben-allen/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/ben-allen/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/ben-allen/perl5"; export PERL_MM_OPT;
