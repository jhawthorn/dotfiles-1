" My vimrc uses folds
"
" zR    open all folds
" zM    close all folds
" za    toggle fold at cursor position
" zj    move down to start of next fold
" zk    move up to end of previous fold

" My vimrc command and mapping quick reference                 {{{1
" -----------------------------------------------------------------
"
" The mapleader has been switched from '\' to ',' anytime you see
" <leader> that is what this refers to.
"
" Change Option mnemonic                                       {{{2
" -----------------------------------------------------------------
"    coa             -- Starts an ack search in the CWD
"    coc             -- Switch between light and dark colors
"    coe             -- Show current :Errors
"    coH             -- Clear the current search highlight
"    coh             -- Toggles the highlight search
"    coi             -- Toggles invisible characters
"    col             -- Clears line length highlight in Python
"    con             -- Toggles the line numbers
"    conn            -- Toggles relative line numbers
"    coq             -- Toggle the quickfix window
"    cos             -- Toggle spell checking
"    cov             -- Edit the current user's vimrc
"    cow             -- Toggle line wrapping
"    cox             -- Toggles NERDTree drawer
"
" Clean Up mnemonic                                            {{{2
" -----------------------------------------------------------------
"    cuw             -- Removes trailing whitespace characters
"    cut             -- Run tidy xml on the current file
"    cuv             -- Sort a buildout versions.cfg file
"
" File Type mnemonic                                           {{{2
" -----------------------------------------------------------------
"    ftj             -- Change current filetype to Javascript
"    ftm             -- Change current filetype to Markdown
"    ftp             -- Change current filetype to Python
"    ftr             -- Change current filetype to reStructuredText
"    ftv             -- Change current filetype to Vim
"    ftw             -- Change current filetype to Wiki
"
" Fuzzy Finder mnemonic                                        {{{2
" -----------------------------------------------------------------
"    ff              -- Fuzzy file mode (CtrlP)
"    fft             -- Fuzzy tag mode (CtrlP)
"    ffr             -- Fuzzy MRU mode (CtrlP)
"    ffe             -- Fuzzy buffer mode (CtrlP)
"    tt              -- Opens up the taglist
"
" Tell Me mnemonic                                             {{{2
" -----------------------------------------------------------------
"    tmf             -- Shows the current file in the NERDTree. This
"                       is the TextMate equivalent of ctrl+cmd+r
"    tmi             -- Toggle indent guides
"    tmy             -- Show the yankring
"    tmz             -- Push default register to remote server's
"                       pbcopy. Basically copy from VM -> OS X.
"    tmb             -- Shortcut for getting to NERDTree bookmarks
"    tm1             -- Set a highlight for the current word (1)
"    tm2             -- Set a highlight for the current word (2)
"    tm3             -- Set a highlight for the current word (3)
"    tmr             -- Show me reST preview
"    tmrk            -- Stop reST preview
"    tmm             -- Show me Markdown preview
"    tmmk            -- Stop Markdown preview
"    tms             -- Save the file
"
" Window Management                                            {{{2
" -----------------------------------------------------------------
"    <C-W>-          -- Horizontal split
"    <C-W>|          -- Vertical split
"    <C-W><C-E>      -- Cycle through windows
"    <C-H>           -- Move left to window
"    <C-J>           -- Move up to window
"    <C-K>           -- Move down to window
"    <C-L>           -- Move right to window
"    <C-W><C-H>      -- Move left to next tab
"    <C-W><C-L>      -- Move right to next tab
"    <C-W><C-N>      -- Create a new tab
"    <C-W><C-I>      -- Edit current file in a new tab
"    <C-W><C-X>      -- Close the current tab
"    +               -- Make the current window taller
"    -               -- Make the current window shorter
"
" Other random stuff                                           {{{2
" -----------------------------------------------------------------
"    cqp             -- Previous quickfix change
"    cqn             -- Next quickfix change
"    clp             -- Previous location list change
"    cln             -- Next location list change
"    Y               -- Yank to the end of the line, no newline
"    YY              -- Yank the current line, no newline
"    funi            -- Find the next non-ascii character (funny)
"    jj              -- Alternative to <ESC>
"    jk              -- Alternative to <ESC>
"    ctrl + tab      -- cycle through buffers
"    <leader>Enter   -- Split line at current cursor in normal mode
"    <F2>            -- Toggle smart indent on paste
"
" Command line mappings                                        {{{2
" -----------------------------------------------------------------
"
"    <C-a>           -- Beginning of the line
"    <C-c>           -- End of the line
"
" Custom Commands                                              {{{2
" -----------------------------------------------------------------
"
" I have set up some custom commands that might be of interest
"
"    MarkdownToHTML  -- Converts the current buffer into HTML and
"                       places it in a scratch buffer.
"    MarkdownToHTMLCopy -- Same as previous, but copies to clipboard
"    Shell           -- Runs a shell command and places it in the
"                       scratch buffer
"    TidyXML         -- Runs tidy in XML mode on the current buffer
"    TabStyle        -- Set the tab style and number, :TabStyle space 4
"    W               -- Save the following file using sudo to avoid
"                       the [readonly] flag.

