//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	{"Bat:", "/home/pavel/.config/suckless/dwmblocks/scripts/sb-bat",	60,		0},

	{"Br:", "/home/pavel/.config/suckless/dwmblocks/scripts/sb-btighness",	0,		2},

	{"Mem:", "free -h | awk '/^Mem/ { print $3\"/\"$2 }' | sed s/i//g",	30,		0},

    {"",	"/home/pavel/.config/suckless/dwmblocks/scripts/sb-layout",	1,	13},

	{"Vol:",	"/home/pavel/.config/suckless/dwmblocks/scripts/sb-vol",	0,	10},

	{"", "date '+(%b) %Y-%m-%d (%a) %H:%M:%S '",					1,		0},
};

//sets delimiter between status commands. NULL character ('\0') means no delimiter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
