" Volcanic Color Scheme ~ Just ashes and blazing lava
" Andre Zunino
" April 2020

let g:colors_name="volcanic"

function s:log(msg)
    echom "[Volcanic] " . a:msg
endfunction

if version < 700
    finish
endif

if &background != "dark"
    call s:log("Sorry, only meant for dark mode...")
    finish
endif

if !(has("termguicolors") && &termguicolors)
    finish
endif

syntax reset
hi clear

let s:volcanic_bg        = '#171616'
let s:volcanic_fg        = '#b8b8b8'
let s:volcanic_lava      = '#ff4500'
let s:volcanic_blaze     = '#ffb23d'
let s:volcanic_ash       = '#646464'
let s:volcanic_dark_ash  = '#282727'
let s:volcanic_light_ash = '#cdcccc'

function s:erupt(group, fg, ...)
    let l:hicmd = 'hi ' . a:group . " guifg=" . a:fg
    let l:extra = {}
    if a:0 > 0
        let l:extra = a:1
    endif
    if has_key(l:extra, "bg")
        let l:hicmd = l:hicmd . ' guibg=' . get(l:extra, "bg")
    endif
    if has_key(l:extra, "attr")
        let l:hicmd = l:hicmd . ' gui=' . get(l:extra, "attr")
    else
        let l:hicmd = l:hicmd . ' gui=NONE'
    endif
    exe l:hicmd
endfunction

call s:erupt('Normal', s:volcanic_fg, {"bg":s:volcanic_bg})

call s:erupt('Directory', s:volcanic_ash, {'attr':'bold'})
call s:erupt('Title', s:volcanic_blaze, {'attr':'bold'})

call s:erupt('Comment', s:volcanic_ash)
call s:erupt('Constant', s:volcanic_blaze, {"attr":"bold"})
call s:erupt('Identifier', s:volcanic_light_ash, {'attr':'bold'})
call s:erupt('Statement', s:volcanic_ash, {"attr":"bold"})
call s:erupt('PreProc', s:volcanic_ash, {'attr':'bold'})
call s:erupt('Type', s:volcanic_lava, {"attr":"bold"})
call s:erupt('Special', s:volcanic_lava, {"attr":"bold"})
call s:erupt('Underlined', s:volcanic_lava, {"attr":"bold"})

call s:erupt('NonText', s:volcanic_dark_ash)
call s:erupt('LineNr', s:volcanic_ash)
call s:erupt('Visual', 'NONE', {"bg":s:volcanic_dark_ash})
call s:erupt('Search', s:volcanic_dark_ash, {'bg':s:volcanic_blaze})
call s:erupt('IncSearch', s:volcanic_dark_ash, {'bg':s:volcanic_blaze})
call s:erupt('CursorLine', 'NONE', {'bg':s:volcanic_dark_ash, 'attr':'bold'})
call s:erupt('CursorColumn', 'NONE', {'bg':s:volcanic_dark_ash})
call s:erupt('Pmenu', s:volcanic_lava, {'bg':s:volcanic_dark_ash, 'attr':'bold'})
call s:erupt('PmenuSel', s:volcanic_dark_ash, {'bg':s:volcanic_blaze, 'attr':'bold'})

" Language-specific highlights

" Golang
call s:erupt('goBuiltins', s:volcanic_lava, {"attr":"bold"})

" HTML/Markdown
call s:erupt('htmlH1', s:volcanic_blaze, {'attr':'bold'})
call s:erupt('htmlH2', s:volcanic_blaze, {'attr':'bold'})
call s:erupt('htmlH3', s:volcanic_blaze, {'attr':'bold'})
call s:erupt('htmlH4', s:volcanic_blaze, {'attr':'bold'})
call s:erupt('htmlH5', s:volcanic_blaze, {'attr':'bold'})
call s:erupt('htmlH6', s:volcanic_blaze, {'attr':'bold'})

" Plugin-specific highlights

" NERDTree
call s:erupt('NERDTreeFile', s:volcanic_ash, {'bg':'NONE'})

" Lightline
"call s:erupt('LightLineLeft_normal_0', s:volcanic_dark_ash, {'bg':s:volcanic_lava, 'attr':'bold'})
"call s:erupt('LightLineLeft_command_0', s:volcanic_dark_ash, {'bg':s:volcanic_lava, 'attr':'bold'})
"call s:erupt('LightLineLeft_insert_0', s:volcanic_bg, {'bg':s:volcanic_blaze, 'attr':'bold'})

