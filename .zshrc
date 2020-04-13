zmodload zsh/zprof

source /Users/aflor/.bash_profile
source /Users/aflor/.secrets
export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="/Users/aflor/.oh-my-zsh"


# =============================================================================
#                                   Options
# =============================================================================

# Key timeout and character sequences
KEYTIMEOUT=1

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=$HISTSIZE

setopt autocd                   # Allow changing directories without `cd`
setopt append_history           # Dont overwrite history
setopt extended_history         # Also record time and duration of commands.
setopt share_history            # Share history between multiple shells
setopt hist_expire_dups_first   # Clear duplicates when trimming internal hist.
setopt hist_find_no_dups        # Dont display duplicates during searches.
setopt hist_ignore_dups         # Ignore consecutive duplicates.
setopt hist_ignore_all_dups     # Remember only one unique copy of the command.
setopt hist_reduce_blanks       # Remove superfluous blanks.
setopt hist_save_no_dups        # Omit older commands in favor of newer ones.
setopt hist_ignore_space        # Ignore commands that start with space.

# Changing directories
#setopt auto_pushd
setopt pushd_ignore_dups        # Dont push copies of the same dir on stack.
setopt pushd_minus              # Reference stack entries with "-".

setopt extended_glob


# =============================================================================
#                                   Theme
# =============================================================================

#ZSH_THEME="robbyrussell"
#ZSH_THEME="powerlevel9k/powerlevel9k"
#POWERLEVEL9K_MODE='nerdfont-complete'

# =============================================================================
#                                   Plugins
# =============================================================================
# Check if zplug is installed

[ ! -d ~/.zplug ] && git clone https://github.com/zplug/zplug ~/.zplug
source ~/.zplug/init.zsh

# zplug
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# oh-my-zsh
#zplug "zplug/zplug"
#zplug "robbyrussell/oh-my-zsh", use:"lib/*.zsh"

# Miscellaneous commands
#zplug "andrewferrier/fzf-z"
# zplug "k4rthik/git-cal",  as:command
zplug "peco/peco",        as:command, from:gh-r
# zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:fzf, use:"*${(L)$(uname -s)}*amd64*"
zplug "junegunn/fzf", use:"shell/*.zsh", as:plugin

# Enhanced cd
zplug "b4b4r07/enhancd", use:init.sh

# Bookmarks and jump
zplug "jocelynmallon/zshmarks"

# Enhanced dir list with git features
#zplug "supercrabtree/k"

# Jump back to parent directory
zplug "tarrasch/zsh-bd"

# Simple zsh calculator
#zplug "arzzen/calc.plugin.zsh"

# Directory colors
# zplug "seebi/dircolors-solarized", ignore:"*", as:plugin

# Load theme
# zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme
zplug "romkatv/powerlevel10k", as:theme, depth:1

#zplug "plugins/common-aliases",    from:oh-my-zsh
#zplug "plugins/colored-man-pages", from:oh-my-zsh
#zplug "plugins/colorize",          from:oh-my-zsh
zplug "plugins/command-not-found", from:oh-my-zsh
# zplug "plugins/copydir",           from:oh-my-zsh
# zplug "plugins/copyfile",          from:oh-my-zsh
# zplug "plugins/cp",                from:oh-my-zsh
# zplug "plugins/dircycle",          from:oh-my-zsh
# zplug "plugins/encode64",          from:oh-my-zsh
# zplug "plugins/extract",           from:oh-my-zsh
# zplug "plugins/history",           from:oh-my-zsh
zplug "plugins/tmux",              from:oh-my-zsh
# zplug "plugins/tmuxinator",        from:oh-my-zsh
#zplug "plugins/urltools",          from:oh-my-zsh
#zplug "plugins/web-search",        from:oh-my-zsh
# zplug "plugins/z",                 from:oh-my-zsh
#zplug "plugins/fancy-ctrl-z",      from:oh-my-zsh

