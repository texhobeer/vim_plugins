" Vim indent file
" Language: antlr4 input file

" Only load this indent file when no other was loaded.
if exists("b:did_indent")
  finish
endif

let b:did_indent = 1

setlocal indentexpr=GetAntlr4Indent()
setlocal indentkeys=!^F,o,O
setlocal nosmartindent

" Only define the function once.
if exists("*GetAntlr4Indent")
    finish
endif

function GetAntlr4Indent()
    if v:lnum == 1
        return 0
    endif

    let ind = indent(v:lnum - 1)
    let line = getline(v:lnum - 1)

    if line == ''
        let ind = 0
    elseif line =~ '^\s*;'
        let ind = 0
    elseif line =~ '^\w\+\s*:'
        let ind = ind + matchend(line, '^\w\+\s*')
    elseif line !~ '^\s*|'
        let ind = indent(v:lnum)
    endif

    return ind
endfunction