" General setting                                              {{{1
" -----------------------------------------------------------------

" On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
" across (heterogeneous) systems easier.
if has('win32') || has('win64')
  set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

" FreeBSD security advisory for this one...
set nomodeline

" This setting prevents vim from emulating the original vi's
" bugs and limitations.
set nocompatible

" Set up pathogen
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" set the mapleader key
let mapleader = ","
let g:mapleader = ","

" Set a shorter timeout length to make jk and jj easier to use
set timeoutlen=350

" set the default encoding
set enc=utf-8

" only increment numbers and letters
set nrformats=""

" set up jj as mode switch
map! jj <ESC>
map! jk <ESC>

" Save shortcut
nnoremap tms :w<CR>

" Set the shell to sh, zsh and vim don't seem to play nice
set shell=zsh

" hide the backup and swap files
set backupdir=~/.backup/vim,.,/tmp
set directory=~/.backup/vim/swap,.,/tmp
set backupskip=/tmp/*,/private/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*

if v:version >= 703
    " keep a persistent backup file
    set undofile
    set undodir=~/.backup/vim/undo,~/tmp,/tmp
endif

" have fifty lines of command-line (etc) history:
set history=10000

if has('mouse')
    " have the mouse enabled all the time
    set mouse=a
    " make a menu popup on right click
    set mousemodel=popup
endif

" allow for switching buffers when a file has changes
set hidden

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" The first setting tells vim to use "autoindent" (that is, use the current
" line's indent level to set the indent level of new lines). The second makes
" vim attempt to intelligently guess the indent level of any new line based on
" the previous line.
set autoindent
set smartindent

" Only one space after periods when formatting strings
set nojoinspaces

" Allow command line editing like emacs
cnoremap <C-A> <Home>
cnoremap <C-E> <End>

" open up my vimrc in a tab for modifications
map cov :tabedit $MYVIMRC<CR>

" Highlight the word under the cursor
" Taken from https://bitbucket.org/sjl/dotfiles/src/tip/vim/.vimrc
nnoremap <silent> tm1 :execute 'match InterestingWord1 /\<<c-r><c-w>\>/'<cr>
nnoremap <silent> tm2 :execute '2match InterestingWord2 /\<<c-r><c-w>\>/'<cr>
nnoremap <silent> tm3 :execute '3match InterestingWord3 /\<<c-r><c-w>\>/'<cr>

" shortcut to cycle through quickfix list
nnoremap cqn :cnext<cr>
nnoremap cqp :cprevious<cr>

" shortcut to cycle through location list
nnoremap cln :lnext<cr>
nnoremap clp :lprevious<cr>

" Use sane regexes.
nnoremap / /\v
vnoremap / /\v

" Easy filetype switching
nnoremap ftm :set ft=markdown<CR>
nnoremap ftp :set ft=python<CR>
nnoremap ftw :set ft=wiki<CR>
nnoremap ftr :set ft=rst<CR>
nnoremap ftv :set ft=vim<CR>
nnoremap ftj :set ft=javascript<CR>

" Visual settings                                              {{{1
" -----------------------------------------------------------------

" tell the bell to go beep itself!
set visualbell t_vb=

" set the title of the window
set title
set titlestring=%f%(\ [%M]%)

" Ignore those annoying "hit enter to coninue" messages
" XXX there has to be a better way to accomplish this
set cmdheight=2

" Enhanced command menu ctrl + d to expand directories
set wildmenu
" comand <Tab> completion, list matches, then longest common part, then all.
set wildmode=list:longest,full
set wildignore+=*.pyc,*.pyo,CVS,.svn,.git,*.mo,.DS_Store,*.pt.cache,*.Python,*.o,*.lo,*.la,*~,.AppleDouble,*/blobstorage/*,*/Paste*-*.egg/*

map <silent> cos :set spell!<CR>
set nospell

" This setting will cause the cursor to very briefly jump to a
" brace/parenthese/bracket's "match" whenever you type a closing or
" opening brace/parenthese/bracket.
set showmatch

" Display an incomplete command in the lower right corner of the Vim window
set showcmd

" Set a margin of lines when scrolling
set scrolloff=4
" lines to scroll when cursor leaves screen
set scrolljump=0

" set a custom status line similar to that of ":set ruler"
set statusline=\ \ \ \ \ line:%l\ column:%c\ \ \ %M%Y%r%=%-14.(%t%)\ %p%%
" show the statusline in all windows
set laststatus=2

" set all window splits equal
set equalalways

" highlight the cursor line
set cursorline

" turn on line numbers, aww yeah
set number
" shortcut to turn off line numbers
map <silent> con :set number!<CR>
" toggle relative number
map <silent> conn :set relativenumber!<CR>

" don't redraw during macros
set lazyredraw

" Set linebreak so words don't get split
set linebreak

" Scroll in smaller increments when going horizontal
set sidescroll=5

" Set the characters showing horizontal scrolling
set listchars+=precedes:←,extends:→

" toggle line wrapping on/off
map <silent> cow :set wrap!<CR>

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *  if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" always jump to the top of commit messages
" NOTE: mercurial and bazaar use temporary files, so this isn't necessary
au BufReadPost svn-commit*.tmp exe "normal! gg"
au BufReadPost COMMIT_EDITMSG* exe "normal! gg"

" Pasting                                                      {{{1
" -----------------------------------------------------------------

" turn off smart indentation when pasting
set pastetoggle=<F2>

" Send register back to my computer's clipboard
map <silent> tmz :call PushRegister(@")<CR>

" Searching                                                    {{{1
" -----------------------------------------------------------------

" find as you type
set incsearch
" highlight the terms
set hlsearch
" make searches case-insensitive
set ignorecase
" unless they contain upper-case letters
set smartcase
" a toggle for search highlight
map <silent> coh :set hlsearch!<CR>

" Shortcut to clear out the search pattern (and thus turn off the highlighting)
" from http://stackoverflow.com/questions/657447/vim-clear-last-search-highlighting
map <silent> coH :let @/ = ""<CR>

" Find any non-ascii character
map <silent> funi /[^ -~]<CR>

" Colors and Syntax                                            {{{1
" -----------------------------------------------------------------

" turn on syntax highlighting
syntax on

" highlight all python syntax
let python_highlight_all=1

" gui and terminal compatible color scheme
set t_Co=256
set background=dark
" set global variables that will define the colorscheme
let g:light_theme='solarized'
let g:dark_theme='solarized'

" Use the "original" molokai theme colors instead of "dark"
let g:molokai_original=1

" Zenburn settings
let g:zenburn_alternate_Error = 1

" Solarized settings
let g:solarized_termcolors=16
let g:solarized_diffmode='high'

" Command to call the ColorSwitch funciton
command! -nargs=? -complete=customlist,s:completeColorSchemes ColorSwitcher :call s:colorSwitch(<q-args>)

function! s:extraHighlights()
    " Syntax highlights for the mappings set above
    hi InterestingWord1 guifg=#000000 guibg=#FF4300 ctermfg=16 ctermbg=196
    hi InterestingWord2 guifg=#000000 guibg=#53FF00 ctermfg=16 ctermbg=82
    hi InterestingWord3 guifg=#000000 guibg=#FF74F8 ctermfg=16 ctermbg=165
    hi IndentGuides                   guibg=#373737            ctermbg=237
endfunction

" A function to toggle between light and dark colors
function! s:colorSwitch(...)
    " function to switch colorscheme
    function! ChangeMe(theme)
        execute('colorscheme '.a:theme)
        try
            execute('colorscheme '.a:theme.'_custom')
        catch /E185:/
            " There was no '_custom' scheme...
        endtry
    endfunction

    " Change to the specified theme
    if eval('a:1') != ""
        " check to see if we are passing in an existing var
        if exists(a:1)
            call ChangeMe(eval(a:1))
        else
            call ChangeMe(a:1)
        endif
        " Put the extra highlights back in place
        call s:extraHighlights()
        return
    endif

    " Toggle between a light and dark vim colorscheme
    " This also takes care of the solarized scheme
    if &background == 'dark'
        set background=light
        call ChangeMe(g:light_theme)
    elseif &background == 'light'
        set background=dark
        call ChangeMe(g:dark_theme)
    endif

    " Put the extra highlights back in place
    call s:extraHighlights()
endfunction

" completion function for colorscheme names
function! s:completeColorSchemes(A,L,P)
    let colorscheme_names = []
    for i in split(globpath(&runtimepath, "colors/*.vim"), "\n")
        let colorscheme_name = fnamemodify(i, ":t:r")
        if stridx(colorscheme_name, "_custom") < 0
            call add(colorscheme_names, colorscheme_name)
        endif
    endfor
    return filter(colorscheme_names, 'v:val =~ "^' . a:A . '"')
endfunction

" set the colorscheme
ColorSwitcher g:dark_theme

" switch between light and dark colors
map <silent> <leader>c :ColorSwitcher<CR>

" Custom functions and commands                                {{{1
" -----------------------------------------------------------------

" Tabs and spaces                                              {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" command to switch tab styles
command! -nargs=+ TabStyle :call s:TabChanger(<f-args>)

" function to switch between tabs and spaces
" initial idea taken from:
" http://github.com/twerth/dotfiles/blob/master/etc/vim/vimrc
function! s:TabChanger(...)
    let l:tab_type = a:1
    if !exists('a:2')
        let l:tab_length = 4
    else
        let l:tab_length = a:2
    endif
    exec 'set softtabstop=' . l:tab_length
    exec 'set shiftwidth=' . l:tab_length
    exec 'set tabstop=' . l:tab_length
    if l:tab_type == "space"
        set expandtab
    elseif l:tab_type =="tab"
        set noexpandtab
    endif
endfunction

TabStyle space 4

" Shell as scratch buffer                                      {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" function to run shell commands and create a scratch buffer (modified
" slightly so that it doesn't show the command and it's interpretation)
" http://vim.wikia.com/wiki/Display_output_of_shell_commands_in_new_window
" Example, show output of ls in a scratch buffer:
"
" :Shell ls -al

command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
     if part[0] =~ '\v[%#<]'
        let expanded_part = '"'.fnameescape(expand(part)).'"'
        let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
     endif
  endfor
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1,substitute(getline(1),'.','=','g'))
  execute '$read !'. expanded_cmdline
  setlocal nomodifiable
  1
endfunction

" Whitespace                                                   {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Call the strip trailing whitespace function as a command
command! StripTrailingWhitespaces call s:StripTrailingWhitespaces()

" A function to strip trailing whitespace and clean up afterwards so
" that the search history remains intact and cursor does not move.
" Taken from: http://vimcasts.org/episodes/tidying-whitespace
function! s:StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

map cuw :StripTrailingWhitespaces<CR>

" Markdown                                                     {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" run markdown on the current file and place the html in a scratch buffer
command! -nargs=0 MarkdownToHTML  call s:RunShellCommand('Markdown.pl %')
" replace the current buffer with the html version of the markdown
command! -nargs=0 MarkdownToHTMLReplace  %!Markdown.pl "%"
" copy the html version of the markdown to the clipboard (os x)
command! -nargs=0 MarkdownToHTMLCopy  !Markdown.pl "%" | pbcopy
" use pandoc to convert from html into markdown
command! -nargs=0 MarkdownFromHTML  %!pandoc -f html -t markdown_github "%"

" Tidy                                                         {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" xml tidy
command! -complete=file -nargs=* TidyXML call s:TidyXML()
map <silent> cut :TidyXML<CR>

function! s:TidyXML()
    " Preparation: save last search, and cursor position.
    let l = line(".")
    let c = col(".")
    " Do the business:
    %!tidy -xml -i -q -w 0
    " Clean up cursor position
    call cursor(l, c)
endfunction

" Error Toggle                                                 {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

command! -bang -nargs=? ErrorsToggle call ErrorsToggle(<bang>0)

function! ErrorsToggle(forced)
  if exists("g:llist_win") && a:forced == 0
    lclose
    unlet g:llist_win
  else
    exec "Errors"
    lopen
    let g:llist_win = bufnr("$")
  endif
endfunction

nnoremap <silent> coe :ErrorsToggle<CR>

" Quickfix                                                     {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

command! -bang -nargs=? QFix call QFixToggle(<bang>0)

" Function to toggle the quickfix window open and close
function! QFixToggle(forced)
  if exists("g:qfix_win") && a:forced == 0
    cclose
    unlet g:qfix_win
  else
    copen 10
    let g:qfix_win = bufnr("$")
  endif
endfunction

nnoremap <silent> coq :QFix<CR>

" Copy search matches to register                              {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Copy matches of the last search to a register (default is the clipboard).
" Accepts a range (default is whole file).
" 'CopyMatches'   copy matches to clipboard (each match has \n added).
" 'CopyMatches x' copy matches to register x (clears register first).
" 'CopyMatches X' append matches to register x.
" We skip empty hits to ensure patterns using '\ze' don't loop forever.
command! -range=% -register CopyMatches call s:CopyMatches(<line1>, <line2>, '<reg>')
function! s:CopyMatches(line1, line2, reg)
  let hits = []
  for line in range(a:line1, a:line2)
    let txt = getline(line)
    let idx = match(txt, @/)
    while idx >= 0
      let end = matchend(txt, @/, idx)
      if end > idx
    call add(hits, strpart(txt, idx, end-idx))
      else
    let end += 1
      endif
      if @/[0] == '^'
        break  " to avoid false hits
      endif
      let idx = match(txt, @/, end)
    endwhile
  endfor
  if len(hits) > 0
    let reg = empty(a:reg) ? '+' : a:reg
    execute 'let @'.reg.' = join(hits, "\n") . "\n"'
  else
    echo 'No hits'
  endif
endfunction

" :global to buffer                                            {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Output the last global command to a buffer for further use
command! GlobalToBuffer execute 'normal! 0"ay0' | execute 'g//y A' | split | enew | setlocal bt=nofile | put! a | execute 'normal! ggddGdd'

" Open a buffer number in a vertical split                     {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Vertical Split Buffer Function
function! VerticalSplitBuffer(buffer)
    execute "vert belowright sb" a:buffer
endfunction

" Vertical Split Buffer Mapping
command! -nargs=1 Vbuffer call VerticalSplitBuffer(<f-args>)

" Show indent guides                                           {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Taken from https://bitbucket.org/sjl/dotfiles/src/tip/vim/.vimrc
" though that may not be the originator.
let g:indentguides_state = 0
function! IndentGuides() " {{{
    if g:indentguides_state
        let g:indentguides_state = 0
        2match None
    else
        let g:indentguides_state = 1
        execute '2match IndentGuides /\%(\_^\s*\)\@<=\%(\%'.(0*&sw+1).'v\|\%'.(1*&sw+1).'v\|\%'.(2*&sw+1).'v\|\%'.(3*&sw+1).'v\|\%'.(4*&sw+1).'v\|\%'.(5*&sw+1).'v\|\%'.(6*&sw+1).'v\|\%'.(7*&sw+1).'v\)\s/'
    endif
endfunction " }}}
nnoremap <silent> tmi :call IndentGuides()<cr>

" Push register out to file                                    {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function! RegisterToFile(...)
    " TODO: use a tmpfile, then clean it up afterwards
    let l:filename = a:1
    if !exists('a:2')
        let l:register = '"'
    else
        let l:register = a:2
    endif
    " XXX: Make it so this doesn't push an empty first line and trailing
    " newline to the file
    exe "redir! > " . l:filename
    echo getreg(l:register)
    redir END
endfunction

" Push a register back to my clipboard                         {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function! PushRegister(text)
    silent !clear
    silent execute '!printf "\%s" '. shellescape(a:text, 1) .' | nc localhost 2224'
    silent execute ':redraw!'
endfunction

" Save a file with sudo when it is [readonly]                  {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Taken from command line fu.
" http://www.commandlinefu.com/commands/view/9425
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!

" Git Commit Dance                                             {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function! GitCommitDance()
    " Disable scrolloff
    set scrolloff=0
    " Find the last line of the git file list / first line before diff
    execute "normal G?^#\<CR>"
    let curline=line('.')
    " Split the window so we can see the diff and the commit message
    split
    " show only the git message on top, set it to that height
    execute "normal ggz". curline ."\<CR>"
    " Start the diff window at the top of the diff
    execute "normal \<C-W>j". curline ."Gjz\<CR>"
    " Go back to the commit editing
    execute "normal \<C-W>k"
endfunction

" Plugins                                                      {{{1
" -----------------------------------------------------------------

" turn on filetype checking for plugins like pyflakes
filetype on                " enables filetype detection
filetype plugin indent on  " enables filetype specific plugins

" Ack                                                          {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" shortcut for ack search
map <leader>a :Ack!<Space>
" highlight search term matches
let g:ackhighlight = 1

" CSV                                                          {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" turn on tsv in csv mode
function! Csv_tsv()
  let b:delimiter='\t'
  let b:col=substitute(b:col, ',', '\t', 'g')
endfunction

" CtrlP                                                        {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" use my normal mapping
let g:ctrlp_map = 'ff'

" load ctrlp extensions
let g:ctrlp_extensions = ['tag']

" search by filename
let g:ctrlp_by_filename = 1

" working path setup
let g:ctrlp_root_markers = ['bootstrap.py', 'buildout.cfg']
" The above won't work with the omelette since it will open items
" that are symlinked in other directories.
let g:ctrlp_working_path_mode = 0

" ctrlp caching
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0

" follow symlinks
let g:ctrlp_follow_symlinks = 1

" Show hidden files
let g:ctrlp_show_hidden = 1

" unlimited amount of files
let g:ctrlp_max_files = 0
let g:ctrlp_max_depth = 100

" Save the last 1000 files for MRU mode
let g:ctrlp_mruf_max = 1000

" show more items by default
let g:ctrlp_max_height = 50

" Only update the search after 1 second
let g:ctrlp_lazy_update = 1000

" Use the CtrlPTag mode
nmap fft :CtrlPTag<CR>
" Use the CtrlPMRUFiles mode
nmap ffr :CtrlPMRUFiles<CR>
" Use the buffer mode
nmap ffe :CtrlPBuffer<CR>

" Fuzzy Finder                                                 {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" max results, lot o' files in a buildout :)
let g:fuzzy_ceiling=35000
" show full paths
let g:fuzzy_path_display = 'highlighted_path'
" ignored files
let g:fuzzy_ignore = "*.png;*.PNG;*.pyc;*.pyo;*.JPG;*.jpg;*.GIF;*.gif;.svn/**;.git/**;*.mo;.DS_Store;.AppleDouble"
" available modes
let g:FuzzyFinderOptions = {
    \'File': {'mode_available': 1},
    \'Buffer': {'mode_available': 0},
    \'Dir': {'mode_available': 0},
    \'MruFile': {'mode_available': 0},
    \'MruCmd': {'mode_available': 0},
    \'Bookmark': {'mode_available': 0},
    \}
" Don't delete a full path when using backspace in file mode
let g:FuzzyFinderOptions.File.smart_bs = 0

" Shortcuts for opening fuzzy finder
"nmap <leader>ff :FufFile<Space>**/
"nmap <leader>t :FufCoverageFile<Space>
"nmap <leader>ft :FufTag<Space>

