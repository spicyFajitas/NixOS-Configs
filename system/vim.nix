{ config, pkgs, ... }:

{
  ##################################
  # Vim Editor Configuration (2-space indentation)
  ##################################
  environment.etc."vimrc".text = ''
    " --- General Settings ---
    syntax on
    set number
    set ruler
    set showcmd
    set showmode
    set laststatus=2

    " --- Indentation ---
    set expandtab          " Use spaces instead of tabs
    set tabstop=2          " Display width of tab as 2 spaces
    set shiftwidth=2       " Auto-indent uses 2 spaces
    set softtabstop=2      " Tab key inserts 2 spaces
    set autoindent         " Continue indenting on new lines
    set smartindent        " Smarter autoindent for code
    filetype plugin indent on

    " --- Usability ---
    set backspace=indent,eol,start
    set history=1000
    set mouse=a
    set clipboard=unnamedplus
  '';

  environment.variables.EDITOR = "vim";
}

