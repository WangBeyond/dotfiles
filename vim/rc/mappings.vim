" Function keys {{{
  " F1    Help screen
  " F2    Insert date and time
  inoremap <F2> <C-R>=strftime("%d/%b/%Y %I:%M %p")<CR>
  " F3    Toggle NERDTree
  " F4    Toggle Alternative file
  nnoremap <F4> :A<CR>
  " F5    Toggle Undotree
  " F6    Toggle Paste mode
  set pastetoggle=<F6>
  " F7    Tigger Syntastic check
  " F8
  " F9    Toggle iTerm 2
  " F10   Toggle Tagbar
  " F11   Toggle Goyo
  " F12   Fullscreen
  nnoremap <F12> :set columns=999 lines=999<CR>
" }}}

" Special keys {{{
  " Use <Tab> and <S-Tab> to indent
  nnoremap <tab>    v>
  nnoremap <s-tab>  v<
  xnoremap <tab>   >gv
  xnoremap <s-tab> <gv

  " Move a line of text using <up><down>
  " http://vim.wikia.com/wiki/Moving_lines_up_or_down
  nnoremap <up>   :m .-2<CR>==
  nnoremap <down> :m .+1<CR>==
  vnoremap <up>   :m '<-2<CR>gv=gv
  vnoremap <down> :m '>+1<CR>gv=gv

  " Move to prev/next location list
  nnoremap <left>  :lprev<cr>zvzz
  nnoremap <right> :lnext<cr>zvzz
" }}}

" Characters (Normal Mode) {{{
  " <~>       Switch character case
  " <0>       Go to first non-blank character
  nnoremap 0 ^
  " <!>
  " <@>       Register
  " <#>       Search word under cursor backwards
  " <$>       To the end of the line
  " <%>       Move between open/close tags
  " *<%>      Move to percentage of file
  " <^>       To the first non-blank character of the line.
  " <&>       Synonym for `:s` (repeat last substitute)
  " <*>       Search word under cursor forwards
  " <(>       Sentences backward
  " <)>       Sentences forward
  " <_>       Quick Horizonal split
  nnoremap _ :sp<cr>
  " <==>      Format current line
  " <+>       Switch
  " <q>*      Record Macro
  " <Q>       Repeat last recorded Macro
  nnoremap Q @@
  " <w>       Word forwards
  " <W>       Word forwards
  " <e>       Forwards to the end of word
  " <E>       Forwards to the end of word
  " <r>       Replace character
  " <R>       Continous replace
  " <t>       find to left (exclusive)
  " <T>       find to left (inclusive)
  " <y>       Yank into register
  " <Y>       Yanking to the end of line
  " <u>       Undo
  " <U>       Undo all latest changes on last changed line
  " <i>       Insert
  " <I>       Insert at beginning of line
  " <o>       Open new line below
  " <O>       Open new line above
  " <p>       Yankround after
  " <P>       Yankround before
  " <[>       tpope/unimpaired
  " <{>       Paragraphs backward
  " <]>       tpope/unimpaired
  " <}>       Paragraphs forward
  " <\>       Toggle folding
  " <|>       Quick vertical split
  nnoremap <bar> :vsp<cr>
  " <a>       Append insert
  " <A>       Append at end of line
  " <s>       EasyMotion
  " <S>       Substitue, don't update default register
  nnoremap S "_s
  " <d>       Delete
  " <D>       Delete to end of line
  " <f>       find to right (exclusive)
  " <F>       find to right (inclusive)
  " <g>*      Jump to top/center/bottom of screen
  nnoremap gh H
  nnoremap gm M
  nnoremap gl L
  " <go>*     Unite mappings
  " <G>       Go to end of file
  " *<G>      Go to specific line number
  " <h>       Left
  " <H>       Go to beginning of line. Goes to previous line if repeated
  nnoremap <expr> H getpos('.')[2] == 1 ? 'k' : '0'
  " <j>       Down
  " <J>       Join Sentences
  " <k>       Up
  " <K>       Run a program to lookup the keyword under the cursor
  " <l>       Right
  " <L>       Go to end of line. Goes to next line if repeated
  nnoremap <expr> L <SID>end_of_line()
  function! s:end_of_line()
    let l = len(getline('.'))
    if (l == 0 || l == getpos('.')[2])
      return 'jg_'
    else
      return 'g_'
    endif
  endfunction
  " <;>       Repeat last find f,t,F,T
  " <:>       Input Command
  " <'>*      Move to {a-zA-Z} mark
  " <\">*     Registers
  " <z>*      Folding
  " <x>       Delete char under cursor
  " <X>       Delete char before cursor
  " <c>       Change, don't update default register
  nnoremap c "_c
  " <C>       Change to end of line, don't update register
  nnoremap C "_C
  " <v>       Visual
  " <V>       Visual line
  " <b>       Words backwards
  " <B>       Words backwards
  " <n>       Next search
  " <N>       Previous search
  " <m>*      Set mark {a-zA-Z}
  " <M>       Move cursor to centre of line
  nnoremap <silent> M :<C-u>call <SID>MoveMiddleOfLine()<CR>
  function! s:MoveMiddleOfLine()
    let strwidth = strdisplaywidth(getline('.'))
    let winwidth = winwidth(0)

    if strwidth < winwidth
      call cursor(0, col('$') / 2)
    else
      normal! M
    endif
  endfunction
  " <,>       Leader
  " [<]       Left Indent
  vnoremap < <gv
  " <.>       Repeat last command
  " [>]       Right Indent
  vnoremap > >gv
  " </>       incsearch.vim
  " <?>       incsearch.vim backwards
  " <SPACE>   Enter <SPACE>
  nnoremap <SPACE> i<SPACE><ESC>
  nnoremap <S-SPACE> a<SPACE><ESC>
  " <CR>      Enter <CR> at current position
  nnoremap <CR> i<CR><ESC>