" Lodgeit                                                      {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
let g:lodgeit_url = "https://paste.sixfeetup.com"
let g:lodgeit_username = "clayton"
let g:lodgeit_secure = 1

" Mini buf explorer                                            {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" single click open of a buffer
let g:miniBufExplUseSingleClick = 1
" use ctrl + tab to cycle through tabs
let g:miniBufExplMapCTabSwitchBufs = 1
" better window management
let g:miniBufExplModSelTarget = 1
" Don't show dupes for now
let g:miniBufExplCheckDupeBufs = 0

" NERDTree                                                     {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" set project folder to x
map cox :NERDTreeToggle<CR>
map tmb :NERDTreeFromBookmark<Space>
nnoremap <silent> tmf :NERDTreeFind<CR>
" files/dirs to ignore in NERDTree (mostly the same as my svn ignores)
let NERDTreeIgnore=[
    \'\~$',
    \'\.pt.cache$',
    \'\.Python$',
    \'\.svn$',
    \'\.git*$',
    \'\.pyc$',
    \'__pycache__$',
    \'\.pyo$',
    \'\.mo$',
    \'\.o$',
    \'\.lo$',
    \'\.la$',
    \'\..*.rej$',
    \'\.rej$',
    \'\.\~lock.*#$',
    \'\.AppleDouble$',
    \'\.pt.py$',
    \'\.DS_Store$']
