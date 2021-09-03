# Path to your oh-my-zsh installation.
export ZSH="/Users/goldenson/.oh-my-zsh"
export UPDATE_ZSH_DAYS=15

ZSH_THEME="robbyrussell"
DISABLE_UPDATE_PROMPT="true"
HIST_STAMPS="yyyy-mm-dd"

# Loading plugins
plugins=(git ruby bundler asdf)

# Reload config
source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8
export PAGE='less -RS'

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='code'
fi

# Compilation flags
export LDFLAGS="-L/usr/local/opt/libiconv/lib"
export CPPFLAGS="-I/usr/local/opt/libiconv/include"
export LDFLAGS="-L/usr/local/opt/node@12/lib"
export CPPFLAGS="-I/usr/local/opt/node@12/include"
export LDFLAGS="-L/usr/local/opt/libffi/lib"
export PKG_CONFIG_PATH="/usr/local/opt/icu4c/lib/pkgconfig:$PKG_CONFIG_PATH"


# Aliases
alias zshconfig="code ~/.zshrc"
alias whatisrunning="sudo lsof -i -n -P | grep TCP | grep 3000"
alias generate_schema="ruby scripts/regenerate-schema"
alias docker_cleanup="docker system prune -a"
alias graphql="bundle exec rake gitlab:graphql:schema:dump && bundle exec rake gitlab:graphql:compile_docs"

# Export more stuff
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
export PATH="/usr/local/opt/gettext/bin:$PATH"
export PATH="/usr/local/opt/libiconv/bin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
export PATH="/usr/local/sbin:$PATH"

# Added by GDK bootstrap
export PKG_CONFIG_PATH="/usr/local/opt/icu4c/lib/pkgconfig:${PKG_CONFIG_PATH}"
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=/usr/local/opt/openssl@1.1 --with-readline-dir=/usr/local/opt/readline"

# gpg
export GPG_TTY=$(tty)

# Functions

git () {
  if command git "$@"; then
    [[ $1 == "clone" ]] && cd "${${2##*/}%.git}"
  fi
}

# Load everything
autoload bashcompinit
bashcompinit
source "/Users/goldenson/Code/gitlab-development-kit/support/completions/gdk.bash"

# . /usr/local/opt/asdf/libexec/asdf.sh
