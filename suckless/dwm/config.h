/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int gappx     = 0;        /* gap pixel between windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const unsigned int systraypinning = 0;   /* 0: sloppy systray follows selected monitor, >0: pin systray to monitor X */
static const unsigned int systrayonleft  = 0;   /* 0: systray in the right corner, >0: systray on left of status text */
static const unsigned int systrayspacing = 2;   /* systray spacing */
static const int systraypinningfailfirst = 1;   /* 1: if pinning fails, display systray on the first monitor, False: display systray on the last monitor*/
static const int showsystray        = 1;        /* 0 means no systray */
static const int showbar            = 0;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = { "UbuntuMonoNerdFont:style=Bold:size=13:" };
static const char dmenufont[]       =   "UbuntuMonoNerdFont:style=Bold:size=13:";
static const char col_gray0[]       = "#000000";
static const char col_gray1[]       = "#222222";
static const char col_gray2[]       = "#444444";
static const char col_gray3[]       = "#bbbbbb";
static const char col_gray4[]       = "#eeeeee";
static const char col_cyan[]        = "#9f9f9f";//#89b482 005577 00aa00 3971ed style=Bold
static const char *colors[][3]      = {                        
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
	[SchemeSel]  = { col_gray0, col_cyan,  col_cyan  },
};

/* tagging */
//static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };
/*static const char *tags[] = { "1", "2", "3", "4", "5" };*/
/*static const char *tags[] = { "𝜶", "𝜷", "𝜸", "𝜹", "𝜺", "𝜻", "𝜼", "𝜽", "𝜾" };*/
/*static const char *tags[] = { "𝜶", "𝜷", "𝜸", "𝜹", "𝜺" };*/
/*static const char *tags[] = { "α", "β", "ɣ", "δ", "ε", "ζ", "η", "θ", "ι" };*/
static const char *tags[] = { "α", "β", "ɣ", "δ", "ε" };


static const unsigned int ulinepad	= 0;	/* horizontal padding between the underline and tag */
static const unsigned int ulinestroke	= 0;	/* thickness / height of the underline */
static const unsigned int ulinevoffset	= 0;	/* how far above the bottom of the bar the line should appear */
static const int ulineall 		= 0;	/* 1 to show underline on all tags, 0 for just the active ones */

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Gimp",     NULL,       NULL,       0,            1,           -1 },
	{ "Firefox",  NULL,       NULL,       1 << 1,       0,           -1 },
	{ "brave-browser",  NULL,       NULL,       1 << 1,       0,           -1 },
	{ "thorium-browser",  NULL,       NULL,       1 << 1,       0,           -1 },
  { "pavucontrol",            NULL,       NULL,       0,            1,           -1 },
  { "Pcmanfm",            NULL,       NULL,       0,            1,           -1 },
  { "copyq",            NULL,       NULL,       0,            1,           -1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray0, NULL };
static const char *termcmd[]  = { "st", NULL };

static const char *screeshot[] = { "flameshot", "gui", NULL };
static const char *Telegram[]  = { "telegram-desktop", NULL };
static const char *browser[]   = { "/home/pavel/.config/thorium/thorium", NULL };
static const char *fm[]    = { "pcmanfm", NULL };
static const char *clipboard[]    = { "copyq", "toggle", NULL };

static const char scratchpadname[] = "scratchpad";
static const char *scratchpadcmd[] = { "st", "-t", scratchpadname, "-g", "120x34", NULL };

#include <X11/XF86keysym.h>

static const char *brightness_up[]    =   { "brightnessctl", "-c", "backlight", "set", "+10%",  NULL };
static const char *brightness_down[]  =   { "brightnessctl", "-c", "backlight", "set", "10%-",  NULL };

static const Key keys[] = {
	/* modifier                     key        function        argument */
	//{ MODKEY,                       XK_d,      spawn,          {.v = dmenucmd } },
	{ MODKEY,                       XK_d,      spawn,          SHCMD("rofi -show drun") },
  	{ MODKEY,                       XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY,                       XK_grave,  togglescratch,  {.v = scratchpadcmd } },
  	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_p,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY,                       XK_n,      zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY,                       XK_q,      killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	//TAGKEYS(                        XK_6,                      5)
	//TAGKEYS(                        XK_7,                      6)
	//TAGKEYS(                        XK_8,                      7)
	//TAGKEYS(                        XK_9,                      8)
	{ MODKEY|ShiftMask,             XK_r,      quit,           {0} },

	//own hotkeys
	{ MODKEY,                       XK_v, spawn, 	 {.v = clipboard} },
	{ 0,                            XK_Print, spawn,           {.v = screeshot} },
    	{ MODKEY,                       XK_w,     spawn,           {.v = browser} },
    	TAGKEYS(                        XK_w,                      1)
    	{ MODKEY,                       XK_c,     spawn,           {.v = Telegram} },
    	TAGKEYS(                        XK_c,                      2)
    	{ MODKEY,                       XK_e,     spawn,           {.v = fm} },
    	{ MODKEY,                       XK_o,     spawn,           SHCMD("slock") }, //надо добавить чтоб в гибернейшн переходило
    	{ MODKEY,                       XK_x,     spawn,           SHCMD("pavucontrol") },
    	/* Add to keys[] array. With 0 as modifier, you are able to use the keys directly. */
    	{ 0,                       XF86XK_AudioLowerVolume,        spawn,  SHCMD("pactl set-sink-volume @DEFAULT_SINK@ -5%") },
    	{ 0,                       XF86XK_AudioMute,               spawn,  SHCMD("pactl set-sink-volume @DEFAULT_SINK@ 0%") },
    	{ 0,                       XF86XK_AudioRaiseVolume,        spawn,  SHCMD("pactl set-sink-volume @DEFAULT_SINK@ +5%") },
    	/* To use light add this to the keys[] array. Thanks Hritik14. */
    	{ 0,                      XF86XK_MonBrightnessUp,   spawn, {.v = brightness_up } },
    	{ 0,                      XF86XK_MonBrightnessDown, spawn, {.v = brightness_down } },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};
