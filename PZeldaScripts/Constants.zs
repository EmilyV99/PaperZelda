
//Settings
CONFIGB DEBUG_LOGGING = true;

//Colors
enum Color
{
	C_TRANS = 0x00,
	C_WHITE = 0x01,
	C_BLACK = 0x0F,
	C_LINK_GREEN = 0x94,
	C_TAN_LIGHT = 0x9D,
	C_TAN_DARK = 0x9E
};
typedef const Color COLOR;

typedef const int DEFINE;
typedef const int CONFIG;
typedef const bool CONFIGB;
typedef char32 char;

itemdata ID[MAX_ITEMDATA+1]; //Used for quicker itemdata access

//Constant names to match the module data
DEFINE IC_CUSTOMREFILL = IC_CUSTOM1;
DEFINE CR_SPIRIT_ORB = CR_SCRIPT1;
DEFINE CR_FORCE_GEM = CR_SCRIPT2;
DEFINE CR_RING_POINTS = CR_SCRIPT3;
DEFINE CR_LEVEL = CR_SCRIPT4;
DEFINE CR_FORCE_POINTS = CR_SCRIPT5;
DEFINE CR_FORCE_POWER = CR_SCRIPT6;
//Tiles/combos
CONFIG TILE_CURSOR = 214499;
CONFIG TILE_FORCE_POWER = 208820;
//
enum ITID
{
	IT_RUP_20 = 86,
	IT_SPIRIT_ORB = 143,
	IT_FORCE_GEM = 144,
	NUM_ITID = 256
};
//
/*untyped GameVars[NUM_GAMEVAR];
enum GVar
{
	
	NUM_GAMEVAR
};*/
