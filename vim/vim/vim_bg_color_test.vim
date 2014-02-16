" script name : vim_bg_color_test.vim
"
" dedicated to choose a background color in Vim (not gvim), for ":hi Normal".
" Needed here is an integer ranging from 0 to 255. (vs rgb values for gvim)
" (Does color value effect depends on operating used ?)
" (Here foreground color is set to black but script may help on choosing
" foreground color too.)
"
" Execute this script from within Vim by ":source %" if you edit it currently.
" Beginning and ending values are asked for in order to do a loop on colors.
" The status line at the bottom of screen shows script effect.
" Type a carriage-return after seeing color showed (and associated number).
"
" In principle the lot of highlight (:hi) options are well chosen by Vim
" when ":hi Normal" options are set, while possibly adding in .vimrc (linux) :
" :set background=dark or light
" :set t_Co=256
" 08/08/2012 - alain_b
"----------------------------------------------
let n=input("First number (0 to 255)")
let n2=input("Last number (0 to 255)")
while n <= n2
  execute "hi Normal ctermfg=black ctermbg=".n
  execute input("Value ".n )
  let n=n+1
endwhile
" Initial display restored
source ~/.vimrc
