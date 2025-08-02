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

    pandoc $inputFile -o "$outputFile.pdf" \
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

    pandoc $inputFile -o "$outputFile.pdf" \
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

function newnote
    set filename $argv[1]

    if test -z "$filename"
        echo "Please provide a filename."
        return 1
    end

    echo "Outline:

    1.

    # [Title]" >"$filename.md"
end
