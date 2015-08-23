" Snippets {{{
autocmd! FileType neosnippet,snippet setlocal noexpandtab
" }}}

" Ruby Mappings {{{
autocmd! FileType ruby,eruby,rdoc :call s:RubyDef()
function! s:RubyDef()
  setlocal shiftwidth=2
  setlocal tabstop=2

  " Surround % to %
  let b:surround_37 = "<% \r %>"
  xmap <buffer> % S%
  " Surround = to %=
  let b:surround_61 = "<%= \r %>"
  xmap <buffer> _ S=
  " Surround # to #{}
  let b:surround_35 = "#{\r}"
  xmap <buffer> # S#

  " Make AutoPairs match for these pairs
  let b:AutoPairs = {
        \   '(':')', '[':']', '{':'}', "'":"'", '"':'"', '`':'`', '|': '|'
        \ }

  " Correct typos
  iab <buffer> elseif     elsif
  iab <buffer> ~=         =~
endfunction
" }}}

" JavaScript/CoffeeScript Mappings {{{
autocmd! BufRead,BufNewFile *.cson set ft=coffee
autocmd! FileType javascript,coffee :call s:CoffeeDef()
function! s:CoffeeDef()
  setlocal shiftwidth=2
  setlocal tabstop=2
endfunction
" }}}

" Html/Xml Mappings {{{
autocmd! FileType xhtml,html,slim,jade,xml,yaml :call s:WebDef()
function! s:WebDef()
  setlocal shiftwidth=2
  setlocal tabstop=2

  " Surround % to {{
  let b:surround_37 = "{{ \r }}"
  xmap <buffer> % S%
  " Surround = to {{=
  let b:surround_61 = "{{= \r }}"
  xmap <buffer> _ S=
  " Surround * to <!--
  let b:surround_42 = "<!-- \r -->"
  xmap <buffer> 8 S*

  " Delete surround tag
  nmap <buffer> <Del> dst

  " Special characters
  iab <buffer> ->> →
  iab <buffer> <<- ←
  iab <buffer> >>  »
  iab <buffer> ^^  ↑
  iab <buffer> VV  ↓
endfunction
" }}}

" Markdown Mappings {{{
autocmd! FileType markdown :call s:MarkdownDef()
function! s:MarkdownDef()
  setlocal shiftwidth=2
  setlocal tabstop=2
  setlocal wrap

  " Surround _ to _
  let b:surround_95 = "_\r_"
  xmap <buffer> _ S_
  " Surround * to **
  let b:surround_42 = "**\r**"
  xmap <buffer> 8 S*
  " Surround - to ~~
  let b:surround_45 = "~~\r~~"
  xmap <buffer> - S-

  " Add more parentheses
  let b:AutoPairs = {
        \   '(':')', '[':']', '{':'}', "'":"'", '"':'"', '`':'`',
        \   '“':'”', '‘':'’', '《':'》', '「':'」', '（':'）'
        \ }

  " Insert date and time in Jekyll
  inoremap <buffer> <F2>  <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>
  " Hard wrap current paragraph
  nnoremap <buffer> <D-w> gwip
  " Unwrap current paragraph
  nnoremap <buffer> <D-W> vipJ
  " Format all paragraphs in buffer
  nnoremap <buffer> <D-e> ggVGgq
  " Unformat all paragraphs in buffer
  nnoremap <buffer> <D-E> :%norm vipJ<CR>
  " Insert inline link
  vmap <buffer> <D-k> [f]a(
  " Insert inline image
  vmap <buffer> <D-i> [i!<ESC>f]a(

  " Wrap text
  nnoremap <buffer> j gj
  nnoremap <buffer> k gk
  nnoremap <buffer> 0 g0
  nnoremap <buffer> $ g$
  nnoremap <buffer> ^ g^
endfunction
" }}}

" Python Mappings {{{
autocmd! FileType python :call s:PythonDef()
function! s:PythonDef()
  " Correct typos
  iab <buffer> true       True
  iab <buffer> false      False
endfunction
" }}}

" C/CPP Mappings {{{
autocmd! FileType cpp,c,cc,h,hpp :call s:CppDef()
function! s:CppDef()
  " Surround * to /*
  let b:surround_42 = "/* \r */"
  xmap <buffer> 8 S*

  " Correct typos
  iab <buffer> uis        usi
  iab <buffer> cuot       cout
  iab <buffer> Bool       bool
  iab <buffer> boll       bool
  iab <buffer> Static     static
  iab <buffer> Virtual    virtual
  iab <buffer> True       true
  iab <buffer> False      false
  iab <buffer> String     string
  iab <buffer> prinft     printf
  iab <buffer> pritnt     printf
  iab <buffer> pirntf     printf
  iab <buffer> end;       endl;
  iab <buffer> null       NULL
endfunction
" }}}

" Global Correct typos {{{
iab teh        the
iab nwe        new
iab taht       that
iab fro        for
iab agian      again
iab tyr        try
iab itn        int
iab doulbe     double
iab vodi       void
iab brake;     break;
iab breka;     break;
iab breaka;    break;
iab labeled    labelled
iab seperate   separate
iab execuse    excuse
iab ture       true
iab ?8         /*
iab /8         /*
iab /*         /*
" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim:ft=vim:fdm=marker:sw=2:ts=2