" set the sort order to alphabetical
let NERDTreeSortOrder=[]
" when the root is changed, change Vim's working dir
let NERDTreeChDirMode=2
" use fancy ass arrows
let NERDTreeDirArrows=1

" php debugger                                                  {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" turn off the mini buf explorer when using the debugger so the
" windows get initialized properly
let g:debuggerMiniBufExpl = 1

" Powerline                                                    {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
let g:Powerline_theme = 'distinguished'
" show the unicode symbols in the terminal, fancy is set in gui below
let g:Powerline_symbols = 'fancy'
" Better unicode dividers that work with Inconsolata
"let g:Powerline_dividers_override = [ "◤ ", " ⤷ ", " ◥", "⤶ " ]

" Airline                                                      {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
let g:airline_theme='airlineish'
let g:airline_powerline_fonts=1
let g:airline#extensions#whitespace#enabled = 0

" syntastic                                                    {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Enable signs support to visually see where errors/warnings appear
let g:syntastic_enable_signs=1
" Automatically open the location list when there are errors
let g:syntastic_auto_loc_list=0
let g:syntastic_check_on_open=1

let g:syntastic_python_checkers=['flake8']

" Tagbar                                                       {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
nnoremap tt :TagbarToggle<CR>

" unset the sort so it sorts by source file order
let g:tagbar_sort = 0

