" 挿入モードから離れたときに入力モードを切り替える
" autocmd InsertLeave * :silent !/opt/homebrew/bin/im-select com.apple.keylayout.ABC

"" space+enterで空行を追加する
noremap <Space><CR> mzO<Esc>`z

" システムのクリップボードにコピーできるようにする 
set clipboard=unnamed

" Y consistent with D and C to the end of line
nnoremap Y y$

" タブの移動 
exmap nextTab obcommand app:go-back
exmap prevTab obcommand app:go-forward
nnoremap L :nextTab
nnoremap H :prevTab

" qでファイルを閉じる
unmap <Space>
exmap q obcommand workspace:close
nmap <Space>q :q<CR>
