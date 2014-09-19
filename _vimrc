""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" WinVIM Configurations
" Author: Wang Zhuochun
" Last Edit: 18/Sep/2014 10:53 AM
" vim:fdm=marker
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
source $VIMRUNTIME/mswin.vim
behave mswin

" encoding
set fileencoding=utf-8
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,ucs-bom,chinese,gbk

" enable filetype plugin
filetype plugin on
filetype indent on
filetype on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NeoBundle Settings {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has('vim_starting')
  set runtimepath+=~/vimfiles/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/vimfiles/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'mingw32-make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

NeoBundleLazy 'AndrewRadev/switch.vim', {
            \   'autoload' : {
            \     'commands': ['Switch']
            \   },
            \ }
    nnoremap + :Switch<CR>
    " Some customized definitions
    let g:switch_custom_definitions =
            \ [
            \   ['else', 'else if', 'elsif'],
            \   ['==', '!='],
            \   ['-=', '+='],
            \   ['if', 'unless'],
            \   ['yes', 'no'],
            \   ['first', 'last'],
            \   ['* [ ]', '* [x]'],
            \   ['get', 'post', 'put', 'patch', 'delete'],
            \   ['\.to_not', '\.to'],
            \   ['\.toBe', '\.not\.toBe'],
            \   ['public', 'protected', 'private'],
            \ ]

" powerful split and join
NeoBundleLazy 'AndrewRadev/splitjoin.vim', {
            \   'autoload' : {
            \     'mappings' : ['gS', 'gJ'],
            \     'commands' : ['SplitjoinJoin', 'SplitjoinSplit']
            \   }
            \ }

" math calculation in vim
NeoBundleLazy 'arecarn/crunch', {
            \   'autoload' : {
            \     'commands' : ['Crunch'],
            \     'mappings' : ['g='],
            \   },
            \ }

NeoBundle 'bling/vim-airline'
    " enable powerline symbols
    let g:airline_powerline_fonts = 1
    " clear default separator symbols
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    " shorter mode names
    let g:airline_mode_map = {
            \ '__' : '-',
            \ 'n'  : 'N',
            \ 'i'  : 'I',
            \ 'R'  : 'R',
            \ 'c'  : 'C',
            \ 'v'  : 'V',
            \ 'V'  : 'V',
            \ '' : 'V',
            \ 's'  : 'S',
            \ 'S'  : 'S',
            \ '' : 'S',
            \ }
    " control which sections get truncated and at what width. >
    let g:airline#extensions#default#section_truncate_width = {
            \   'b': 79,
            \   'x': 60,
            \   'y': 88,
            \   'z': 45,
            \ }
    " disable summary of changed hunks under source control.
    let g:airline#extensions#hunks#enabled = 0
    " enable enhanced tabline.
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#show_buffers = 0
    " display tab number instead of # of splits (default)
    let g:airline#extensions#tabline#tab_nr_type = 1
    " define how buffer names are displayed
    let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
    " no default separators for the tabline
    let g:airline#extensions#tabline#left_sep = ''
    let g:airline#extensions#tabline#left_alt_sep = ''
    let g:airline#extensions#tabline#right_sep = ''
    let g:airline#extensions#tabline#right_alt_sep = ''

NeoBundle 'bufkill.vim'

NeoBundleLazy 'chrisbra/NrrwRgn', {
            \   'autoload' : {
            \     'commands' : ['NarrowRegion', 'NRMulti']
            \   },
            \ }

NeoBundleLazy 'dimasg/vim-mark', {
            \   'autoload' : {
            \     'commands' : ['Mark', 'MarkLoad', 'MarkClear'],
            \     'mappings' : ['<Plug>', ','],
            \   },
            \ }
    let g:mwDefaultHighlightingPalette = 'maximum'
    " Remove the default overriding of * and #, use: >
    nmap <Plug>IgnoreMarkSearchNext <Plug>MarkSearchNext
    nmap <Plug>IgnoreMarkSearchPrev <Plug>MarkSearchPrev

NeoBundleLazy 'jaxbot/semantic-highlight.vim', {
            \   'autoload' : {
            \     'commands' : ['SemanticHighlight']
            \   },
            \ }

NeoBundle 'jiangmiao/auto-pairs'
    " Disable default maps because it maps <C-H>, which conflicts with others
    let g:AutoPairsMapBS = 0
    " But we still want to keep the <BS> behavior
    inoremap <buffer> <silent> <BS> <C-R>=AutoPairsDelete()<CR>

NeoBundleLazy 'junegunn/vim-easy-align', {
            \   'autoload' : {
            \     'mappings' : ['<Plug>(EasyAlign)'],
            \   },
            \ }
    " Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
    xmap <CR>      <Plug>(EasyAlign)
    " Start interactive EasyAlign for a motion/text object (e.g. <Leader>aip)
    nmap <leader>a <Plug>(EasyAlign)

NeoBundleLazy 'jeetsukumaran/vim-markology', {
            \   'autoload' : {
            \     'mappings' : ['m'],
            \   },
            \ }

" use gK to investigate documentation on the word under the cursor
NeoBundleLazy 'Keithbsmiley/investigate.vim', {
            \   'autoload' : {
            \     'mappings' : ['gK'],
            \   },
            \ }
  let g:investigate_use_dash=1

NeoBundleLazy 'kien/tabman.vim', {
            \   'autoload' : {
            \     'commands' : ['TMToggle']
            \   },
            \ }
    nnoremap <F4> :TMToggle<CR>

NeoBundleLazy 'Lokaltog/vim-easymotion', {
            \   'autoload' : {
            \     'mappings' : ['<Plug>(easymotion-'],
            \   }
            \ }
    map \     <Plug>(easymotion-prefix)
    map <C-f> <Plug>(easymotion-sn)
    " not case censitive
    let g:EasyMotion_smartcase = 1

NeoBundleLazy 'majutsushi/tagbar', {
            \   'autoload' : {
            \     'commands' : ['TagbarToggle']
            \   },
            \ }
    nnoremap <F10> :TagbarToggle<CR>
    " sort according to order
    let g:tagbar_sort = 0
    " default is 40
    let g:tagbar_width = 29
    " omit vacant lines
    let g:tagbar_compact = 1
    " auto focus on Tagbar when opened
    let g:tagbar_autofocus = 1
    " expand tag folds
    let g:tagbar_autoshowtag = 1
    " tagbar types
    let g:tagbar_type_coffee = {
        \ 'ctagstype' : 'coffee',
        \ 'kinds'     : [
        \   'c:classes',
        \   'm:methods',
        \   'f:functions',
        \   'v:variables',
        \   'f:fields',
        \ ]
        \ }
    let g:tagbar_type_markdown = {
        \ 'ctagstype' : 'markdown',
        \ 'kinds' : [
        \   'h:Heading_L1',
        \   'i:Heading_L2',
        \   'j:Heading_L3',
        \   'k:Heading_L4'
        \ ]
        \ }