# Supports oh-my-zsh plugins and the like
if [[ $OSTYPE = (linux)* ]]; then
    zplug "plugins/archlinux",     from:oh-my-zsh, if:"(( $+commands[pacman] ))"
    zplug "plugins/dnf",           from:oh-my-zsh, if:"(( $+commands[dnf] ))"
fi

if [[ $OSTYPE = (darwin)* ]]; then
    zplug "lib/clipboard",         from:oh-my-zsh
    zplug "plugins/osx",           from:oh-my-zsh
    # zplug "plugins/brew",          from:oh-my-zsh, if:"(( $+commands[brew] ))"
    # zplug "plugins/macports",      from:oh-my-zsh, if:"(( $+commands[port] ))"
fi

zplug "plugins/git",               from:oh-my-zsh, if:"(( $+commands[git] ))"
#zplug "plugins/golang",            from:oh-my-zsh, if:"(( $+commands[go] ))"
#zplug "plugins/svn",               from:oh-my-zsh, if:"(( $+commands[svn] ))"
#zplug "plugins/node",              from:oh-my-zsh, if:"(( $+commands[node] ))"
#zplug "plugins/npm",               from:oh-my-zsh, if:"(( $+commands[npm] ))"
#zplug "plugins/bundler",           from:oh-my-zsh, if:"(( $+commands[bundler] ))"
#zplug "plugins/gem",               from:oh-my-zsh, if:"(( $+commands[gem] ))"
#zplug "plugins/rbenv",             from:oh-my-zsh, if:"(( $+commands[rbenv] ))"
#zplug "plugins/rvm",               from:oh-my-zsh, if:"(( $+commands[rvm] ))"
#zplug "plugins/pip",               from:oh-my-zsh, if:"(( $+commands[pip] ))"
# zplug "plugins/sudo",              from:oh-my-zsh, if:"(( $+commands[sudo] ))"
#zplug "plugins/gpg-agent",         from:oh-my-zsh, if:"(( $+commands[gpg-agent] ))"
#zplug "plugins/systemd",           from:oh-my-zsh, if:"(( $+commands[systemctl] ))"
# zplug "plugins/docker",            from:oh-my-zsh, if:"(( $+commands[docker] ))"
#zplug "plugins/docker-compose",    from:oh-my-zsh, if:"(( $+commands[docker-compose] ))"

#zplug "djui/alias-tips"
zplug "hlissner/zsh-autopair", defer:2
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
# zsh-syntax-highlighting must be loaded after executing compinit command
# and sourcing other plugins
zplug "zsh-users/zsh-syntax-highlighting", defer:2
# zplug "zsh-users/zsh-history-substring-search", defer:3



#plugins=(
#  git
#)

# =============================================================================
#                                   Aliases
# =============================================================================

# Set editor preference to nvim if available.
if (( $+commands[nvim] )); then
	alias vim='() { $(whence -p nvim) $@ }'
else
	alias vim='() { $(whence -p vim) $@ }'
fi


# =============================================================================
#                                 Completions
# =============================================================================

zstyle ':completion:*' rehash true
#zstyle ':completion:*' verbose yes
#zstyle ':completion:*:descriptions' format '%B%d%b'
#zstyle ':completion:*:messages' format '%d'
#zstyle ':completion:*:warnings' format 'No matches for: %d'
#zstyle ':completion:*' group-name ''

# case-insensitive (all), partial-word and then substring completion
zstyle ":completion:*" matcher-list \
  "m:{a-zA-Z}={A-Za-z}" \
  "r:|[._-]=* r:|=*" \
  "l:|=* r:|=*"

zstyle ":completion:*:default" list-colors ${(s.:.)LS_COLORS}

# =============================================================================
#                                   Startup
# =============================================================================

# Install plugins if there are plugins that have not been installed
if ! zplug check; then
    printf "Install plugins? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

