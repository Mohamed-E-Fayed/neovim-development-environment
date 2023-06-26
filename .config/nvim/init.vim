" PLUGINS

call plug#begin()
  " fzf fuzzy finder basic plugin
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

  " fzf fuzzy finder extra commands
  "
  " Make sure to install the ripgrep package for the :Rg command to work.
  " ripgrep is a line-oriented search tool that recursively searches the
  " current directory for a regex pattern. By default, ripgrep will respect
  " gitignore rules and automatically skip hidden files/directories and binary files.
  Plug 'junegunn/fzf.vim'

" Silver searcher for searching current project
Plug 'gabesoft/vim-ags'

" Tabnine for autocompetion using AI
Plug 'codota/tabnine-nvim', { 'do': './dl_binaries.sh' }

" ctags
Plug 'universal-ctags/ctags'
Plug 'yegappan/taglist'

  " ALE
  Plug 'dense-analysis/ale'

" Plugin for AutoCompletion and Checking documentation of functions for many
" languages
" Plug 'neoclide/coc.nvim' 

" Plugins for python
" Plug 'cjrh/vim-conda'

" Plugin for jupyter-notebook integration
  Plug 'dccsillag/magma-nvim'

" Plugins for Java AutoCompletion and Getting documentation from nvim
" "Uncomment them when you need them to avoid installing a lot of unnecessary
" plugins
" Plug 'neovim/nvim-lspconfig'
" Plug 'hrsh7th/nvim-cmp' 
" Plug 'hrsh7th/cmp-nvim-lsp'
" Plug 'williamboman/nvim-lsp-installer'
" Plug 'puremourning/vimspector'
" Plug 'mfussenegger/nvim-jdtls'
" Plug 'artur-shaik/jc.nvim'


  " Auto-pairs for automatically inserting parens
  Plug 'jiangmiao/auto-pairs'
  Plug 'wellle/targets.vim'
  Plug 'machakann/vim-sandwich'

    " Plugin to get the cursor back to position just before closing the file
  " intelligently
  Plug 'farmergreg/vim-lastplace'

call plug#end()

" CONFIGURATION

" ALE CONFIGURATION

" COMMON CONFIGURATION VARIABLES FOR ALE
let g:ale_completion_enabled = 1
set omnifunc=ale#completion#OmniFunc

" This dictionary is used to enable linters that are disabled by default
let g:ale_linters = {
			\ '*': ['remove_trailing_lines', 'trim_widespace'],
			\ 'c': ['astyle', 'clang-format', 'clangtidy', 'cppcheck', 'cpplint',  'ccls', 'gcc', 'cquery', 'flawfinder'],
			\ 'cpp': ['astyle', 'clang-format', 'clangtidy', 'cppcheck', 'cpplint', 'gcc', 'cquery', 'flawfinder'],
\   'python': ['autoflake8',  'autopep8', 'mypy', 'pylsp', 'refurb', 'ruff'],
\ 'shell': ['shfmt', 'shellcheck', 'bashate'],
\ }

" LANGUAGE-SPECIFIC CONFIGURATION VARIABLES FOR ALE

" Shell
"   1. Make sure you have shellcheck installed.
"   2. Make sure you have bash-language-server installed.
"   3. You can install any other supported providers in addition.

" This variable can be changed to modify flags given to shellcheck
let g:ale_sh_shellcheck_options = ''

" C/C++
"   1. Make sure you have clangd or ccls installed.
"   2. You can install any other supported providers in addition.

" This variable can be changed to modify flags given to clangd for C
let g:ale_c_clangd_options = ''

" This variable can be changed to modify flags given to clangd for C++
let g:ale_cpp_clangd_options = ''

" This dictionary is used to configure ccls for C
" (https://github.com/MaskRay/ccls/wiki/Customization#initialization-options)
let g:ale_c_ccls_init_options = {
\ }

