if status is-interactive
    # Commands to run in interactive sessions can go here
end

fzf --fish | source
starship init fish | source

fish_add_path ~/.cargo/bin/
fish_add_path ~/go/bin/
fish_add_path ~/.local/bin/
fish_add_path ~/.juliaup/bin/
fish_add_path /opt/homebrew/bin/gh

set fish_greeting
set -gx EDITOR hx

function yz
    set tmp (mktemp -t "yazi-cwd.XXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

alias clr=clear
alias py3=python3
alias vi=nvim
alias gui=gitui
alias ls="eza --icons --sort ext"
alias ll="eza --icons -l --sort ext"
alias cat=bat
alias :wq=exit
alias sshk="kitten ssh"
