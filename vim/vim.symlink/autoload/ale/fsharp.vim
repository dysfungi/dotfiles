" Author: Derek M Frank <derek@frank.sh>
" Description: Functions for integrating with F# linters.

call ale#Set('fsharp_auto_dotenv', '0')

function! ale#fsharp#FindProjectRootIni(buffer) abort
    for l:path in ale#path#Upwards(expand('#' . a:buffer . ':p:h'))
        " If you change this, update ale-fsharp-root documentation.
        if filereadable(l:path . '/*.fsproj')
        \|| filereadable(l:path . '/.config/dotnet-tools.json')
        \|| filereadable(l:path . '/.tool-versions')
            return l:path
        endif
    endfor

    return ''
endfunction

" Given a buffer number, find the project root directory for F#.
" The root directory is defined as the first directory found while searching
" upwards through paths, including the current directory, until a path
" containing an init file (one from *.fsproj, .config/dotnet-tools.json,
" .tool-versions) is found. If it is not possible to find the project root directory
" via init file, then it will be defined as the first directory found
" searching upwards through paths, including the current directory, until no
" Program.fs files are found.
function! ale#fsharp#FindProjectRoot(buffer) abort
    let l:ini_root = ale#fsharp#FindProjectRootIni(a:buffer)

    if !empty(l:ini_root)
        return l:ini_root
    endif

    for l:path in ale#path#Upwards(expand('#' . a:buffer . ':p:h'))
        if !filereadable(l:path . '/Program.fs')
            return l:path
        endif
    endfor

    return ''
endfunction

" Given a buffer number and a command name, find the path to the executable.
" First search on a virtualenv for F#, if nothing is found, try the global
" command. Returns an empty string if cannot find the executable
function! ale#fsharp#FindExecutable(buffer, base_var_name, path_list) abort
    if ale#Var(a:buffer, a:base_var_name . '_use_global')
        return ale#Var(a:buffer, a:base_var_name . '_executable')
    endif

    return ale#Var(a:buffer, a:base_var_name . '_executable')
endfunction

" Handle traceback.print_exception() output starting in the first a:limit lines.
function! ale#fsharp#HandleTraceback(lines, limit) abort
    let l:nlines = len(a:lines)
    let l:limit = a:limit > l:nlines ? l:nlines : a:limit
    let l:start = 0

    while l:start < l:limit
        if a:lines[l:start] is# 'Traceback (most recent call last):'
            break
        endif

        let l:start += 1
    endwhile

    if l:start >= l:limit
        return []
    endif

    let l:end = l:start + 1

    " Traceback entries are always prefixed with 2 spaces.
    " SyntaxError marker (if present) is prefixed with at least 4 spaces.
    " Final exc line starts with exception class name (never a space).
    while l:end < l:nlines && a:lines[l:end][0] is# ' '
        let l:end += 1
    endwhile

    let l:exc_line = l:end < l:nlines
    \   ? a:lines[l:end]
    \   : 'An exception was thrown.'

    return [{
    \   'lnum': 1,
    \   'text': l:exc_line . ' (See :ALEDetail)',
    \   'detail': join(a:lines[(l:start):(l:end)], "\n"),
    \}]
endfunction

" Detects whether a dotenv environment is present.
function! ale#fsharp#DotenvPresent(buffer) abort
    return findfile('Pipfile.lock', expand('#' . a:buffer . ':p:h') . ';') isnot# ''
endfunction
