### PATH VARIABLES ###
# Путь к самому antigen
ANTIGEN_PATH="$HOME/.config/antigen.zsh"

# Путь для cargo, если у вас есть установленные утилиты на Rust
CARGO_PATH="$HOME/.cargo/bin"

# Путь к бинарникам Python, если у вас есть они
PYTHON_PATH="$HOME/.local/bin"

# Путь для Node Version Manager, если он вам нужен
NVM_DIR="$HOME/.nvm"

# Файл, в который будет записываться вся история команд на zsh
HISTFILE="$HOME/.zsh_history"

# Редактор по умолчанию. Можете подставить любой, который вам нравится
EDITOR="nvim"

# Количество сохраненных команд в файле
HISTSIZE=10000

# Как много команд шелл должен помнить в одной сессии (по команде history)
SAVEHIST=10000

# Сохраняем всю историю в файл, чтобы она не стиралась, если мы выключим и включим шелл
setopt appendhistory                      

# Проверяем есть ли у нас бинарники Cargo
if [ -d $CARGO_PATH ]; then
	export PATH=$CARGO_PATH:$PATH    # Добавляем переменную CARGO к PATH
fi

# Проверяем есть ли у нас бинарники Python
if [ -d $PYTHON_PATH ]; then
	export PATH=$PYTHON_PATH:$PATH   # Добавляем переменную PYTHON к PATH
fi

# Проверяем скачан ли Antigen
if [ ! -f $ANTIGEN_PATH ]; then
    echo "Antigen is not found!" >&2
		
	# Если antigen не скачан, то качаем его
	curl -L git.io/antigen > $ANTIGEN_PATH
fi

# Опционально! Все что начинается с данной строки не обязательно должно попадать в ваш .zshrc
# Я добавил данный кусочек конфигурации, чтобы вы могли увидеть как можно быстро и удобноо скачать NVM😊
# Проверяем есть ли на системе Node Version Manager
if [ -d $NVM_PATH ]; then

	# Если есть - включаем
	export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
else

	# Если нет - качаем
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
fi


### PLUGIN MANAGER ###
source $ANTIGEN_PATH                               # Подключаем сам antigen

antigen bundle autojump                            # Плагин для прыжка по директориям
antigen bundle git                                 # Плагин для удобных алиасов git
antigen bundle zsh-users/zsh-syntax-highlighting   # Подсветка синтаксиса

# Проверяем есть ли у нас команда exa
type exa &> /dev/null &&
    antigen bundle DarrinTisdale/zsh-aliases-exa   # Если есть - добавляем для неё алиасы

antigen bundle zsh-users/zsh-autosuggestions       # Автодополнение как в Fish
antigen bundle reobin/typewritten@main             # Тема для zsh

# Применяем все настройки, что мы указали😊
antigen apply


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  # source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="powerlevel10k/powerlevel10k"

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
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

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
plugins=(git zsh-syntax-highlighting)

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