" }}}

" <leader>* {{{
  " <leader>1
  " <leader>2
  " <leader>3
  " <leader>4
  " <leader>5
  " <leader>6
  " <leader>7
  " <leader>8
  " <leader>9
  " <leader>0 Edit vimrc
  noremap <leader>0 :tabe $MYVIMRC<CR>
  " <leader>) Edit gvimrc
  noremap <leader>) :tabe $MYGVIMRC<CR>
  " <leader>-
  " <leader>=
  " <leader>q Quick quit without save
  nnoremap <leader>q :q!<CR>
  " <leader>w
  " <leader>W Toggle wrap related
  nnoremap <leader>W :call ToggleWrap()<CR>
  function! ToggleWrap()
    nnoremap <buffer> j gj
    nnoremap <buffer> k gk
    nnoremap <buffer> 0 g0
    nnoremap <buffer> $ g$
    nnoremap <buffer> ^ g^
  endfunction
  " <leader>e
  " <leader>r
  " <leader>t
  " <leader>y yankround-prev
  " <leader>Y yankround-next
  " <leader>u
  " <leader>i
  " <leader>o
  " <leader>p
  " <leader>a
  " <leader>s Spell checkings
  nnoremap <leader>ss :setlocal spell!<CR>
  nnoremap <leader>sa zg
  nnoremap <leader>s? z=
  " <leader>S Clear trailing whitespace
  nnoremap <leader>S :%s/\s\+$//ge<CR>:nohl<CR>
  " <leader>d Close buffer and leave Window intact
  nnoremap <leader>d :Sayonara!<CR>
  " <leader>D Close buffer
  nnoremap <leader>D :Sayonara<CR>
  " <leader>f Format file
  nnoremap <leader>f gg=G''
  " <leader>F Format file
  nnoremap <leader>F gg=G''
  " <leader>g
  " <leader>G Toggle Goyo
  nnoremap <leader>G :Goyo<CR>
  " <leader>hs GitGutterStageHunk
  " <leader>hr GitGutterRevertHunk
  " <leader>js Format JSON file (python required)
  nnoremap <leader>js :%!python -m json.tool<CR>
  " <leader>k
  " <leader>l
  " <leader>L Reduce a sequence of blank lines into a single line
  nnoremap <leader>L GoZ<ESC>:g/^[ <Tab>]*$/.,/[^ <Tab>]/-j<CR>Gdd
  " <leader>z
  " <leader>x
  " <leader>c
  " <leader>v Select the just pasted text
  nnoremap <leader>v V`]
  " <leader>b Close all other buffers
  nnoremap <leader>B :BufOnly<CR>
  " <leader>n
  " <leader>m
  " <leader>M Remove ^M
  nnoremap <leader>M mmHmt:%s/<C-V><CR>//ge<CR>'tzt'm
  " <leader>, Switch between current and last buffer
  nnoremap <leader>, <C-^>
  " <leader>. Edit macro in the cmdline-window
  nnoremap <leader>. :<C-U><C-R>='let @'. v:register .' = '. string(getreg(v:register))<CR><C-F><LEFT>
  " <leader><space> Close search highlight
  nnoremap <leader><space> :nohl<CR>
" }}}

" <C-*> (Normal Mode) {{{
  " <C-1> Mac Desktop Switch
  " <C-2> Mac Desktop Switch
  " <C-3> Mac Desktop Switch
  " <C-4> Mac Desktop Switch
  " <C-5> Mac Desktop Switch
  " <C-6>
  " <C-7>
  " <C-8>
  " <C-9>
  " <C-0> Jump back tap
  " <C-->
  " <C-=>
  " <C-q> Visual block select
  " <C-w>
  " <C-e>
  " <C-r>
  " <C-t> Jump back tag stack
  " <C-y> Emmet Expand
  " <C-u> Page up
  " <C-u> Switch word case
  inoremap <C-U> <ESC>mzg~iw`za
  " <C-i>
  " <C-o>
  " <C-p> vim-multiple-cursors, prev key
  " <C-[> Same as <ESC>
  " <C-]> Jump tag
  " <C-a>
  " <C-s>
  " <C-d> Page Down
  " <C-f> Easymotion
  " <C-g>
  " <C-h> Move to left window
  " <C-j> Move to down window
  " <C-k> Move to up window
  " <C-l> Move to right window
  " <C-;>
  " <C-'>
  " <C-CR> Enter a new line below
  inoremap <C-CR> <ESC>o
  " <S-CR> Enter a new line above
  inoremap <S-CR> <ESC>O
  " <C-z>
  " <C-x> vim-multiple-cursors, skip key
  " <C-c>
  " <C-v> Visual block select
  " <C-b> Switch Buffers
  " <C-n> vim-multiple-cursors, next key
  " <C-m>
  " <C-,>
  " <C-.>
