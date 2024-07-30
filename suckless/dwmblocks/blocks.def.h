//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
  {"^d^ ^b#d65d0e^^c#1d2021^   ^b#fe8019^ ", "xbps-install -unM | wc -l",					21600,	 0},
  {"^d^ ^b#689d6a^^c#1d2021^   ^b#8ec07c^ ",	"/home/pavel/.config/suckless/dwmblocks/scripts/sb-layout",	0,	1},
  {"^d^ ^b#458588^^c#1d2021^  ^b#83a598^ ", "/home/pavel/.config/suckless/dwmblocks/scripts/sb-vol",  	0,	 10},
  {"^d^ ^b#d79921^^c#1d2021^  ^b#fabd2f^ ", "/home/pavel/.config/suckless/dwmblocks/scripts/sb-bat",	60,	 0},
  /*{"^d^ ^b#689d6a^^c#1d2021^   ^b#8ec07c^ ", "/home/pavel/.config/suckless/dwmblocks/scripts/sb-cpu", 		10,	 0},*/
  /*{"^d^ ^b#689d6a^^c#1d2021^   ^b#8ec07c^ ", "/home/pavel/.config/suckless/dwmblocks/scripts/sb-wlan",		10,	 0},*/
  {"^d^ ^b#cc241d^^c#1d2021^   ^b#fb4934^ ", "/home/pavel/.config/suckless/dwmblocks/scripts/sb-clock",	60,	 0},
  {"^d^ ", "",					0,	 0},
    /*{"^d^ ^b#98971a^^c#1d2021^  ^b#b8bb26^ ", "block-cpu perc",    						5,	 0},*/
    /*{"^d^ ^b#458588^^c#1d2021^  ^b#83a598^ ", "block-temperature /sys/class/thermal/thermal_zone0/temp",	5,	 0},*/
    /*{"^d^ ^b#689d6a^^c#1d2021^  ^b#8ec07c^ ", "block-ram used",    						10,	 0},*/
    /*{"^d^ ^b#d79921^^c#1d2021^  ^b#fabd2f^ ", "block-battery perc BAT0",  					60,	 0},*/
};

//sets delimiter between status commands. NULL character ('\0') means no delimiter.
static char delim[] = " ";
static unsigned int delimLen = 1;