NeoBundle 'matchit.zip'

NeoBundleLazy 'mbbill/undotree', {
            \   'autoload' : {
            \     'commands': ['UndotreeToggle']
            \   },
            \ }
    nnoremap <F5> :UndotreeToggle<CR>

NeoBundleLazy 'osyo-manga/vim-over', {
            \   'autoload' : {
            \     'commands' : ['OverCommandLine']
            \   },
            \ }
    noremap <M-r> :OverCommandLine<cr>%s///g<Left><Left><Left>

NeoBundleLazy 'saihoooooooo/glowshi-ft.vim', {
            \   'autoload' : {
            \     'mappings' : ['<Plug>(glowshi-'],
            \   }
            \ }
    let g:glowshi_ft_no_default_key_mappings = 1
    " custom mappings
    map f <Plug>(glowshi-ft-f)
    map F <Plug>(glowshi-ft-F)
    map t <Plug>(glowshi-ft-t)
    map T <Plug>(glowshi-ft-T)
    " timeout
    let g:glowshi_ft_timeoutlen = 900
    " color highlights
    let g:glowshi_ft_selected_hl_guifg   = '#ffffff'
    let g:glowshi_ft_selected_hl_guibg   = '#c0392b'
    let g:glowshi_ft_candidates_hl_guifg = '#fffff9'
    let g:glowshi_ft_candidates_hl_guibg = '#f1c40f'

NeoBundle 'scrooloose/syntastic'
    " manual syntastic check
    nnoremap <silent> <F7>   :SyntasticCheck<CR>
    " error window will be automatically opened and closed
    let g:syntastic_auto_loc_list = 1
    " height of the location lists that syntastic opens
    let g:syntastic_loc_list_height = 5
    " automatic syntax checking
    let g:syntastic_mode_map = { 'mode': 'active',
                               \ 'active_filetypes': ['javascript', 'ruby'],
                               \ 'passive_filetypes': ['html', 'css', 'scss', 'c', 'cpp'] }

NeoBundleLazy 'scrooloose/nerdtree'
    " Make it colourful and pretty
    let NERDChristmasTree = 1
    " Size of the NERD tree
    let NERDTreeWinSize = 29
    " Disable 'bookmarks' and 'help'
    let NERDTreeMinimalUI = 1
    " Show hidden files
    let NERDTreeShowHidden = 1
    " Highlight the selected entry in the tree
    let NERDTreeHighlightCursorline = 1
    " Use a single click to fold/unfold directories
    let NERDTreeMouseMode = 2
    " Don't display these kinds of files in NERDTree
    let NERDTreeIgnore = [
        \ '\~$', '\.pyc$', '\.pyo$', '\.class$', '\.aps',
        \ '\.git', '\.hg', '\.svn', '\.sass-cache',
        \ '\.coverage$', '\.tmp$', '\.gitkeep$',
        \ '\.vcxproj', '\.bundle', '\.DS_Store$', '\tags$']

NeoBundle 'jistr/vim-nerdtree-tabs', {
        \   'depends' : 'scrooloose/nerdtree',
        \ }
    map <F3> <Plug>NERDTreeTabsToggle<CR>
    " Do not open NERDTree on startup
    let g:nerdtree_tabs_open_on_gui_startup = 0

NeoBundle 'Shougo/unite.vim'
    " Default profile
    call unite#custom#profile('default', 'context', {
        \   'direction': 'topleft',
        \   'winheight': 15,
        \   'prompt': '» ',
        \   'smartcase': 1,
        \ })

    " Custom filters
    call unite#custom#source(
        \ 'buffer,file,file_rec,file_rec/async,file_rec/git',
        \ 'matchers',
        \ ['converter_relative_word', 'matcher_fuzzy'])
    call unite#custom#source(
        \ 'buffer,file,file_rec,file_rec/async,grep',
        \ 'ignore_pattern',
        \ join([
        \   '\.git/', '\.gitkeep', '\.keep', '\.hg/', '\.o', '\.DS_Store',
        \   '_build', '_site', 'dist', '\.tmp/', 'tmp', 'log', '*.tar.gz', '*.zip',
        \   'node_modules', 'bower_components', '\.sass-cache/',
        \ ], '\|'))
    call unite#custom#source(
        \ 'neomru/file,neomru/directory',
        \ 'matchers',
        \ ['matcher_fuzzy',
        \  'matcher_hide_hidden_files'])
    call unite#filters#sorter_default#use(['sorter_rank'])

    " Reuses the last unite buffer used
    nnoremap <silent> <leader>or :<C-u>UniteResume<CR>

    " File switching, start in insert mode
    nnoremap <silent> <M-i> :<C-u>Unite
        \ -buffer-name=files -start-insert -no-split
        \ file_rec/git:--cached:--others:--exclude-standard<CR>
    nnoremap <silent> <M-p> :<C-u>Unite -buffer-name=files -start-insert file_rec/async:!<CR>
    " Buffer switching
    nnoremap <silent> gob :<C-u>Unite -buffer-name=buffers -start-insert buffer<CR>
    " Tab switching
    nnoremap <silent> got :<C-u>Unite -buffer-name=tabs -quick-match tab<CR>

    " Enabled to track yank history
    let g:unite_source_history_yank_enable = 1
    let g:unite_source_history_yank_save_clipboard = 1
    " Yank history like YankRing
    nnoremap <silent> <M-y> :<C-u>Unite -buffer-name=yank -quick-match -no-split history/yank<CR>

    " Use ag
    if executable('ag')
        " Use ag in unite grep source.
        let g:unite_source_grep_command = 'ag'
        let g:unite_source_grep_default_opts =
            \ '--line-numbers --nocolor --nogroup --hidden ' .
            \ '--ignore ''.hg'' --ignore ''.svn'' --ignore ''.git'''
        let g:unite_source_grep_recursive_opt = ''
    endif
    " Mapping on Ag
    nnoremap <silent> <M-/> :<C-u>Unite -buffer-name=grep -no-quit grep:.<CR>
    nnoremap <silent> <C-F> :<C-u>Unite -buffer-name=grep -no-quit grep:.<CR>

    " Key Mappings in Unite
    autocmd FileType unite call s:unite_my_settings()
    function! s:unite_my_settings() "{{{
        " normal mode settings
        nmap <buffer> <ESC>     <Plug>(unite_exit)
        nmap <buffer> <leader>d <Plug>(unite_exit)
        nmap <buffer> <TAB>     <Plug>(unite_select_next_line)

        " insert mode settings
        imap <buffer> '         <Plug>(unite_quick_match_default_action)
        imap <buffer> jj        <Plug>(unite_insert_leave)
        imap <buffer> <CR>      <Plug>(unite_do_default_action)
        imap <buffer> <TAB>     <Plug>(unite_select_next_line)
        imap <buffer> <S-TAB>   <Plug>(unite_select_previous_line)
        imap <buffer> <M-d>     <Plug>(unite_complete)

        " path settings
        imap <buffer> <C-y>     <Plug>(unite_narrowing_path)
        nmap <buffer> <C-y>     <Plug>(unite_narrowing_path)
        nmap <buffer> <C-j>     <Plug>(unite_toggle_auto_preview)

        " change directory
        nnoremap <silent><buffer><expr> cd   unite#do_action('lcd')
        nnoremap <silent><buffer><expr> !    unite#do_action('start')

        " replace/rename
        let unite = unite#get_current_unite()
        if unite.profile_name ==# '^search'
            nnoremap <silent><buffer><expr> r  unite#do_action('replace')
        else
            nnoremap <silent><buffer><expr> r  unite#do_action('rename')
        endif

        " toggle preview window
        nnoremap <silent><buffer><expr> p
                    \ empty(filter(range(1, winnr('$')),
                    \ 'getwinvar(v:val, "&previewwindow") != 0')) ?
                    \ unite#do_action('preview') : ":\<C-u>pclose!\<CR>"
    endfunction "}}}