" }}}

" <C-*> (Insert Mode) {{{
  inoremap <expr> <C-j> pumvisible() ? "\<C-e>\<Down>" : "\<Down>"
  inoremap <expr> <C-k> pumvisible() ? "\<C-e>\<Up>" : "\<Up>"
  inoremap <C-H>  <S-Left>
  inoremap <C-L>  <S-Right>
  inoremap <C-B>  <Left>
  inoremap <C-F>  <Right>
  inoremap <C-A>  <C-O>^
  inoremap <C-E>  <End>
  inoremap <C-D>  <C-R>=AutoPairsDelete()<CR>
  inoremap <C-BS> <C-W>
  inoremap <D-BS> <S-Right><C-W>
" }}}

" <C-*> (Command Mode) {{{
  cnoremap <C-A> <Home>
  cnoremap <C-E> <End>
  cnoremap <C-F> <Right>
  cnoremap <C-B> <Left>
  cnoremap <C-N> <Down>
  cnoremap <C-P> <Up>
  cnoremap <C-K> <C-\>e getcmdpos() == 1 ? '' : getcmdline()[:getcmdpos()-2]<CR>
  cnoremap <C-D> <Del>
  cnoremap <C-Y> <C-r>*
" }}}

" <M-*> {{{
  " <M-q>
  " <M-w>
  " <M-e>
  " <M-r>
  " <M-t>
  " <M-y> Emmet go to prev
  " <M-u>
  " <M-i>
  " <M-o>
  " <M-p>
  " <M-P>
  " <M-[>
  " <M-]>
  " <M-a>
  " <M-s>
  " <M-d>
  " <M-f>
  " <M-g>
  " <M-h> tabprevious
  " <M-j>
  " <M-k>
  " <M-l> tabnext
  " <M-;>
  " <M-'>
  " <M-z>
  " <M-x>
  " <M-c>
  " <M-v>
  " <M-b>
  " <M-n>
  " <M-m>
  " <M-,>
  " <M-.>
  " <M-/>
" }}}

" <D-*> {{{
  " <D--> Mac Smaller font
  " <D-=> Mac Larger font
  " <D-q> Mac Quit
  " <D-w> Mac Close
  " <D-e>
  " <D-r>
  " <D-t> New Tab
  " <D-y>
  " <D-y> Emmet expand abbr (insert)
  " <D-Y> Emmet next key
  " <D-u>
  " <D-i> Unite file_rec
  " <D-o> Unite file_rec/git
  " <D-p>
  " <D-{> Previous Tabs
  " <D-}> Next Tabs
  " <D-a> Mac Select all
  " <D-s> Mac Save
  " <D-d> Snippet autocomplete
  " <D-f> Unite grep
  " <D-g>
  " <D-h> Mac Hide Window
  " <D-h> Mac Hide Others
  " <D-j>
  " <D-k>
  " <D-l> Mac List Errors
  " <D-;> Mac Go to Next Error
  " <D-:> Mac Suggest Correction to Next Error
  " <D-'>
  " <D-z> Mac Undo
  " <D-x> Mac Cut
  " <D-c> Mac Copy
  " <D-v> Mac Paste
  " <D-b>
  " <D-n>
  " <D-m> Mac Minimize windows
  " <D-,> Mac Advance settings
  " <D-.> Cannot map
  " <D-/> Unite grep
" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim:ft=vim:fdm=marker:sw=2:ts=2
