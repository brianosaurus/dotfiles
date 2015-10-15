# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# powerline stuff
#source /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="fishy"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin"

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"


alias cprod='heroku run console -a adstage-platform-v2'
alias cst='heroku run console -a adstage-staging-platform-v2'
alias ctest='heroku run console -a adstage-test'

export PROD='adstage-platform-v2'
export STAGING='adstage-staging-platform-v2'
export TEST='adstage-test'

# aliases for platform
alias platform-setup='bundle install; bundle exec rake db:migrate; bundle exec rake cequel:migrate; git co db/schema.rb;'
alias platform-run='foreman start -c web=1,all_worker=3 > /tmp/x & less -r +F /tmp/x; kill -SIGINT %'
alias platform-run-stripe='foreman start -c web=1,all_worker=2,webhooks=1,ultrahook=1 > /tmp/x & less -r +F /tmp/x; kill -SIGINT %'
alias blitzkrieg-snowball='foreman start -c web=1,all_worker=1,start=1,stop=1 > /tmp/x & less -r +F /tmp/x; kill -SIGINT %'
alias platform-cleanup='ps aux | grep unicorn | awk '"'"'{print $2}'"'"' | xargs kill -9'

alias skiq='bundle exec sidekiq -c 8 -q default -q webhooks -q linking -q planner -q warmer -q high_adwords_entity -q medium_adwords_entity -q low_adwords_entity -q high_adwords_metrics -q medium_adwords_metrics -q low_adwords_metrics -q bulk_bing_ads_entity -q high_bing_ads_entity -q medium_bing_ads_entity -q low_bing_ads_entity -q high_bing_ads_metrics -q medium_bing_ads_metrics -q low_bing_ads_metrics -q high_facebook_entity -q medium_facebook_entity -q low_facebook_entity -q high_facebook_metrics -q medium_facebook_metrics -q low_facebook_metrics -q high_linkedin_entity -q medium_linkedin_entity -q low_linkedin_entity -q high_linkedin_metrics -q medium_linkedin_metrics -q low_linkedin_metrics -q high_twitter_entity -q medium_twitter_entity -q low_twitter_entity -q high_twitter_metrics -q medium_twitter_metrics -q low_twitter_metrics -q high_goal_metrics -q medium_goal_metrics -q low_goal_metrics -q rules -q reports -q bulk_update -q migration -q low_google_analytics_entity -q medium_google_analytics_entity -q high_google_analytics_entity -i ${DYNO:-1}'


export TRACKING_API_ROOT=http://adstage-staging-tracker.herokuapp.com/
export TRACKING_PASSWORD=jk18fZrqQrpgWoDp_6U_FpGqULJTKWwvTVpmSeJALiM
export TRACKING_USERNAME=e8LF62WrhkGSe9yd8U8Yx_Yscj5DcNk78qrKEArnV18

# export METRICS_V3_API_ROOT=https://adstage-staging-metrics-v3.herokuapp.com
# export METRICS_V3_PASSWORD=metrics.password
# export METRICS_READ_TIMEOUT=60
# export WEB_CONCURRENCY=4

# export METRICS_V3_API_ROOT=http://dev.adstage.io:5002
# export METRICS_V3_PASSWORD=stage
# export METRICS_V3_USERNAME=ad
# export METRICS_API_ROOT=http://dev.adstage.io:9292

#export CASSANDRA_KEYSPACE=metrics
export CASSANDRA_HOST=localhost
export CASSANDRA_USER=cassandra
export CASSANDRA_PASSWORD=cassandra

export METRICS_USERNAME=user
export METRICS_PASSWORD=password

alias pcd='cd ~/projects/adstage-platform-v2'
alias ecd='cd ~/projects/adstage-ember'
alias mcd='cd ~/projects/adstage-metrics-v3'

alias less='less -R'
alias ag='/usr/local/bin/ag --pager=less'

alias up_platofrm='git co patch; git pull; bundle install; rake db:migrate; rake cequel:migrate; git co db/schema.rb'
alias run_platform='rails s'

alias up_ember='git co patch; git pull'
alias re='brunch w -s'

eval "$(rbenv init -)"

alias gfo='git fetch origin'
alias ggpush='git push origin $(current_branch)'
alias ggpull='git pull origin $(current_branch)'
alias 'git push -f'='git kaboom'

# have to put this somewhere
ulimit -n 65536 65536

[[ -s "$HOME/.qfc/bin/qfc.sh" ]] && source "$HOME/.qfc/bin/qfc.sh"

#qfc_quick_command 'platform' '\C-p' 'cd ~/projects/adstage-platform-v2 $0'
#qfc_quick_command 'ember' '\C-e' 'cd ~/projects/adstage-ember $0'

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
