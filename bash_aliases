alias ..='cd ..'
alias llip='last | grep pts | cut -c 23-36 | sort -u'
alias root='sudo -i'

alias apt-install='sudo apt-get install'
alias apt-search='apt-cache search'
alias apt-show='apt-cache show'
alias apt-purge='sudo apt-get --purge  remove'
alias apt-remove='sudo apt-get remove'
alias apt-up="sudo apt-get update && sudo apt-get upgrade"
alias apt-policy="LANG=C apt-cache policy"

#find file
alias f='find . |grep '
#search history
alias h='history|grep '
#search processes
alias p='ps aux |grep '

