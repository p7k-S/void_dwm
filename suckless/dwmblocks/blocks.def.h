//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/

	// {"",	"/home/pavel/.config/suckless/dwmblocks/scripts/sb-speed",	1,	0},

	{" Pkg:", "/home/pavel/.config/suckless/dwmblocks/scripts/sb-pkg_updates ",	3600,		0},

	{" | Bat:", "/home/pavel/.config/suckless/dwmblocks/scripts/sb-bat ",	90,		0},

	{" | Br:", "/home/pavel/.config/suckless/dwmblocks/scripts/sb-brightness",	0,		5},


	{" | Mem:", "free -h | awk '/^Mem/ { print $3\"/\"$2 }' | sed s/i//g",	30,		0},

	{" | Cpu:", "/home/pavel/.config/suckless/dwmblocks/scripts/sb-cpu",	30,		0},

    {" | ",	"/home/pavel/.config/suckless/dwmblocks/scripts/sb-layout",	1,	0}, //

    {" | ",	"/home/pavel/.config/suckless/dwmblocks/scripts/sb-mic",	0,	3},
	{" Vol:",	"/home/pavel/.config/suckless/dwmblocks/scripts/sb-vol",	0,	10},
	{"", "/home/pavel/.config/suckless/dwmblocks/scripts/sb-bluetooth",	    1,	0},

	{" | ",	"/home/pavel/.config/suckless/dwmblocks/scripts/sb-wlan",	1,	0},

	{" | ",      "date '+%Y-%m-%d %H:%M:%S '",		            			1,		0},
};

//sets delimiter between status commands. NULL character ('\0') means no delimiter.
// static char delim[] = " | ";
static char delim[] = "";
static unsigned int delimLen = 5;