NeoBundle 'Shougo/neomru.vim', {
        \   'depends': ['Shougo/unite.vim'],
        \ }
    nnoremap <silent> <M-o>
        \ :<C-u>Unite -buffer-name=mru -start-insert neomru/file<CR>
    nnoremap <silent> <M-O>
        \ :<C-u>Unite -buffer-name=mru -start-insert -default-action=lcd neomru/directory<CR>
NeoBundleLazy 'Shougo/unite-outline', {
            \   'depends': ['Shougo/unite.vim'],
            \   'autoload': {'unite_sources': 'outline'}
            \ }
    nnoremap <silent> goo :<C-u>Unite -buffer-name=outline outline<CR>
NeoBundleLazy 'Shougo/junkfile.vim', {
            \   'depends': ['Shougo/unite.vim'],
            \   'autoload': {
            \     'commands' : 'JunkfileOpen',
            \     'unite_sources' : ['junkfile', 'junkfile/new'],
            \   }
            \ }
    let g:junkfile#directory = '/Users/zhuochun/Dropbox/Mac/Note'
    nnoremap <silent> goi :<C-u>Unite -buffer-name=junkfile junkfile/new junkfile -start-insert<CR>
NeoBundleLazy 'ujihisa/unite-colorscheme', {
            \   'depends': ['Shougo/unite.vim'],
            \   'autoload': {'unite_sources': 'colorscheme'}
            \ }
    nnoremap <silent> goc :<C-u>Unite -buffer-name=colorscheme -auto-preview colorscheme<CR>
NeoBundleLazy 'osyo-manga/unite-quickfix', {
            \   'depends': ['Shougo/unite.vim'],
            \   'autoload': {'unite_sources': ['quickfix', 'location_list']}
            \ }
    nnoremap <silent> goq :<C-u>Unite -buffer-name=quickfix quickfix<CR>
NeoBundleLazy 'osyo-manga/unite-filetype', {
            \   'depends': ['Shougo/unite.vim'],
            \   'autoload': {'unite_sources': ['filetype', 'filetype/new']}
            \ }
    nnoremap <silent> gof :<C-u>Unite -buffer-name=filetypes -start-insert filetype<CR>
NeoBundleLazy 'tsukkee/unite-tag', {
            \   'depends': ['Shougo/unite.vim'],
            \   'autoload': {'unite_sources': 'tag'}
            \ }
    nnoremap <silent> got :<C-u>Unite -buffer-name=tags -start-insert tag<CR>

NeoBundleLazy 'Shougo/vimshell.vim', {
            \   'depends' : 'Shougo/vimproc.vim',
            \   'autoload' : {
            \     'commands' : [{'name' : 'VimShell',
            \                    'complete' : 'customlist,vimshell#complete'},
            \                   'VimShellExecute', 'VimShellInteractive',
            \                   'VimShellTerminal', 'VimShellPop'],
            \     'mappings' : ['<Plug>(vimshell_'],
            \   },
            \ }
    " default prompt string
    let g:vimshell_prompt = $USER." $ "
    " display current dir
    let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
    " send to interpreter
    nnoremap <M-e> V:VimShellSendString<CR>
    vnoremap <M-e> :VimShellSendString<CR>

NeoBundle 'Shougo/context_filetype.vim'

