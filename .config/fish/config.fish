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

function md2full
    if test (count $argv) -eq 0
        echo "Usage: md2full <input.md>"
        return 1
    end

    set inputFile $argv[1]
    set outputFile (path basename -E $inputFile)

    pandoc $inputFile -o "$outputFile.pdf" \
        --template=hamu.tex \
        --pdf-engine=xelatex \
        -V papersize="8.5in,11in"
end

function md2half
    if test (count $argv) -eq 0
        # No arguments — check if stdin is redirected
        if test -t 0
            # stdin is a terminal → not valid: no input and no arguments
            echo "Usage: md2half <input.md> or use input via stdin"
            return 1
        end

        pandoc - -o "output.pdf" \
            --template=hamu.tex \
            --pdf-engine=xelatex \
            -V papersize="5.5in,8.5in"

        return 1

    else if test (count $argv) -ne 1
        # More than one argument → also invalid
        echo "Usage: md2half <input.md> or use input via stdin"
        return 1
    end

    set inputFile $argv[1]
    set outputFile (path basename -E $inputFile)

    pandoc inputFile -o "$outputFile.pdf" \
        --template=hamu.tex \
        --pdf-engine=xelatex \
        -V papersize="5.5in,8.5in"
end

function md2pmn
    if test (count $argv) -eq 0
        echo "Usage: md2pmn <input.md>"
        return 1
    end

    set inputFile $argv[1]
    set outputFile (path basename -E $inputFile)

    pandoc $argv -o "$outputFile.pdf" \
        --template=hamu.tex \
        --pdf-engine=xelatex \
        -V two_column=true \
        -V papersize="11in,8.5in"
end

function web2epub
    if test (count $argv) -lt 2
        echo "Usage: web2epub <output-name> <input-html-file>"
        return 1
    end

    set epubFileName "$argv[1].epub"
    pandoc -f html -t markdown "$argv[2]" | vipe | pandoc -f markdown -t epub -o "$epubFileName" -
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
alias yza="yz /Volumes/hamuDrive"
alias yzn="yz ~/notesRepo/"

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /Users/hamu/.lmstudio/bin
# End of LM Studio CLI section
