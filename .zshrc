# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

export PATH="/usr/bin:$PATH"
export PATH=$PATH:/path/to/ansible/bin

#python path to use python3
alias python='python3'

##deployer related
alias deployer='/home/mittal/deployer/deployer.sh'
export DEPLOYER_PATH=/home/mittal/deployer
source /home/mittal/deployer/scripts/deployer-completion.sh
alias deployer-tools='/home/mittal/deployer/scripts/deployer-tools.sh'
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
  eval $(ssh-agent -s) > /dev/null
fi
ssh-add /home/mittal/deployer/ansible/roles/common/ssh/files/common_account > /dev/null 2>&1

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# pnpm
export PNPM_HOME="/home/mittal/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end


autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/mittal/dev/gcp-lexxpluss-infra/terraform/mittal-test/google-cloud-sdk/path.zsh.inc' ]; then . '/home/mittal/dev/gcp-lexxpluss-infra/terraform/mittal-test/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/mittal/dev/gcp-lexxpluss-infra/terraform/mittal-test/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/mittal/dev/gcp-lexxpluss-infra/terraform/mittal-test/google-cloud-sdk/completion.zsh.inc'; fi

alias nv='nvim'

# Good cli tools

#fzf

# cat better alternative
alias cat='bat'
export BAT_THEME=tokyonight_night

# thefuck alias
eval $(thefuck --alias)
alias tf='fuck'

# Colorful, icons, classify (shows / for dirs, * for executables, etc.)
alias ls='eza --icons --color=auto --group-directories-first'

# Long list with git info, human-readable sizes, and group dirs first
alias ll='eza --icons --long --git --color=auto --group-directories-first -h -a'

# Initialize zoxide
eval "$(zoxide init zsh)"
alias cd='z'

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source ~/powerlevel10k/powerlevel10k.zsh-theme
POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Set Git alias
alias gs='git status'
alias bazel='bazel-7.4.1'