NeoBundle 'Shougo/neocomplcache.vim'
    " Use neocomplcache.
    let g:neocomplcache_enable_at_startup = 1
    " Auto completion starts at 1 char
    let g:neocomplcache_auto_completion_start_length = 1
    " Manual completion starts at 0 char
    let g:neocomplcache_manual_completion_start_length = 0
    " Minimum keyword length
    let g:neocomplcache_min_keyword_length = 3
    " Use smartcase.
    let g:neocomplcache_enable_smart_case = 1
    " Use camel case completion.
    let g:neocomplcache_enable_camel_case_completion = 1
    " Use underbar completion.
    let g:neocomplcache_enable_underbar_completion = 1

    " Define dictionary.
    let g:neocomplcache_dictionary_filetype_lists = {
        \ 'default' : '',
        \ 'vimshell' : $HOME.'/.vimshell_hist',
        \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

    " Define keyword pattern
    if !exists('g:neocomplcache_keyword_patterns')
        let g:neocomplcache_keyword_patterns = {}
    endif
    let g:neocomplcache_keyword_patterns._ = '\h\w*'

    " Enable heavy omni completion.
    if !exists('g:neocomplcache_omni_patterns')
        let g:neocomplcache_omni_patterns = {}
    endif
    let g:neocomplcache_force_overwrite_completefunc = 1
    if !exists('g:neocomplcache_force_omni_patterns')
        let g:neocomplcache_force_omni_patterns = {}
    endif


    " Plugin key-mappings.
    inoremap <expr><C-g> neocomplcache#undo_completion()
    inoremap <expr><C-l> neocomplcache#complete_common_string()

    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
        return pumvisible() ? neocomplcache#smart_close_popup() : "\<CR>"
    endfunction
    " <TAB>: completion.
    inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
    inoremap <silent><expr><TAB> pumvisible() ? "\<C-n>" :
                               \ <SID>check_back_space() ? "\<TAB>" :
                               \ neocomplcache#start_manual_complete()
        function! s:check_back_space()
            let col = col('.') - 1
            return !col || getline('.')[col - 1] =~ '\s'
        endfunction
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"
    " <BS>: close popup and delete backword char.
    inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
    " <SPACE>: Close popup.
    inoremap <expr><Space> pumvisible() ? neocomplcache#smart_close_popup()."\<Space>" : "\<Space>"

NeoBundle 'Shougo/neosnippet.vim'
    " Plugin key-mappings.
    imap <D-d> <Plug>(neosnippet_expand_or_jump)
    " Alternative
    imap <D-D> <Plug>(neosnippet_jump_or_expand)
    " Visual
    xmap <D-d> <Plug>(neosnippet_expand_target)

    " Disable default neosnippet snippets
    let g:neosnippet#disable_runtime_snippets = { '_' : 1, }
    " Enable snipmate compatibility feature.
    let g:neosnippet#enable_snipmate_compatibility = 1
    " User snipmate snippets
    let g:neosnippet#snippets_directory='D:\Programming\CG4001\vim-snippets\snippets'

    let g:snips_author = 'Wang Zhuochun'
    let g:snips_email  = 'stone1551@gmail.com'
    let g:snips_github = 'https://github.com/zhuochun'

    " Disable the neosnippet preview candidate window
    " When enabled, there can be too much visual noise
    " especially when splits are used.
    set completeopt-=preview

" neosnippet snippets
" NeoBundle 'zhuochun/vim-snippets'

" exchange words
" cx{motion}, cxx (current line), cxc (clear), X (visual exchange)
NeoBundleLazy 'tommcdo/vim-exchange', {
            \   'autoload' : {
            \     'mappings' : ['cx', 'cxx', 'X', '<Plug>(Exchange'],
            \   }
            \ }

NeoBundle 'tpope/vim-dispatch'
NeoBundle 'tpope/vim-projectionist'

NeoBundleLazy 'tpope/vim-abolish', {
            \   'autoload' : {'mappings' : ['crm', 'crc', 'crs', 'cru']}
            \ }
    " MixedCase (crm), camelCase (crc), snake_case (crs), and UPPER_CASE (cru)
NeoBundleLazy 'tpope/vim-commentary', {
            \   'autoload' : {'mappings' : ['gc', 'gcc', 'gcu']}
            \ }
    " comments: gcc (comment), gcu (uncomment) gc (visual toggle)
NeoBundleLazy 'tpope/vim-characterize', {
            \   'autoload' : {'mappings' : ['ga']}
            \ }
NeoBundleLazy 'tpope/vim-eunuch', {
            \   'autoload' : {
            \     'commands' : ['Unlink', 'Remove', 'Move', 'Rename', 'Chmod',
            \       'Mkdir', 'Find', 'Wall', 'W', 'SudoWrite', 'SudoEdit']
            \   },
            \ }
NeoBundleLazy 'tpope/vim-repeat', {
            \   'autoload' : {'mappings' : ['.']}
            \ }
NeoBundleLazy 'tpope/vim-speeddating', {
            \   'autoload' : {'insert' : 1}
            \ }
NeoBundleLazy 'tpope/vim-surround', {
            \   'autoload' : {
            \     'insert' : 1,
            \     'mappings' : ['S', 's']
            \   },
            \ }
    xmap ( S)
    xmap { S{
    xmap [ S]
    xmap " S"
    xmap ' S'
    xmap ` S`
    xmap T St
NeoBundleLazy 'tpope/vim-unimpaired', {
            \   'autoload' : {'mappings' : ['[', ']']}
            \ }
NeoBundleLazy 'tpope/vim-vinegar', {
            \   'autoload' : {'mappings' : ['-']}
            \ }

" * and # to search selection
NeoBundleLazy 'thinca/vim-visualstar', {
            \   'autoload' : {'mappings' : ['*', '#']}
            \ }
" perform text replacement in quickfix
NeoBundleLazy 'thinca/vim-qfreplace', {
            \   'autoload' : {'commands' : ['Qfreplace']}
            \ }

NeoBundleLazy 'terryma/vim-multiple-cursors', {
            \   'autoload' : {'insert' : 1}
            \ }
    " Disable default mapping: ctrl + n/p/x
    let g:multi_cursor_use_default_mapping = 0
    " New mapping
    let g:multi_cursor_next_key = '<M-,>'
    let g:multi_cursor_prev_key = '<M-.>'
    let g:multi_cursor_skip_key = '<M-m>'
    let g:multi_cursor_quit_key = '<Esc>'

NeoBundleLazy 'terryma/vim-expand-region', {
            \   'autoload' : {
            \     'mappings' : ['<Plug>(expand_region'],
            \   }
            \ }
    vmap v    <Plug>(expand_region_expand)
    vmap <BS> <Plug>(expand_region_shrink)
    " Extend the global default
    call expand_region#custom_text_objects({
          \ 'iv' :0,
          \ 'av' :0,
          \ 'iy' :0,
          \ 'a]' :1,
          \ 'ab' :1,
          \ 'aB' :1,
          \ 'ii' :0,
          \ 'ai' :0,
          \ })
    " Add to global default + for ruby
    call expand_region#custom_text_objects('ruby', {
          \ 'ir' :0,
          \ 'ar' :0,
          \ })
    " Add to global default + for html
    call expand_region#custom_text_objects('html', {
          \ 'it' :1,
          \ 'at' :1,
          \ })

NeoBundleLazy 'tyru/open-browser.vim', {
            \   'autoload' : {
            \     'commands' : ['OpenBrowser', 'OpenBrowserSearch',
            \                   'OpenBrowserSmartSearch'],
            \     'mappings' : '<Plug>(openbrowser-',
            \   }
            \ }
    nmap gx <Plug>(openbrowser-smart-search)
    vmap gx <Plug>(openbrowser-smart-search)

NeoBundleLazy 'vim-scripts/DrawIt', {
            \   'autoload' : {
            \     'commands' : ['DIstart', 'DIstop', 'DrawIt'],
            \   }
            \ }

NeoBundleLazy 'vim-scripts/ZoomWin', {
            \   'autoload' : {
            \     'commands' : ['ZoomWin'],
            \   }
            \ }

NeoBundle 'Yggdroot/indentLine'
    let g:indentLine_char = '┆'
    let g:indentLine_fileTypeExclude = ['markdown', 'text']

