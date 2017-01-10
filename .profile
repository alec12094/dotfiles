export CLICOLOR=1
export AWS_ACCESS_KEY_ID=AKIAJFE6LIQGNW4QXTIA
export AWS_SECRET_ACCESS_KEY=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
export CQLSH_NO_BUNDLED=TRUE
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin


parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

if [[ $- == *i* ]]; then
	grey='\[\033[1;30m\]'
	red='\[\e[38;5;172m\]'
	RED='\[\e[38;5;137m\]'
	green='\[\e[0;32m\]'
	GREEN='\[\033[1;32m\]'
	yellow='\[\033[0;33m\]'
	YELLOW='\[\033[1;33m\]'
	purple='\[\033[0;35m\]'
	PURPLE='\[\033[1;35m\]'
	white='\[\033[0;37m\]'
	WHITE='\[\033[1;37m\]'
	blue='\[\033[0;34m\]'
	BLUE='\[\033[1;34m\]'
	cyan='\[\033[0;36m\]'
	CYAN='\[\033[1;36m\]'
	NC='\[\033[0m\]'
	PS1="$YELLOW\$(parse_git_branch) $CYAN\u:$cyan[\w]\[$(tput sgr0)\]\n"
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'
	alias dir='dir --color=auto'
	alias vdir='vdir --color=auto'

	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi

alias ssh-dash='ssh ubuntu@54.208.99.9'
alias redis-dash='redis-cli -h 54.85.189.104'
export GOPATH=~/Desktop/CQuotient/go
alias cq-dir='cd /Users/abenson/Desktop/CQuotient'
alias gretelmap='uglifyjs --compress --mangle --source-map gretel.min.map -- gretel.js'
alias icoverage='istanbul cover node_modules/mocha/bin/_mocha -- -R spec --recursive test/ && open coverage/lcov-report/*.html'
alias e2e='grunt compile db-migrate:reset:test_data db-migrate:up db-migrate:up:test_data test-e2e'

function ec2-ssh-instance () {
  ssh $(aws ec2 describe-instances --region $1 --filter Name=instance-id,Values=$2 | jq '.Reservations[0].Instances[0].PrivateIpAddress' | tr -d '"')
}

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
