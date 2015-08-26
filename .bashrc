# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

source ~/.basebashrc
source ~/.phpbrew/bashrc

variables=~/.ssh/variables

sshadd() {
source "$variables" > /dev/null
ssh-add -l > /dev/null 2>&1
case "$?" in
    1)
        ssh-add > /dev/null 2>&1
    ;;
    2)
        rm "$variables"
        sshagent
    ;;
esac
}

sshagent() {
if [ -f "$variables" ] ; then
    sshadd
else
    ssh-agent -s > $variables
    sshadd
fi
}

sshagent

export EDITOR=vim
export PATH=$PATH:~/npm/bin
export PATH=$PATH:~/bin

#JAVA_HOME=/usr/lib/jvm/jdk1.8.0_25/
JAVA_HOME=/usr/lib/jvm/jdk-8u5-tuxjdk-b08
export JAVA_HOME
