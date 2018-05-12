# af-magic.zsh-theme
# Repo: https://github.com/andyfleming/oh-my-zsh
# Direct Link: https://github.com/andyfleming/oh-my-zsh/blob/master/themes/af-magic.zsh-theme

# if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="green"; fi
# local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

# date="$(date '+%I:%M:%S%p %Z %D')"

zstyle ':vcs_info:git*' formats '%b'

# primary prompt
PROMPT='$FG[032]λ%{$reset_color%} %~ ($FG[042]%{$vcs_info_msg_0_%}$FG[015]) %(!.$FG[160]».$FG[032]»)%{$reset_color%} '

# color vars
eval my_gray='$FG[237]'
eval my_orange='$FG[214]'

# right prompt
# if type "virtualenv_prompt_info" > /dev/null
# then
# 	RPROMPT='$(virtualenv_prompt_info)$FG[243]%{$date%}%{$reset_color%}%'

# else
#	RRPROMPT='$FG[243]%{$date%}%{$reset_color%}%'
# fi

# git settings
ZSH_THEME_GIT_PROMPT_PREFIX="$FG[075]($FG[078]"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="$my_orange*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$FG[075])%{$reset_color%}"
