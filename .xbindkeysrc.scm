  (xbindkey '("XF86AudioRaiseVolume") "amixer sset Master 2%+ ; amixer sset -c 0 Speaker 2%+ ; amixer set Master unmute")
  (xbindkey '("XF86AudioLowerVolume") "amixer sset Master 2%- ; amixer sset -c 0 Speaker 2%- ; amixer set Master unmute")
  (xbindkey '("XF86AudioMute") "amixer set Master mute")
  (xbindkey '("XF86AudioNext") "playerctl next; amixer set Master unmute")
  (xbindkey '("XF86AudioPrev") "playerctl previous; amixer set Master unmute")
  (xbindkey '("XF86AudioPlay") "playerctl play-pause")
  (xbindkey '("XF86AudioStop") "playerctl stop")
  (xbindkey '("XF86ScreenSaver") "i3lock -i /mnt/shared/daten/bilder/hintergrund/win95.png")

