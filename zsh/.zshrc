# Adapted from https://unix.stackexchange.com/a/113768/347104
# if [ -n "$PS1" ] && [ -z "$TMUX" ]; then
#   # Adapted from https://unix.stackexchange.com/a/176885/347104
#   # Create session 'main' or attach to 'main' if already exists.
#   tmux new-session -A -s main
# fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting ssh-agent python)

# Python plugin settings
export PYTHON_AUTO_VRUN=true
export PYTHON_VENV_NAME=".venv"

# ssh-agent plugin settings
zstyle :omz:plugins:ssh-agent agent-forwarding yes
zstyle :omz:plugins:ssh-agent quiet yes
zstyle :omz:plugins:ssh-agent lazy yes

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"
#

eval "$(zoxide init zsh)"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
source ~/.zsh_aliases

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export EDITOR=nvim.appimage

export PATH="/home/cmintzias-local/.local/bin:$PATH"
export PATH="/home/cmintzias-local/pinta/scripts:$PATH"

# Firmware token for local TMSERVER
export FIRMWARE_MAP_OVERRIDES_USER="cmintzias"
export FIRMWARE_MAP_OVERRIDES_PAT="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"

export PintaResourcesPath="/home/cmintzias-local/autopilot/pinta/resources"
export PINTA_RESOURCES_PATH=$PintaResourcesPath
export ScenariosPath="/home/cmintzias-local/autopilot/pinta/python/scenario_executor/scenario_executor"
export PYTHONPATH=$PYTHONPATH:/home/cmintzias-local/autopilot/pinta/python/scenario_executor:/home/cmintzias-local/autopilot/pinta/BUILD/python/sim_command_stream:/home/cmintzias-local/autopilot/pinta/BUILD/python/sim_state_stream:/usr/lib/python3.10/tkinter

export CXX=clang++
export CXXFLAGS=-std=c++20

get_ap_dir()
{
    if [ -d /usr_src/firmware ]; then
        echo /usr_src/firmware
    else
        gittop=$(git rev-parse --show-toplevel)
        # If we're in a sub-module (or sub-sub-module), search upwards for
        # the parent (or grand-parent) git tree root.
        while true
        do
            parent_gittop=$(cd "${gittop:h}" && git rev-parse --show-toplevel 2>/dev/null)
            if [ ! -z "${parent_gittop:-}" ] ; then
                gittop="$parent_gittop"
            else
                break  # parent folder is not a git tree, so we're done
            fi
        done
        echo "$gittop"
    fi
}


ap()
{
    set -x
    ap_dir=$(get_ap_dir)
    "$ap_dir"/tools/autopilot "$@"
}

export PATH="$HOME/.local/bin:$PATH"

#eval "$(thefuck --alias fuck)"
eval "$(register-python-argcomplete3 ap 2>/dev/null)"

export REQUESTS_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt

export SIM_SCENARIOS_CLIENT_PORT=3000
export SIM_SCENARIOS_SERVER_PORT=8001
export SIM_SCENARIOS_GO_SERVER_PORT=8002

export SIM_SCENARIOS_SERVER_URL="http://localhost"
export SIM_SCENARIOS_GO_SERVER_URL="http://localhost"
export FLATTEN_SCENARIOS_SERVER_URL="http://localhost:5000"

# Read Only S3 Bucket Creds:
export SIM_SCENARIOS_S3_ACCESS_KEY_ID=395c80f8-5275-46c1-a49c-3f49f126ebc0
export SIM_SCENARIOS_S3_SECRET_ACCESS_KEY_ID=LYDEld5dHKNyOhkgPrZI17QYlpkT5KxUyWuS5Swf
export SIM_SCENARIOS_S3_ENDPOINT=s3.b.smf11.tcs.tesla.com

# This is required and can be procured through Fuze
export SIM_SCENARIOS_MONGODB_CONNECTION_STRING="mongodb://simscenarios_prod_ro:abf4c4b896e918611321c3cdcd3be1fa20c22685@simscenarios-prod-db.cluster-cvkrpbvcc0jp.us-west-2.docdb.amazonaws.com:27017/simscenarios"
export NODE_EXTRA_CA_CERTS=/etc/ssl/certs/ca-certificates.crt

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export TCLIPS_ACCESS_TOKEN=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJhdXRvcGlsb3RfdGNsaXBzX2FwaTEiLCJleHAiOjE3MjUwNDQwNjIsImlhdCI6MTcyNDQzODY2MiwiaXNzIjoiaHR0cHM6Ly9ib3VuY2VyLnZuLnRlc2xhbW90b3JzLmNvbSIsImp0aSI6IjQ3Y2QxMzc5LTdjMTgtNDAxZC04MDAyLWFhYWU4NzIzNzYzMCIsInNjcCI6WyJ0OmF1dG9waWxvdC1jbGlwcyJdLCJzdWIiOiJjbWludHppYXMiLCJ0ZXNsYS5hdXRobGV2ZWwiOiJQYXNzd29yZCIsInR0bCI6NjA0ODAwfQ.ssVgJ_H4qEctOrc5Z3J_1XJNlg0ixaANbI1Bnsi8p-bAyJcjPMlG80GBTBXHk8I5rU7fdnSxvaEaqUfrYbTKqhm-nkF55_7KoJDUO4XiY-83tF-02eFD9dDGWj4BlpZ1L6srMANaPk9XtRVi3oue1WCYEVsQw-Y4W09JnfJNoJFz_i03siVeieUo88l5l8PIvdkOlES9hzHAEGepDlrIXUIH_ouXSfdHsIyhvZLhK4_e-Yj0sJbFXH3pKcRqgATK4i5s3PJSbzXBg-ALJn41BxHwPgHeSa0LugQUWfPCPRSuyV8kFNOsQGbmtNiI4t0XFdcXsyFoFkf82xFWuvsKKQ
export TCLIPS_USERNAME=cmintzias
