/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  = 2;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const unsigned int gappih    = 10;       /* horiz inner gap between windows */
static const unsigned int gappiv    = 10;       /* vert inner gap between windows */
static const unsigned int gappoh    = 10;       /* horiz outer gap between windows and screen edge */
static const unsigned int gappov    = 10;       /* vert outer gap between windows and screen edge */
static const int smartgaps          = 1;        /* 1 means no outer gap when there is only one window */
static const unsigned int systraypinning = 0;   /* 0: sloppy systray follows selected monitor, >0: pin systray to monitor X */
static const unsigned int systrayonleft = 0;   	/* 0: systray in the right corner, >0: systray on left of status text */
static const unsigned int systrayspacing = 2;   /* systray spacing */
static const int systraypinningfailfirst = 1;   /* 1: if pinning fails, display systray on the first monitor, False: display systray on the last monitor*/
static const int showsystray        = 1;     /* 0 means no systray */
static const int showbar            = 1;     /* 0 means no bar */
static const int topbar             = 1;     /* 0 means bottom bar */
static const int focusonwheel       = 0;
static const char *fonts[]          = { "monospace:size=10" };
static const char dmenufont[]       = "monospace:size=10";
static const char col_gray1[]       = "#282a36";
static const char col_gray2[]       = "#504945";
static const char col_gray3[]       = "#bdae93";
static const char col_gray4[]       = "#ebdbb2";
static const char col_cyan[]        = "#cc241d";
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray3, col_gray1, col_gray1 },
	[SchemeSel]  = { col_gray4, col_gray2,  col_gray4  },
};
static const char *volup[] = { "volume.sh", "up", NULL };
static const char *voldw[] = { "volume.sh", "down", NULL };
static const char *lock[] = { "slock", NULL };
static const char *browser[] = { "firefox", NULL };
static const char *pymor[] = { "pymor","-p", "20", "-l", "3", NULL };

typedef struct {
       const char *name;
       const void *cmd;
} Sp;
const char *spcmd1[] = {"st", "-n", "spterm", "-g", "50x34", NULL };
const char *spcmd2[] = {"st", "-n", "spfm", "-g", "144x41", "-e", "sfm", NULL };
const char *spcmd3[] = {"st", "-n", "btop", "-g", "144x41", "-e", "btop", NULL };
static Sp scratchpads[] = {
       /* name          cmd  */
       {"spterm",      spcmd1},
       {"spfm",        spcmd2},
       {"btop",        spcmd3},
};


/* tagging */
static const char *tags[] = { "a", "s", "d", "f", "h", "j", "k", "l" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor    float x,y,w,h         floatborderpx*/
        { "Gimp",     NULL,       NULL,       0,            1,           -1,        50,50,500,500,        5 },
        { "Firefox",  NULL,       NULL,       1 << 8,       0,           -1,        50,50,500,500,        5 },
        { "Safeeyes",  NULL,       NULL,      1 << 8,       1,           -1,        50,50,1500,1500,        5 },

        { NULL,       "spterm",   NULL,       SPTAG(0),     1,           -1, 	    150,50,800,300},
        { NULL,       "spfm",     NULL,       SPTAG(1),     1,           -1, 	    150,50,800,600},
        { NULL,       "btop",     NULL,       SPTAG(2),     1,           -1, 	    50,50,800,600},
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define MODKEY2 Mod1Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY2,                      KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL };
static const char *termcmd[]  = { "st", "-A 100", NULL };

static Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY|ShiftMask,             XK_p,      spawn,          {.v = dmenucmd } },
	{ MODKEY2|ShiftMask,            XK_p,      spawn,          {.v = dmenucmd } },
	{ MODKEY,             		      XK_t, 	   spawn,          {.v = termcmd } },
	{ MODKEY|ShiftMask,             XK_u,      spawn,          {.v = volup } },
	{ MODKEY|ShiftMask,             XK_g,      spawn,          {.v = pymor } },
	{ MODKEY|ShiftMask,             XK_d,      spawn,          {.v = voldw } },
	{ MODKEY|ControlMask,           XK_l,      spawn,          {.v = lock } },
	{ MODKEY,                       XK_w,      spawn,          {.v = browser } },
	{ MODKEY|ShiftMask,             XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_u,      togglescratch,  {.ui = 0 } },
	{ MODKEY|ShiftMask,             XK_m,      togglescratch,  {.ui = 1 } },
	{ MODKEY|ShiftMask,             XK_t,      togglescratch,  {.ui = 2 } },
	{ MODKEY,                       XK_n,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_p,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_m,      setmfact,       {.f = +0.05} },
	{ MODKEY,                       XK_1,      incrgaps,       {.i = +1 } },
	{ MODKEY,                       XK_2,      incrgaps,       {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_1,      incrogaps,      {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_2,      incrogaps,      {.i = -1 } },
	{ MODKEY|ControlMask,           XK_1,      incrigaps,      {.i = +1 } },
	{ MODKEY|ControlMask,           XK_2,      incrigaps,      {.i = -1 } },
	{ MODKEY,                       XK_0,      togglegaps,     {0} },
	{ MODKEY|ShiftMask,             XK_0,      defaultgaps,    {0} },
	{ MODKEY,                       XK_y,      incrihgaps,     {.i = +1 } },
	{ MODKEY,                       XK_o,      incrihgaps,     {.i = -1 } },
	{ MODKEY|ControlMask,           XK_y,      incrivgaps,     {.i = +1 } },
	{ MODKEY|ControlMask,           XK_o,      incrivgaps,     {.i = -1 } },
	{ MODKEY|Mod4Mask,              XK_y,      incrohgaps,     {.i = +1 } },
	{ MODKEY|Mod4Mask,              XK_o,      incrohgaps,     {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_y,      incrovgaps,     {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_o,      incrovgaps,     {.i = -1 } },
	{ MODKEY,                       XK_Return, zoom,           {0} },
	{ MODKEY|ControlMask,           XK_f,  	   focusmaster,    {0} },
	{ MODKEY,                       XK_r,      view,           {0} },
	{ MODKEY,             		      XK_c,      killclient,     {0} },
	{ MODKEY,                       XK_f,      setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_f,      togglefloating, {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	TAGKEYS(                        XK_a,                      0)
	TAGKEYS(                        XK_s,                      1)
	TAGKEYS(                        XK_d,                      2)
	TAGKEYS(                        XK_f,                      3)
	TAGKEYS(                        XK_h,                      4)
	TAGKEYS(                        XK_j,                      5)
	TAGKEYS(                        XK_k,                      6)
	TAGKEYS(                        XK_l,                      7)
	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button1,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

