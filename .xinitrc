setxkbmap -layout "us,ru"
setxkbmap -option "grp:alt_shift_toggle,grp_led:scroll"
nitrogen --restore
picom &
xsetroot -cursor_name left_ptr &
exec xmonad
