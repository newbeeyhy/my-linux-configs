# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/yhu/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
export ZSH=/usr/share/zsh-tools/oh-my-zsh

ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

plugins=(z)

source /usr/share/zsh-tools/oh-my-zsh/oh-my-zsh.sh
source /usr/share/zsh-tools/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-tools/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias python="python3"

export RANGER_LOAD_DEFAULT_RC=false

export NEMU_HOME=/home/yhu/ics2024/nemu
export AM_HOME=/home/yhu/ics2024/abstract-machine
export NAVY_HOME=/home/yhu/ics2024/navy-apps
export ISA=riscv32

export EDITOR=vim
eval "$(gh copilot alias -- zsh)"

export TERM=xterm-256color