if zplug check "seebi/dircolors-solarized"; then
  which gdircolors &> /dev/null && alias dircolors='() { $(whence -p gdircolors) }'
  which dircolors &> /dev/null && \
	  eval $(dircolors ~/.zplug/repos/seebi/dircolors-solarized/dircolors.256dark)
fi

if zplug check "zsh-users/zsh-history-substring-search"; then
	zmodload zsh/terminfo
	bindkey "$terminfo[kcuu1]" history-substring-search-up
	bindkey "$terminfo[kcud1]" history-substring-search-down
	bindkey "^[[1;5A" history-substring-search-up
	bindkey "^[[1;5B" history-substring-search-down
fi

if zplug check "zsh-users/zsh-syntax-highlighting"; then
	#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'
	ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor line)
	ZSH_HIGHLIGHT_PATTERNS=('rm -rf *' 'fg=white,bold,bg=red')

	typeset -A ZSH_HIGHLIGHT_STYLES
	ZSH_HIGHLIGHT_STYLES[cursor]='bg=yellow'
	ZSH_HIGHLIGHT_STYLES[globbing]='none'
	ZSH_HIGHLIGHT_STYLES[path]='fg=white'
	ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=grey'
	ZSH_HIGHLIGHT_STYLES[alias]='fg=cyan'
	ZSH_HIGHLIGHT_STYLES[builtin]='fg=cyan'
	ZSH_HIGHLIGHT_STYLES[function]='fg=cyan'
	ZSH_HIGHLIGHT_STYLES[command]='fg=green'
	ZSH_HIGHLIGHT_STYLES[precommand]='fg=green'
	ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=green'
	ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=yellow'
	ZSH_HIGHLIGHT_STYLES[redirection]='fg=magenta'
	ZSH_HIGHLIGHT_STYLES[bracket-level-1]='fg=cyan,bold'
	ZSH_HIGHLIGHT_STYLES[bracket-level-2]='fg=green,bold'
	ZSH_HIGHLIGHT_STYLES[bracket-level-3]='fg=magenta,bold'
	ZSH_HIGHLIGHT_STYLES[bracket-level-4]='fg=yellow,bold'
fi

if zplug check "b4b4r07/enhancd"; then
    ENHANCD_DOT_SHOW_FULLPATH=1
	ENHANCD_DISABLE_HOME=0
fi

if zplug check "b4b4r07/zsh-history-enhanced"; then
	ZSH_HISTORY_FILE="$HISTFILE"
    ZSH_HISTORY_FILTER="fzf:peco:percol"
    ZSH_HISTORY_KEYBIND_GET_BY_DIR="^r"
    ZSH_HISTORY_KEYBIND_GET_ALL="^r^a"
fi

if zplug check "bhilburn/powerlevel9k"; then
    DEFAULT_FOREGROUND=006
    DEFAULT_BACKGROUND=235


    POWERLEVEL9K_MODE='nerdfont-complete'
   # POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir newline vcs)
    POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=( dir_writable status dir )
    POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vcs command_execution_time ram_joined battery time ssh)

    POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND="$DEFAULT_FOREGROUND"
    POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND="$DEFAULT_BACKGROUND"
    POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND="$DEFAULT_FOREGROUND"
    POWERLEVEL9K_CONTEXT_ROOT_BACKGROUND="$DEFAULT_BACKGROUND"

    POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR="\uE0B4"
    POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR="%F{$(( $DEFAULT_BACKGROUND - 2 ))}|%f"
    POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR="\uE0B6"
    POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR="%F{$(( $DEFAULT_BACKGROUND - 2 ))}|%f"

    POWERLEVEL9K_DIR_HOME_BACKGROUND="$DEFAULT_FOREGROUND"
    POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="$DEFAULT_FOREGROUND"
    POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="$DEFAULT_FOREGROUND"
    POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_BACKGROUND="$DEFAULT_FOREGROUND"

    POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND="$DEFAULT_FOREGROUND"
    POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND="$DEFAULT_BACKGROUND"
    POWERLEVEL9K_COMMAND_EXECUTION_TIME_VISUAL_IDENTIFIER_COLOR="yellow"
    POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0
    POWERLEVEL9K_EXECUTION_TIME_ICON="\ufa1e"

    POWERLEVEL9K_TIME_FOREGROUND="$DEFAULT_FOREGROUND"
    POWERLEVEL9K_TIME_BACKGROUND="$DEFAULT_BACKGROUND"