" always jump into the tagbar pane when it is opened
let g:tagbar_autofocus = 1

" ZCML type
" XXX: This doesn't currently work because I use a filetype setting
"      of "xml.zcml".
let g:tagbar_type_zcml = {
    \ 'ctagstype': 'zcml',
    \ 'kinds': [
        \ 'n:name',
        \ 'f:for',
        \ 'g:profile',
        \ 'p:permission',
        \ 'p:provides',
        \ 'h:handler',
        \ 'm:component',
        \ 'f:factory',
        \ 'c:class',
        \ 'i:id',
        \ 'v:view',
        \ 's:schema',
        \ 'c:controller',
        \ 't:type',
        \ 'w:workflow'
    \ ]
\}
" cfg file type
let g:tagbar_type_cfg = {
    \ 'ctagstype': 'ini',
    \ 'kinds': ['s:section']
\ }
" Markdown type
let g:tagbar_type_markdown = {
    \ 'ctagstype': 'markdown',
    \ 'kinds': [
          \ '1:header1',
          \ '2:header2',
          \ '3:header3',
          \ '4:header4',
          \ '5:header5',
          \ '6:header6',
          \ '7:header7'
    \ ]
\ }

let g:tagbar_type_yaml = {
    \ 'ctagstype': 'yaml',
    \ 'kinds': [
          \ 'd:definition',
          \ 'n:name'
    \ ]
\ }

