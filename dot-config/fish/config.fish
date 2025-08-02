if status is-interactive
    # Commands to run in interactive sessions can go here
end

source ~/.config/fish/functions/pandoc.fish

fzf --fish | source
starship init fish | source

fish_add_path ~/.cargo/bin/
fish_add_path ~/go/bin/
fish_add_path ~/.local/bin/
fish_add_path ~/.juliaup/bin/
fish_add_path /opt/homebrew/bin/gh

set fish_greeting
set -gx EDITOR hx
set -g fish_key_bindings fish_vi_key_bindings

# Yazi exit directory to become working directory
function yz
    set tmp (mktemp -t "yazi-cwd.XXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

# Bind Ctrl+h to move backward a character
bind \ch backward-char

# Bind Ctrl+j to move down a line (or search history if at the end of the line)
bind \cj down-or-search

# Bind Ctrl+k to move up a line (or search history if at the end of the line)
bind \ck up-or-search

# Bind Ctrl+l to move forward a character
bind \cl forward-char

alias clr=clear
alias py3=python3
alias vi=nvim
alias gui=gitui
alias ls="eza --icons --sort ext"
alias ll="eza --icons -l --sort ext"
alias cat=bat
alias :q=exit
alias :x=exit
alias sshk="kitten ssh"
alias presi=presenterm
alias yza="cd /Volumes/hamuDrive;yz /Volumes/hamuDrive"
alias yzn="cd ~/notesRepo/; yz ~/notesRepo/"

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /Users/hamu/.lmstudio/bin
# End of LM Studio CLI section