#    POWERLEVEL9K_DIR_HOME_FOREGROUND="white"
#    POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="white"
#    POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="white"

    POWERLEVEL9K_LOAD_CRITICAL_BACKGROUND="$DEFAULT_BACKGROUND"
    POWERLEVEL9K_LOAD_WARNING_BACKGROUND="$DEFAULT_BACKGROUND"
    POWERLEVEL9K_LOAD_NORMAL_BACKGROUND="$DEFAULT_BACKGROUND"
    POWERLEVEL9K_LOAD_CRITICAL_FOREGROUND="$DEFAULT_FOREGROUND"
    POWERLEVEL9K_LOAD_WARNING_FOREGROUND="$DEFAULT_FOREGROUND"
    POWERLEVEL9K_LOAD_NORMAL_FOREGROUND="$DEFAULT_FOREGROUND"
    POWERLEVEL9K_LOAD_CRITICAL_VISUAL_IDENTIFIER_COLOR="red"
    POWERLEVEL9K_LOAD_WARNING_VISUAL_IDENTIFIER_COLOR="yellow"
    POWERLEVEL9K_LOAD_NORMAL_VISUAL_IDENTIFIER_COLOR="green"
    POWERLEVEL9K_RAM_BACKGROUND="$DEFAULT_BACKGROUND"
    POWERLEVEL9K_RAM_FOREGROUND="$DEFAULT_FOREGROUND"
    POWERLEVEL9K_RAM_VISUAL_IDENTIFIER_COLOR="magenta"
    POWERLEVEL9K_RAM_ELEMENTS=(ram_free)
    POWERLEVEL9K_BATTERY_LOW_BACKGROUND="$DEFAULT_BACKGROUND"
    POWERLEVEL9K_BATTERY_CHARGING_BACKGROUND="$DEFAULT_BACKGROUND"
    POWERLEVEL9K_BATTERY_CHARGED_BACKGROUND="$DEFAULT_BACKGROUND"
    POWERLEVEL9K_BATTERY_DISCONNECTED_BACKGROUND="$DEFAULT_BACKGROUND"
    POWERLEVEL9K_BATTERY_LOW_FOREGROUND="$DEFAULT_FOREGROUND"
    POWERLEVEL9K_BATTERY_CHARGING_FOREGROUND="$DEFAULT_FOREGROUND"
    POWERLEVEL9K_BATTERY_CHARGED_FOREGROUND="$DEFAULT_FOREGROUND"
    POWERLEVEL9K_BATTERY_DISCONNECTED_FOREGROUND="$DEFAULT_FOREGROUND"
    POWERLEVEL9K_BATTERY_LOW_VISUAL_IDENTIFIER_COLOR="red"
    POWERLEVEL9K_BATTERY_CHARGING_VISUAL_IDENTIFIER_COLOR="yellow"
    POWERLEVEL9K_BATTERY_CHARGED_VISUAL_IDENTIFIER_COLOR="green"
    POWERLEVEL9K_BATTERY_DISCONNECTED_VISUAL_IDENTIFIER_COLOR="$DEFAULT_FOREGROUND"
fi

zplug load

source $ZSH/oh-my-zsh.sh

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# The next line updates PATH for the Google Cloud SDK.
# if [ -f '/Users/aflor/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/aflor/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
# if [ -f '/Users/aflor/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/aflor/google-cloud-sdk/completion.zsh.inc'; fi
