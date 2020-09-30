" ===================
" === Basic Setup ===
" ===================
" ===
" === Basic Behavior
" ===
syntax on        "语法高亮
set nu           "行号
set showmatch    "显示匹配括号
set cursorline    "光标线
set nocompatible  "取消与vi的兼容模式
set foldenable      " 允许折叠  
set foldmethod=manual   " 手动折叠
set wildmenu            " 一个很好看的底栏
set autoindent     "自动缩进
set smartindent    "智能缩进
set termguicolors  "启动全彩
filetype indent on "按文件类型调整缩进方式


" ===
" === tab键宽度设定为4个空格 
" ===
set shiftwidth=4   
set softtabstop=4 
set tabstop=4  



" ======================
" === Basic Mappings ===
" ======================
" ===
" === set <LEADER> as <SPACE>
" ===
let mapleader=" "

" ===
" === open init.vim file anytime
" ===
noremap <LEADER>rc :e ~/.config/nvim/init.vim<CR>

" ===
" === windows management
" ===
" use <space> + hjkl for moving the cursor around windows
noremap <LEADER>w <C-w>w
noremap <LEADER>k <C-w>k
noremap <LEADER>h <C-w>h
noremap <LEADER>j <C-w>j
noremap <LEADER>l <C-w>l

" resize splits with arrow keys
noremap <up> :res +5<CR>
noremap <down> :res -5<CR>
noremap <left> :vertical resize-5<CR>
noremap <right> :vertical resize+5<CR>

"use Ctrl+jk for repaid warching 
noremap <C-j> 5j
noremap <C-k> 5k

" ===
" === run debug programs 
" ===
map <F8> :call Rundb()<CR>
func!Rundb()
	if &filetype =='c' || &filetype == 'cpp'
		exec "GdbLocal"
	elseif &filetype == 'py'
		set splitbelow 
		:sp
		:term python3 %
	elseif &filetype == 'md' || &filetype == 'markdown'
		exec 'MarkdownPreview'	
	elseif &filetype == 'html'
		:Bracey
	endif
endfunc



" =======================
" === python settings ===
" =======================
" ===
" ===turn tab to 4 spaces
" ===
autocmd FileType python set expandtab






" =========================
" === markdown settings ===
" =========================
" ===
" === press <ENTER> to turn the cursor to next line
" ===
"autocmd FileType markdown inoremap <CR> <SPACE><SPACE><CR>






" =====================================
" === install plugins with Vim-plug ===
" =====================================
call plug#begin()
" preview colors in files
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
 

"  input behaviors
Plug 'jiangmiao/auto-pairs'



"  debug
Plug 'hiberabyss/NeovimGdb'



"  markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'dhruvasagar/vim-table-mode'




"  auto complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}



"  fcitx auto-convertion
Plug 'vim-scripts/fcitx.vim' 


"  html5 preview 
Plug 'turbio/bracey.vim'


"  qt
Plug 'fedorenchik/qt-support.vim'
Plug 'listenerri/vim-qt-assistant'



" colorscheme
Plug 'connorholyday/vim-snazzy'



" vim-powerline
Plug 'powerline/powerline'


" nvim-R
Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}



" a line shows tags
Plug 'mg979/vim-xtabline'


" open ranger in neovim
Plug 'francoiscabrol/ranger.vim' | Plug 'rbgrouleff/bclose.vim'




call plug#end()








" =======================
" === plugins settings===
" =======================
" ===
" ===markdown-preview
" ===
"specify browser to open preview page
let g:mkdp_browser = 'chromium'


" ===
" ===ranger.vim
" ===
"map <leader>t to :RangerNewTab
let g:ranger_map_keys = 0
nnoremap <leader>ra :RangerNewTab<CR>


" ===
" ===vim-snazzy
" ===
let g:SnazzyTransparent = 1
colorscheme snazzy


" ===
" ===vim-qt-assistant
" ===
" map <F1> to get qt-doc from qt-assistant
map <F1> :call GetDocFromAssistant()<CR>


" ===
" ===vim-hexokinase
" ===
" set the method of showing colors
let g:Hexokinase_highlighters = [ 'background' ]
" set which patterns are matched
let g:Hexokinase_optInPatterns = 'full_hex,triple_hex,rgb,rgba,hsl,hsla,colour_names'


" ===
" ===bracey.vim
" ===
"specify browser to open preview page
let g:bracey_browser_command = 'chromium'



" ===
" ===coc.nvim
" ===
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()


" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif


" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Open file navigation.
nmap ff :CocCommand explorer<CR>

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}





