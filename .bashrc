# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

source ~/.basebashrc

export EDITOR=vim
export PATH=$PATH:~/bin
export PATH=$PATH:~/bin/scripts

# NPM setup
export PATH=$PATH:~/npm/bin
export NPM_PACKAGE="${HOME}/npm"
export NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
export PATH="$NPM_PACKAGES/bin:$PATH"
# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH # delete if you already modified MANPATH elsewhere in your config
MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

#JAVA_HOME=/usr/lib/jvm/jdk1.8.0_25/
#JAVA_HOME=/usr/lib/jvm/jdk-8u5-tuxjdk-b08
export JAVA_HOME