let g:tagbar_type_sls = {
    \ 'ctagstype': 'yaml',
    \ 'kinds': [
          \ 'd:definition',
          \ 'n:name'
    \ ]
\ }

" VCSCommand                                                   {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Delete buffers when i'm done with them in VCSCommand
let VCSCommandDeleteOnHide = 1

" Yankring                                                     {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Show and hide the yankring history
nnoremap <silent> tmy :YRShow<CR>
" Set the maximum number of history
let g:yankring_max_history = 200
" Make the yankring set the numbered registers
let g:yankring_manage_numbered_reg = 1
" don't leave the history in my home dir
let g:yankring_history_dir = '$HOME/.backup/vim'

" Signify                                                      {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Only show these VCS differences
let g:signify_vcs_list = ['git', 'hg', 'svn']

" Riv                                                          {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Auto open folds on file open
" Couldn't figure out how to do this with the available riv options
au BufReadPost *.rst :normal zR
" Manually decide when to break a line based on grammar
au BufReadPost *.rst :set textwidth=0

" livedown                                                     {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
nmap tmm :LivedownPreview<CR>
nmap tmmk :LivedownKill<CR>

" instant-rst                                                  {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
nmap tmr :InstantRst<CR>
nmap tmrk :StopInstantRst<CR>

" Auto command settings                                        {{{1
" -----------------------------------------------------------------

