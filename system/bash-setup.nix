{ config, pkgs, ... }:

{
  # Enable Bash for user environments
  programs.bash = {
    interactiveShellInit = ''
      # ====== Colored Text Codes ======
      blk="\e[1;30m"          # Black
      red="\e[1;31m"          # Red
      grn="\e[1;32m"          # Green
      ylw="\e[1;33m"          # Yellow
      blu="\e[1;34m"          # Blue
      pur="\e[1;35m"          # Purple
      cyn="\e[1;36m"          # Cyan
      wht="\e[1;37m"          # White
      clr="\e[0m"             # Reset

      # ====== Colored Background Codes ======
      blkbg="\e[1;40m"
      redbg="\e[1;41m"
      grnbg="\e[1;42m"
      ylwbg="\e[1;43m"
      blubg="\e[1;44m"
      magbg="\e[1;45m"
      cynbg="\e[1;46m"
      whtbg="\e[1;47m"
      clrbg="\e[0m"

      # Colored grep output
      export GREP_COLORS="mt=00;34"
      alias grep='grep --color=tty'

      # Safer defaults
      alias rm='rm -i'
      alias cp='cp -i'
      alias mv='mv -i'

      # Git cleanup helper
      alias cleanup="git fetch && git branch -vv | grep 'gone' | xargs git branch -D"

      # Shortcuts
      alias ..='cd ..'
      alias vmm='virt-manager'

      # calcguard aliases
      alias k='kubectl'
      alias oc='kubectl'
      alias kns='kubens'
      alias kx='kubectx'

      # History and terminal behavior
      HISTCONTROL=ignoreboth
      HISTSIZE=1000
      HISTFILESIZE=2000
      shopt -s histappend
      shopt -s checkwinsize

      # Colored prompt similar to Ubuntu default
      if [ "$TERM" != "dumb" ]; then
        PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
      fi

      # Colorize ls and define helpers
      if [ -x /run/current-system/sw/bin/dircolors ]; then
        eval "$(/run/current-system/sw/bin/dircolors -b)"
        alias ls='ls --color=auto'
        alias ll='ls -alF'
        alias la='ls -A'
        alias l='ls -CF'
      fi

      # Enable lesspipe support
      if [ -x /run/current-system/sw/bin/lesspipe ]; then
        eval "$(SHELL=/bin/sh /run/current-system/sw/bin/lesspipe)"
      fi
    '';
  };
}