" text objects {{{
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-textobj-line'               " al | il
NeoBundle 'kana/vim-textobj-syntax'             " ay | iy
NeoBundle 'kana/vim-textobj-indent'             " ai | ii
NeoBundle 'kana/vim-textobj-lastpat'            " a/ | i/
NeoBundle 'coderifous/textobj-word-column.vim'  " ac | ic
NeoBundle 'Julian/vim-textobj-variable-segment' " av | iv
NeoBundle 'nelstrom/vim-textobj-rubyblock'      " ar | ir
" }}}

" writings {{{
NeoBundleLazy 'junegunn/goyo.vim', {
            \   'autoload' : {
            \     'commands' : ['Goyo']
            \   },
            \ }
    nnoremap <silent> <F11> :Goyo<cr>

NeoBundleLazy 'junegunn/limelight.vim', {
            \   'autoload' : {
            \     'commands' : ['Limelight', 'Limelight!', 'Limelight!!']
            \   },
            \ }
    autocmd User GoyoEnter Limelight
    autocmd User GoyoLeave Limelight!
" }}}

" languages {{{
" HTML
NeoBundle 'othree/html5.vim'
NeoBundle 'gregsexton/MatchTag'
NeoBundle 'mattn/emmet-vim'
    " enable emment functions in insert mode
    let g:user_emmet_mode='i'
    " <M-y> to expand input in insert mode
    let g:user_emmet_expandabbr_key = '<M-y>'

" Template Engines
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'nono/vim-handlebars'
NeoBundle 'slim-template/vim-slim'

" CSS
NeoBundle 'ap/vim-css-color'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'groenewege/vim-less'
NeoBundle 'cakebaker/scss-syntax.vim'

" JavaScript
NeoBundle 'elzr/vim-json'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'moll/vim-node'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'othree/javascript-libraries-syntax.vim'
    let g:used_javascript_libs =
        \ 'jquery,underscore,backbone,angularjs,angularui,jasmine'
NeoBundle 'marijnh/tern_for_vim', {
        \   'build': {
        \     'windows': 'npm install',
        \     'cygwin': 'npm install',
        \     'mac': 'npm install',
        \     'unix': 'npm install',
        \   },
        \ }
    let g:tern_show_argument_hints = 'on_hold'
    let g:tern_show_signature_in_pum = 1

" Ruby/Rails
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'tpope/vim-rbenv'
NeoBundle 'tpope/vim-rake'
NeoBundle 'tpope/vim-bundler'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-endwise'
NeoBundleLazy 'Keithbsmiley/rspec.vim', {
            \   'autoload' : {'filetypes' : 'ruby'}
            \ }
NeoBundleLazy 'skalnik/vim-vroom', {
            \   'autoload' : {'filetypes' : 'ruby'}
            \ }
    let g:vroom_use_dispatch = 1
NeoBundleLazy 'duwanis/tomdoc.vim', {
            \   'autoload' : {'filetypes' : 'ruby'}
            \ }
NeoBundleLazy 'ecomba/vim-ruby-refactoring', {
            \   'autoload' : {'filetypes' : 'ruby'}
            \ }

" C/Cpp
NeoBundle 'vim-jp/cpp-vim'
NeoBundle 'octol/vim-cpp-enhanced-highlight'

" Markdown
NeoBundle 'gabrielelana/vim-markdown'
    let g:markdown_enable_mappings = 0
NeoBundleLazy 'farseer90718/vim-regionsyntax', {
            \   'autoload' : { 'filetypes' : ['markdown', 'text'] }
            \ }
NeoBundleLazy 'kannokanno/previm', {
            \   'depends': ['tyru/open-browser.vim'],
            \   'autoload': {'commands': 'PrevimOpen'}
            \ }

" Ansible
NeoBundleLazy 'chase/vim-ansible-yaml'

" Git
NeoBundle 'tpope/vim-fugitive'
NeoBundleLazy 'gregsexton/gitv', {
            \   'depends': ['tpope/vim-fugitive'],
            \   'autoload': {'commands': 'Gitv'}
            \ }
" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM Styles {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" colorschemes {{{
NeoBundle 'chriskempson/base16-vim'
NeoBundle 'farseer90718/flattr.vim'
NeoBundle 'morhetz/gruvbox'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'sjl/badwolf'
NeoBundle 'w0ng/vim-hybrid'
" }}}

" colorscheme background
set background=dark
" colorschemes
colorscheme jellybeans
" vim fonts
set guifont=Inconsolata-dz\ for\ Powerline:h14:cDEFAULT
" highlight boundary column
set colorcolumn=79
" set window size
set lines=36 columns=96

" conceal special chars
if has('conceal')
    set conceallevel=2 concealcursor=i
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM Settings {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" , is much easier than \
" \ is used in EasyMotion
let g:mapleader = ","
let mapleader = ","
" ; is easier than :
noremap ; :

" Syntax highlighting on
syntax on

" formatoptions
" o - insert command leader in o or O
" t - autowrap text
" c - autowrap comments
" r - insert comment leader
" mM - useful for Chinese characters, q - gq
" j - remove comment leader when joining lines
autocmd FileType * setlocal formatoptions-=o
autocmd FileType * setlocal formatoptions+=tcrqmMj

" status line
set laststatus=2

" basic settings
set shortmess=atI                   " no welcome screen in gVim
set mouse=a                         " enable mouse
set gcr=a:blinkon0                  " disable the blinking cursor
set ttimeout
set timeoutlen=42                   " quick timeouts for command combinations
set history=999                     " keep 999 lines of command line history
set ruler                           " show the cursor position all the time
set number                          " display current line number
set relativenumber                  " show line number relatively
set lazyredraw                      " stops Vim from redrawing during complex operations
set hidden                          " change buffer even if it is not saved
set lbr                             " dont break line within a word
set showcmd                         " display incomplete commands
set showmode                        " show current mode
set nocursorline                    " highlight the current line (disabled)
set magic                           " set magic on, for regular expressions
set winaltkeys=no                   " set ALT not map to toolbar
set autoread                        " autoread when a file is changed from the outside
set shortmess+=filmnrxoOtT          " abbrev. of messages (avoids 'hit enter')
set viewoptions=folds,options,cursor,unix,slash " better Unix / Windows compatibility
set virtualedit=onemore             " allow for cursor beyond last character

set wildmenu                        " show autocomplete menus
set wildignore+=*.dll,*.o,*.obj,*.bak,*.exe,*.zip
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.bmp
set wildignore+=*~,*.sw?,*.DS_Store
set wildignore+=*$py.class,*.class,*.gem,*.pyc,*.aps,*.vcxproj.*
set wildignore+=.git,.gitkeep,.hg,.svn,.tmp,.coverage,.sass-cache
set wildignore+=log/**,tmp/**,node_modules/**,build/**,_site/**,dist/**
set wildignore+=vendor/bundle/**,vendor/cache/**,vendor/gems/**

set complete-=i
set backspace=indent,eol,start
set whichwrap+=<,>,b,s

set scrolljump=9                    " lines to scroll when cursor leaves screen
set scrolloff=9                     " minimum lines to keep above and below cursor

" related to <TAB> indents {{{
set shiftwidth=4
set tabstop=4
set shiftround                      " Round indent to multiple of 'shiftwidth'
set expandtab
set smarttab
" }}}

" related to indents {{{
set autoindent                      " always set autoindenting on
set smartindent
set cindent                         " indent for c/c++
" }}}

" word boundary to be a little bigger than the default {{{
set iskeyword-=_,-
set iskeyword+=$,@,%,#,`,!,?
" }}}

" Related to Search {{{
set ignorecase                      " Ignore case when searching
set smartcase
set hlsearch                        " Highlight search things
set incsearch                       " Highlight next match on searching
set showmatch                       " Show matching bracets
set matchtime=1                     " Time to show the matching paren
" }}}

" folding settings {{{
set foldmethod=indent               " fold based on indent
set foldnestmax=99                  " deepest fold levels
set nofoldenable                    " dont fold by default
" }}}

" list chars {{
set list
set listchars=tab:»»,trail:⌴,extends:❯,precedes:❮,nbsp:_
set showbreak=↪
" }}

" no sound on errors {{{
set noerrorbells
set visualbell t_vb=
set tm=500

" backups and undos {{{
set nobackup
set nowb
set noswapfile

" Persistent undo
if has('persistent_undo')
    set undofile         " So is persistent undo ...

    if has("unix")
        set undodir=/tmp/,~/tmp,~/Temp
    else
        set undodir=$HOME/temp/
    endif

    set undolevels=1000  " Maximum number of changes that can be undone
    set undoreload=1000 " Maximum number lines to save for undo on a buffer reload
endif
" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Mappings and Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Function keys {{{
    " F1  Help
    " F2  Insert date and time
    inoremap <F2> <C-R>=strftime("%d/%b/%Y %I:%M %p")<CR>
    " F3  Toggle Tagbar
    " F4  Open Alternative File (c, cpp, rails)
    " F5  Open Alternative File Split (c, cpp, rails)
    " F6  Paste mode
    set pastetoggle=<F6>
    " F7  Manual syntastic check
    " F8  System
    " F9
    " F10 Toggle NERDTree
    " F11
    " F12 Toggle Menu and Toolbar {{{
    set go=
    nnoremap <expr> <F12> <SID>toggle_menubar()
    function! s:toggle_menubar()
        if &guioptions =~# 'T'
            set guioptions-=T
            set guioptions-=m
        else
            set guioptions+=T
            set guioptions+=m
        endif
    endfunction
" }}}

" use <Tab> and <S-Tab> to indent
" in Normal, Visual, Select Mode
nnoremap <tab> v>
nnoremap <s-tab> v<
xnoremap <tab> >gv
xnoremap <s-tab> <gv

" Move a line of text using <up><down>
" http://vim.wikia.com/wiki/Moving_lines_up_or_down
nnoremap <up> :m .-2<CR>==
nnoremap <down> :m .+1<CR>==
vnoremap <up> :m '<-2<CR>gv=gv
vnoremap <down> :m '>+1<CR>gv=gv

" Execute countable 'n.'.
" EXAMPLE: 3@n
let @n='n.'

" normal char key mappings {{{
    " Q: to repeat last recorded macro
    nnoremap Q @@
    " Y: Quick yanking to the end of the line
    nnoremap Y y$
    " H: Go to beginning of line.
    "    Repeated invocation goes to previous line
    nnoremap <expr> H getpos('.')[2] == 1 ? 'k' : '0'
    " L: Go to end of line.
    "    Repeated invocation goes to next line
    nnoremap <expr> L <SID>end_of_line()
    function! s:end_of_line()
      let l = len(getline('.'))
      if (l == 0 || l == getpos('.')[2])
        return 'jg_'
      else
        return 'g_'
    endfunction
    " Change folder mappings
    " zo: Open all folds under the cursor recursively
    nnoremap zo zO
    " zO: Open all folds
    nnoremap zO zR
    " zC: Close all folds
    nnoremap zC zM
    " Reselect visual block after indent/outdent
    vnoremap < <gv
    vnoremap > >gv
    " Make space work in normal mode
    nnoremap <space> i<space><ESC>
    " Make enter work in normal mode
    nnoremap <CR> i<CR><ESC>
" }}}

" normal char key mappings {{{
    " <`> Move to mark (linewise)
    " <~> Up/Downcase
    " <0-9> 0-9
    " <!>
    " <@> Register
    " <#> Search word under cursor backwards
    " <$> To the end of the line
    " <%> Move between open/close tags
    " <^> To the first non-blank character of the line.
    " <&> Synonym for `:s` (repeat last substitute)
    " <*> Search word under cursor forwards
    " <(> Sentences backward
    " <)> Sentences forward
    " <_> Horizonal split
    " <->
    " <==> Format current line
    " <+> Switch
    " <S-Delete> Insert Mode Delete word
    " <q*> Record Macro
    " <w> Word forwards
    " <W> Word forwards (CamelCase)
    " <e> Forwards to the end of word
    " <E> Forwards to the end of word
    " <r> Replace char
    " <R> Continous replace
    " <t> find to left (exclusive)
    " <T> find to left (inclusive)
    " <y> Yank into register
    " <u> Undo
    " <i> Insert
    " <o> Open new line below
    " <O> Open new line above
    " <p> Paste Yank, keep cursor position when pasting
    nnoremap p p`[
    nnoremap P P`[
    " <{> Paragraphs backward
    " <}> Paragraphs forward
    " <\> Easymotion
    " <|> Vertical split
    " <a> Append insert
    " <s> Substitue, dont update default register
    vnoremap s "_s
    " <d> Delete
    " <f> find to right (exclusive)
    " <F> find to right (inclusive)
    " <g> Go
    " <h> Left
    " <j> Down
    " <J> Join Sentences
    " <k> Up
    " <l> Right
    " <;> Repeat last find f,t,F,T
    " <:> Comamnd Input
    " <''> Move to previous context mark, alias to <m'>
    " <'*> Move to {a-zA-Z} mark
    " <CR> Open new line at cursor
    " <z*> Folds
    " <x> Delete char cursor
    " <c> Change, dont update default register
    nnoremap c "_c
    " <v> Visual
    " <b> Words Backwards
    " <B> Words Backwards (CamelCase)
    " <n> Next search
    " <N> Previous search
    " <m*> Set mark {a-zA-Z}
    " <,> Repeat last find f,t,F,T in opposite direction
    " <.> Repeat last command
" }}}


" <leader>* key mappings {{{
    " <leader>1
    " <leader>2
    " <leader>3
    " <leader>4
    " <leader>5
    " <leader>6
    " <leader>7
    " <leader>8
    " <leader>9
    " <leader>0
    " <leader>-
    " <leader>= align with =
    " <leader>q quick quit without save
    nnoremap <leader>q :q!<CR>
    " <leader>w
    nnoremap <leader>w :call ToggleWrap()<CR>
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
    " <leader>y
    " <leader>u
    " <leader>i
    " <leader>o
    " <leader>p
    " <leader>a
    " <leader>s spell checkings
        nnoremap <leader>ss :setlocal spell!<CR>
        nnoremap <leader>sn ]s
        nnoremap <leader>sp [s
        nnoremap <leader>sa zg
        nnoremap <leader>s? z=
    " <leader>S clear trailing whitespace
    nnoremap <leader>S :%s/\s\+$//ge<cr>:nohl<cr>
    " <leader>d close buffer with leave window intact
    nnoremap <leader>d :BD<CR>
    " <leader>D close buffer
    nnoremap <leader>D :bd<CR>
    " <leader>f easier code formatting
    nnoremap <leader>f gg=G''
    " <leader>F easier code formatting
    nnoremap <leader>F gg=G''
    " <leader>g
    " <leader>h
    " <leader>j
    " <leader>k
    " <leader>l
    " <leader>L reduce a sequence of blank lines into a single line
    nnoremap <leader>L GoZ<Esc>:g/^[ <Tab>]*$/.,/[^ <Tab>]/-j<CR>Gdd
    " <leader>z
    " <leader>x
    " <leader>c
    " <leader>v select the just pasted text
    nnoremap <leader>v V`]
    " <leader>b
    " <leader>n
    " <leader>m
    " <leader>M remove the ^M - when the encodings gets messed up
    nnoremap <leader>M mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
    nnoremap \m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
    " <leader><space> close search highlight
    nnoremap <silent> <leader><space> :noh<cr>
" }}}

" Tabs and Windows mappings {{{
    " Tab Mappings
    nnoremap <M-1> 1gt
    nnoremap <M-2> 2gt
    nnoremap <M-3> 3gt
    nnoremap <M-4> 4gt
    nnoremap <M-5> 5gt
    nnoremap <M-6> 6gt
    nnoremap <M-7> 7gt
    nnoremap <M-8> 8gt
    nnoremap <M-9> 9gt
    nnoremap <M-(> :tabprevious<cr>
    nnoremap <M-)> :tabnext<cr>
    nnoremap <M-t> :tab split<CR>
    nnoremap <M-T> :tabnew<CR>
    nnoremap <M-w> :tabclose<CR>

    " Smart way to move btw. windows
    nmap <C-j> <C-W>j
    nmap <C-k> <C-W>k
    nmap <C-h> <C-W>h
    nmap <C-l> <C-W>l

    " Use arrows to change the splited windows
    nmap <right> <C-W>L
    nmap <left> <C-W>H
    nmap <C-up> <C-W>K
    nmap <C-down> <C-W>J
    nmap <M-up> <C-W>K
    nmap <M-down> <C-W>J

    " _ : Quick horizontal splits
    nnoremap _ :sp<cr>
    " | : Quick vertical splits
    nnoremap <bar> :vsp<cr>

    " Always splits to the right and below
    set splitright
    set splitbelow
" }}}

" <Ctrl-*> key mappings {{{
    " <C-1>
    " <C-2>
    " <C-3>
    " <C-4>
    " <C-5>
    " <C-6>
    " <C-7>
    " <C-8>
    " <C-9>
    " <C-0>
    " <C-->
    " <C-=>
    " <C-q> Multiple select
    " <C-w>
    " <C-e>
    " <C-r>
    " <C-t>
    " <C-y> Emmet Expand
    " <C-u>
    " <C-i>
    " <C-o>
    " <C-p>
    " <C-a>
    " <C-s>
    " <C-d>
    " <C-f>
    " <C-g>
    " <C-h> (n) move to left window
    " <C-j> (n) move to down window
    " <C-k> (n) move to up window
    " <C-l> (n) move right window
    " <C-;>
    " <C-'>
    " <C-CR> Like in Visual Studio
    inoremap <C-CR> <ESC>o
    " <S-CR> Like in Visual Studio
    inoremap <S-CR> <ESC>O
    " <C-z>
    " <C-x>
    " <C-c>
    " <C-v>
    " <C-b>
    " <C-n>
    " <C-m>
    " <C-,>
    " <C-.>
" }}}

" I/C mode Emacs key mappings {{{
    " <C-j>: Move cursor down
    inoremap <expr> <C-j> pumvisible() ? "\<C-e>\<Down>" : "\<Down>"
    " <C-k>: Move cursor up
    inoremap <expr> <C-k> pumvisible() ? "\<C-e>\<Up>" : "\<Up>"
    " <C-h>: Move word left
    inoremap <C-h> <S-Left>
    " <C-l>: Move word right
    inoremap <C-l> <S-Right>
    " <C-b>: Move move cursor left
    inoremap <C-b> <Left>
    " <C-f>: Move move cursor right
    inoremap <C-f> <Right>
    " <C-a>: Move to head
    inoremap <C-a> <C-O>^
    " <C-e>: Move to eND
    inoremap <C-e> <End>
    " <C-d>: Delete to end of line
    inoremap <C-d> <C-O>D
    " <C-BS>: Delete to word backward
    inoremap <C-BS> <C-W>
    " <M-BS>: Delete word under cursor
    inoremap <M-BS> <S-Right><C-W>

    " <C-a>: command mode home
    cnoremap <C-a> <Home>
    " <C-e>: command mode end
    cnoremap <C-e> <End>
    " <C-b>: command mode cursor left
    cnoremap <C-b> <Left>
    " <C-f>: command mode cursor right
    cnoremap <C-f> <Right>
    " <C-n>: next history
    cnoremap <C-n> <Down>
    " <C-p>: previous history
    cnoremap <C-p> <Up>
    " <C-k>: delete to end
    cnoremap <C-k> <C-\>e getcmdpos() == 1 ? '' : getcmdline()[:getcmdpos()-2]<CR>
    " <C-y>: paste
    cnoremap <C-y> <C-r>*
" }}}

" <M-*> key mappings {{{
    " <M-q>
    " <M-w>
    " <M-e>
    " <M-r>
    " <M-t> New tab
    " <M-y> (Normal) Yank History
    " <M-y> (Insert) Emmet expand, alias to <C-y>,
    " <M-u> Unite files
    " <M-i> Unite buffers
    " <M-o> Unite MRU
    " <M-p> Yankstack old
    " <M-P> Yankstack new
    " <M-[>
    " <M-]>
    " <M-a>
    " <M-s> Unite Search
    " <M-d> Snippet autocomplete
    " <M-f>
    " <M-g>
    " <M-h>
    " <M-j> Move selected line down
    " <M-k> Move selected line up
    " <M-l>
    " <M-;>
    " <M-'>
    " <M-z>
    " <M-x>
    " <M-c>
    " <M-v>
    " <M-b>
    " <M-n>
    " <M-m>
    " <M-m> vim-multiple-cursors: skip
    " <M-,> vim-multiple-cursors: next
    " <M-.> vim-multiple-cursors: prev
    " <M-/> NERDComment
" }}}

" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Additional Settings {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Source the vimrc file after saving it
autocmd! bufwritepost _vimrc source $MYVIMRC

" Quick edit _vimrc and code_complete template
nnoremap <leader>0 :tabe $MYVIMRC<CR>
nnoremap <leader>) :e $MYVIMRC<CR>

" Remap 0 to first non-blank character
nnoremap 0 ^

" Fix broken default regex
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v

" Snippets {{{
au FileType neosnippet,snippet set noexpandtab
" }}}

" C/CPP Mappings {{{
au FileType cpp,c,cc,h,hpp :call s:CppDef()
function! s:CppDef()
    " Surround * to /*
    let b:surround_42 = "/* \r */"
    xmap 8 S*

    " Correct typos
    iab uis        usi
    iab cuot       cout
    iab itn        int
    iab Bool       bool
    iab boolean    bool
    iab Static     static
    iab Virtual    virtual
    iab True       true
    iab False      false
    iab String     string
    iab prinft     printf
    iab pritnt     printf
    iab pirntf     printf
    iab boll       bool
    iab end;       endl;
    iab color      colour
    iab null       NULL
endfunction
" }}}

" Ruby Mappings {{{
au FileType ruby,eruby,rdoc :call s:RubyDef()
function! s:RubyDef()
    setlocal shiftwidth=2
    setlocal tabstop=2

    " Vimshell shorter command
    command! -buffer Pry :execute "VimShellInteractive --split='split <bar> resize 19' pry"
    command! -buffer Irb :execute "VimShellInteractive --split='split <bar> resize 19' irb"
    command! -buffer Run :execute "VimShellSendString"

    " Surround % to %
    let b:surround_37 = "<% \r %>"
    xmap % S%
    " Surround = to %=
    let b:surround_61 = "<%= \r %>"
    xmap _ S=
    " Surround # to #{}
    let b:surround_35 = "#{\r}"
    xmap # S#

    " Correct typos
    iab elseif      elsif
    iab ~=         =~
endfunction
" }}}

" CoffeeScript Mappings {{{
au FileType coffee :call s:CoffeeDef()
function! s:CoffeeDef()
    setlocal shiftwidth=2
    setlocal tabstop=2

    " Vimshell shorter command
    command! -buffer Node   :execute "VimShellInteractive --split='split <bar> resize 19' node"
    command! -buffer Coffee :execute "VimShellInteractive --split='split <bar> resize 19' coffee"
    command! -buffer Run    :execute "VimShellSendString"
endfunction
" }}}

" Html/Xml Mappings {{{
au FileType xhtml,html,xml,yaml :call s:WebDef()
function! s:WebDef()
    setlocal shiftwidth=2
    setlocal tabstop=2

    " Surround % to {{
    let b:surround_37 = "{{ \r }}"
    xmap % S%
    " Surround = to {{=
    let b:surround_61 = "{{= \r }}"
    xmap _ S=
    " Surround * to <!--
    let b:surround_42 = "<!-- \r -->"
    xmap 8 S*
    " Delete surround tag
    nmap <Del> dst

    " Special characters
    iab ->> →
    iab <<- ←
    iab >>  »
    iab ^^  ↑
    iab VV  ↓
endfunction
" }}}

" Markdown Mappings {{{
au FileType markdown,text :call s:MarkdownDef()
function! s:MarkdownDef()
    setlocal shiftwidth=2
    setlocal tabstop=2
    setlocal spell

    " Surround _ to _
    let b:surround_95 = "_\r_"
    xmap _ S_
    " Surround * to **
    let b:surround_42 = "**\r**"
    xmap 8 S*
    " Surround - to ~~
    let b:surround_45 = "~~\r~~"
    xmap - S-
    " Surround ~ to ```
    let b:surround_126 = "```\r```"
    xmap 1 S~

    " Insert date and time in Jekyll
    inoremap <F2> <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>
    " Hard wrap current paragraph
    nnoremap <buffer> <D-w> gwip
    " Unwrap current paragraph
    nnoremap <buffer> <D-S-w> vipJ
    " Format all paragraphs in buffer
    nnoremap <buffer> <D-e> ggVGgq
    " Unformat all paragraphs in buffer
    nnoremap <buffer> <D-S-e> :%norm vipJ<cr>
    " Insert inline link
    vmap <buffer> <D-k> [f]a(
    " Insert inline image
    vmap <buffer> <D-i> [i!<ESC>f]a(

    " Mac Dictionary App
    command! -nargs=0 DictCWord
        \ call system('open '.shellescape('dict://'.shellescape(expand('<cword>'))))
    command! -nargs=0 DictClose
        \ call system("osascript -e 'tell application \"Dictionary\" to quit'")
    command! -nargs=0 DictFocus
        \ call system("osascript -e 'tell application \"Dictionary\" to activate'")

    " Wrap text
    nnoremap <buffer> j gj
    nnoremap <buffer> k gk
    nnoremap <buffer> 0 g0
    nnoremap <buffer> $ g$
    nnoremap <buffer> ^ g^
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
iab regester   register
iab execuse    excuse
iab ture       true
iab ?8         /*
iab /8         /*
iab /*         /*
" }}}

" change working directory
cab cwd        cd %:p:h
" change local working directory
cab clwd       lcd %:p:h
" jekyll post/note
command! Blog  :execute "e D:\Programming\gitHub\zhuochun.github.io"
command! Draft :execute "e D:\Programming\gitHub\zhuochun.github.io\_drafts\new-draft.markdown"

" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Installation check.
NeoBundleCheck