if has("autocmd")
    " automatically re-source the vimrc on save
    "autocmd bufwritepost .vimrc source $MYVIMRC

    " jinja syntax automagically
    au BufNewFile,BufRead *.jinja set filetype=jinja

    " vimperator and pentadactyl files
    au BufNewFile,BufRead *.vimp,*.penta,.vimperatorrc,.pentadactylrc set filetype=vim

    " vim pager settings"
    au BufNewFile,BufRead .vimpagerrc set filetype=vim

    " automatically use the wiki text for trac.sixfeetup.com when
    " using it's all text
    au BufNewFile,BufRead *trac.sixfeetup.com* set filetype=wiki
    " use markdown for karl
    au BufNewFile,BufRead *karl.sixfeetup.com.* set filetype=markdown.html

    " anything with the wiki extension should be treated as such
    au BufNewFile,BufRead *.wiki set filetype=wiki

    " shell files
    au BufNewFile,BufRead .common* set filetype=sh

    " vim help files
    au BufNewFile,BufRead /*/doc/*.txt set filetype=help

    " Vagrant files
    au BufNewFile,BufRead Vagrantfile set filetype=ruby

    " psql sessions in Postgres
    au BufNewFile,BufRead psql.edit.* set filetype=sql

    " Set up a split window for git verbose commit
    au BufNewFile,BufRead COMMIT_EDITMSG call GitCommitDance()

    " Zope and Plone files
    " -----------------------------------------------------------------
    " set up zope page templates as the zpt filetype
    au BufNewFile,BufRead *.pt,*.cpt,*.zpt set filetype=zpt syntax=xml
    " xml syntax for zcml files
    au BufNewFile,BufRead *.zcml set filetype=zcml syntax=xml
    " css.dtml as css
    au BufNewFile,BufRead *.css.dtml set filetype=css.dtml
    " kss files as css
    au BufNewFile,BufRead *.kss set filetype=kss.css
    " js.dtml as javascript
    au BufNewFile,BufRead *.js.dtml set filetype=javascript.dtml
    " any txt file in a `tests` directory is a doctest
    au BufNewFile,BufRead /*/tests/*.txt set filetype=doctest.rst

    " automatically give executable permissions if file begins with #! and contains
    " Automatic `:!chmod +x %`.
    " taken from https://gist.github.com/791189

    " XXX: Turning this off for now...
    "autocmd BufWritePost * call s:auto_chmod()
    function! s:auto_chmod()
        if !exists('b:disable_auto_chmod')
        \ && getfperm(expand('%'))[2] !=# 'x'
        \ && getline(1) =~# '^#!'
            !chmod +x %
        endif
    endfunction
endif

" Cursor and window controls                                   {{{1
" -----------------------------------------------------------------

" Make cursor move by visual lines instead of file lines (when wrapping)
" This makes me feel more at home :)
map <up> gk
map k gk
imap <up> <C-o>gk
map <down> gj
map j gj
imap <down> <C-o>gj
map E ge

" window resizing
if bufwinnr(1)
  nnoremap + <C-W>+
  nnoremap - <C-W>-
endif

" open a new line from the current spot (sort of the opposite of J)
map <leader><Enter> i<CR><ESC>

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y yg_
" Yank an entire line without the line ending and leading space
nnoremap YY ^yg_

" sort versions in a versions.cfg
map cuv /\[versions\]<CR>jVG:g/^#/d<CR>gv:g/^$/d<CR>gv:sort i<CR>:w<CR>

" set up the invisible characters
set listchars+=tab:▸\ ,eol:¬
" show invisible characters by default
set list
" toggle invisible characters
noremap <silent> coi :set list!<CR>

" Window management settings                                    {{{1
" -----------------------------------------------------------------

" turn on writeroom
map <silent> <F8> :source ~/.vim/nightroom.vim<CR>

" Mapping window commands directly
map <C-H> <C-W>h
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l

" Move between tabs
map <silent> <C-W><C-H> :tabnext<CR>
map <silent> <C-W><C-L> :tabprevious<CR>

" Create a new tab
map <silent> <C-W><C-N> :tabnew<CR>
" Edit current buffer in a tab (think tmux zoom)
map <silent> <C-W><C-I> :tabedit %<CR>
" Close the current tab
map <silent> <C-W><C-X> :tabclose<CR>

" cycle windows
map <C-W>e <C-W>W
map <C-W><C-E> <C-W>W

" Window splits like I have mapped in tmux (- horizontal, | vertical)
map <C-W>- <C-W>s
map <C-W>\| <C-W>v

" GUI settings                                                 {{{1
" -----------------------------------------------------------------

" A dictionary of available sizes, inspired by Firesizer
let vs_window_sizes = {"normal": '155 45', "bigger": '205 60', "ginourmous": "285 65", "1280screen": "200 65", "bigandtall": "227 75"}

" shortcuts to switch the window size
map <leader>1 :VSSelectWindowSize normal<CR>
map <leader>2 :VSSelectWindowSize bigger<CR>
map <leader>3 :VSSelectWindowSize ginourmous<CR>
map <leader>4 :VSSelectWindowSize 1280screen<CR>
map <leader>5 :VSSelectWindowSize bigandtall<CR>

if has("gui_running")

    " turn off the cursor blinking (who thinks that is a good idea?)
    set guicursor+=a:blinkon0

    if has("autocmd")
        " Default size of window
        "autocmd VimEnter * exe 'VSSelectWindowSize bigger'

        " automagically open NERDTree in a GUI
        autocmd VimEnter * exe 'NERDTreeToggle' | wincmd l
        " close the NERDTree when opening it's all text and vimperator
        " editors
        autocmd VimEnter,BufNewFile,BufRead /*/itsalltext/*,vimperator-*.tmp,*pentadactyl*.txt exe 'NERDTreeClose'
        autocmd VimEnter,BufNewFile,BufRead /*/itsalltext/* set nospell
        " Close the NERDTree when external editing emails
        autocmd VimEnter,BufNewFile,BufRead *.eml exe 'NERDTreeClose'
        " Close the NERDTree if we open a svn commit message
        autocmd VimEnter,BufNewFile,BufRead svn-{commit,prop}.*tmp exe 'NERDTreeClose'
        " Close the NERDTree if we open a git commit message
        autocmd VimEnter,BufNewFile,BufRead COMMIT_EDITMSG exe 'NERDTreeClose'
        " Close the NERDTree if we open a zsh command line
        autocmd VimEnter,BufNewFile,BufRead /*/tmp/zsh* exe 'NERDTreeClose'
    endif

    " turn off the gui elements
    set guioptions=

    " OS Specific
    if has("gui_macvim")
        " disable the meta navigation keys set by macvim (so I can use them
        " for other things)
        let macvim_skip_cmd_opt_movement = 1
        " use the whole screen
        set fuoptions=maxvert,maxhorz
        " fancy powerline!
        let g:Powerline_symbols = 'fancy'
        " use Monaco with no antialiasing
        set guifont=Inconsolata-dz\ for\ Powerline:h10,Inconsolata-dz:h10,Inconsolata:h12,Monaco:h10
        set antialias
        " maybe set the transparency
        " XXX: getting annoyed by the transparency
        "set transparency=2

        " turn off transparency
        noremap <leader>TT :set transparency=0<CR>
    endif

    if has("gui_gtk2")
        set guifont=Inconsolata\ Medium\ 10,Droid\ Sans\ Mono\ 9,Liberation\ Mono\ 10,LucidaTypewriter\ Medium\ 10,Terminal
        autocmd GUIEnter * set vb t_vb=
    endif
endif

" turn on folds
" vim: fdm=marker