" This dictionary is used to configure ccls for C++
" (https://github.com/MaskRay/ccls/wiki/Customization#initialization-options)
let g:ale_cpp_ccls_init_options = {
\ }

" Python
"   1. Make sure you have Jedi installed. $pip install jedi
"   2. Make sure you have pylsp installed. $pip install python-lsp-server
"   3. You can install any other supported providers in addition.

" This variable can be changed to modify flags given to pylsp
let g:ale_python_pylsp_options = ''

" This dictionary is used to configure pylsp
" (https://github.com/python-lsp/python-lsp-server/blob/develop/CONFIGURATION.md)
let g:ale_python_pylsp_config = {
\ }

" Enable Python-specific autocompletion using Jedi
let g:jedi#completions_enabled = 1
let g:jedi#popup_on_dot = 1
let g:jedi#popup_select_first = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#show_call_signatures = '1'

" Java
"
" To enable Java LSP linter, you need to download and build the vscode-javac
" language server from (https://github.com/georgewfraser/java-language-server).
"
" Before building the language server, you need to install pre-requisites: npm,
" maven, and protobuf. You also need to have Java 13 installed and have JAVA_HOME
" properly set.
"
" After downloading the source code and installing all pre-requisites, you can
" build the language server with the included build.sh script:
"
"   scripts/build.sh
"
" This will create launch scripts for Linux, Mac, and Windows in the dist folder
" within the repo:
"
"   - lang_server_linux.sh
"   - lang_server_mac.sh
"   - lang_server_windows.sh
"

" To let ALE use this language server, you MUST set this variable
" to the absolute path of the launcher executable for your platform
let g:ale_java_javalsp_executable = ''

" The javalsp linter automatically detects external dependencies for Maven and
" Gradle projects. In case the javalsp fails to detect some of them, you can
" specify them by setting this dictionary:
"
"   let g:ale_java_javalsp_config = {
"   \   'java': {
"   \     'externalDependencies': [
"   \       'junit:junit:jar:4.12:test',  " Maven format
"   \       'junit:junit:4.1'             " Gradle format
"   \     ],
"   \     'classPath': [
"   \       'lib/some-dependency.jar',
"   \       '/android-sdk/platforms/android-28.jar'
"   \     ]
"   \   }
"   \ }
"
let g:ale_java_javalsp_config = {
\   'java': {
\     'externalDependencies': [
\     ],
\     'classPath': [
\     ]
\   }
\ }

" Some other configurations
set number
set clipboard=unnamed
" set indentation to use spaces instead of tabs
set tabstop=4
set shiftwidth=4
set expandtab

" keyboard shortcuts
" CTags for c/cpp code if needed
noremap <C-y> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<cr>      


" map leader key to spacebar 
" nnoremap <space> <NOP>
let mapleader = "\<space>"
" ALE
nnoremap <silent> <leader>e <Plug>(ale_next_wrap_error)
nnoremap <silent> <leader>E <Plug>(ale_previous_wrap_error)

nnoremap <leader>d <Plug>(ale_go_to_definition)
nnoremap <leader>i <Plug>(ale_go_to_implementation)
nnoremap <leader>r <Plug>(ale_find_references)

nnoremap <leader>gd <Plug>(ale_go_to_definition)
nnoremap <leader>gi <Plug>(ale_go_to_implementation)
nnoremap <leader>fr <Plug>(ale_find_references)
nnoremap <leader>re <Plug>(ale_rename)
nnoremap <leader>rf <Plug>(ale_file_rename)

" python
nnoremap <leader>tp :w!<cr> :!pytest<cr>

nnoremap <leader>t :tabe 
nnoremap <leader>l :tabs<cr>
nnoremap <leader>qq :qa!<cr>
nnoremap <leader>wq :wqa!<cr>
nnoremap <leader>w :w!<cr>
nnoremap <leader>U :e!<cr> " return to last saved file state"
