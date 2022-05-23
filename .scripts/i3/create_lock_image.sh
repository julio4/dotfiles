#! /bin/sh

rm /tmp/_i3_lock_image*
rm /tmp/i3_lock_image*

# Comment for mode 1 or 2 only
# Mode 1 Take a screenshot of the desktop and apply a gaussian blur
# to create an image to use for the lock screen.
# Mode 2 Use wallpaper and resize img to screen resolution + blur
# Mode 3 Only background no blur  
mode=3

if [[ $mode == 1 ]]; then
  flameshot full -p /tmp/_i3_lock_image.png
  ffmpeg -i /tmp/_i3_lock_image.png -filter_complex "gblur=sigma=50" /tmp/i3_lock_image.png -y
elif [[ $mode == 2 ]]; then
  $SHELL -c "cp $(cat ~/.scripts/default-bg.txt | tr -d '\n') /tmp/__i3_lock_image.png"
  ffmpeg -i /tmp/__i3_lock_image.png -vf scale=$(xrandr | grep ' connected' | grep -Eo '[0-9]+x[0-9]+' | sed -r 's/x/:/') /tmp/_i3_lock_image.png
  ffmpeg -i /tmp/_i3_lock_image.png -filter_complex "gblur=sigma=50" /tmp/i3_lock_image.png -y
else
  $SHELL -c "cp $(cat ~/.scripts/default-bg.txt | tr -d '\n') /tmp/_i3_lock_image.png"
  ffmpeg -i /tmp/_i3_lock_image.png -vf scale=$(xrandr | grep ' connected' | grep -Eo '[0-9]+x[0-9]+' | sed -r 's/x/:/') /tmp/i3_lock_image.png
fi
