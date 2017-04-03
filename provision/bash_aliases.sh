#! /bin/bash

# sets up bash profile
sed -i 's/#force_color_prompt=yes/force_color_prompt=yes/g' /etc/skel/.bashrc
sed -i 's/#force_color_prompt=yes/force_color_prompt=yes/g' ~/.bashrc

cat > /etc/skel/.bash_aliases << EOF
alias ls='ls -Fhv --si --color --group-directories-first --time-style=long-iso'
alias l='ls -l'
alias ll='ls -la'
alias llt='ll -t'
alias dir='l -X'
alias vdir='l -d'
alias genpwd="tr -dc [:print:] < /dev/urandom | tr -d '\\\`^' | fold -w 20 | head -n 1 ; tr -dc [:alnum:] < /dev/urandom | fold -w 20 | head -n 1"
EOF
mkdir /etc/skel/.ssh
chmod go-rwx /etc/skel/.ssh/

cp /etc/skel/.bash_aliases ~/
source ~/.bashrc
