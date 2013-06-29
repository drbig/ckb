# ckb keymap file
#
# Created at 2013-06-27 20:18:35 +0200 with input from /dev/input/event17.
#

DEV = '/dev/input/event17'

STATE = {
}

KEYMAP = {
  399 => :MUTE,
  400 => :EPG,
  6 => :LIVETV,
  108 => :POWER,
  115 => :D1,
  356 => :D2,
  3 => :D3,
  102 => :STEREO,
  4 => :D4,
  5 => :D5,
  7 => :D6,
  401 => :SNAPSHOT,
  8 => :D7,
  9 => :D8,
  522 => :D9,
  116 => :ZOOM,
  11 => :RECALL,
  113 => :D0,
  523 => :CH_UP,
  106 => :VOL_UP,
  207 => :TELETEXT,
  10 => :REC,
  358 => :CH_DOWN,
  352 => :VOL_DOWN,
  398 => :STOP,
  114 => :PAUSE,
  168 => :FAV,
}

CODE = {
  :CH_DOWN => Proc.new {
    `gmpc-remote -e "seek -00:00:30"`
  },
  :CH_UP => Proc.new {
    `gmpc-remote -e "seek +00:00:30"`
  },
  :D0 => Proc.new { },
  :D1 => Proc.new { },
  :D2 => Proc.new { },
  :D3 => Proc.new { },
  :D4 => Proc.new { },
  :D5 => Proc.new { },
  :D6 => Proc.new { },
  :D7 => Proc.new { },
  :D8 => Proc.new { },
  :D9 => Proc.new { },
  :EPG => Proc.new { },
  :FAV => Proc.new { },
  :LIVETV => Proc.new { },
  :MUTE => Proc.new {
    `gmpc-remote -e mute`
  },
  :PAUSE => Proc.new {
    `gmpc-remote --pause`
  },
  :POWER => Proc.new { },
  :REC => Proc.new { },
  :RECALL => Proc.new { },
  :SNAPSHOT => Proc.new { },
  :STEREO => Proc.new { },
  :STOP => Proc.new { },
  :TELETEXT => Proc.new { },
  :VOL_DOWN => Proc.new {
    `gmpc-remote -e "volume -10"`
  },
  :VOL_UP => Proc.new {
    `gmpc-remote -e "volume +10"`
  },
  :ZOOM => Proc.new { },
}
