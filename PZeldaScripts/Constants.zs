
//Settings
CONFIGB DEBUG_LOGGING = true;

//Colors
enum Color
{
	C_TRANS = 0x00,
	C_WHITE = 0x01,
	C_BLUE = 0x0B,
	C_DBLUE = 0x0C,
	C_BLACK = 0x0F,
	C_LINK_LGREEN = 0x68,
	C_LINK_DGREEN = 0x69,
	C_LINKTAB_GREEN = 0x94,
	C_TAN_LIGHT = 0x9D,
	C_TAN_DARK = 0x9E,
	C_G1 = 0xC1,
	C_G2,
	C_G3,
	C_G4,
	C_G5,
	C_G6,
	C_G7,
	C_G8,
	C_G9,
	C_G10,
	C_G11,
	C_G12,
	C_G13,
	C_G14,
	C_G15 = 0xCF
};
typedef const Color COLOR;

typedef const int DEFINE;
typedef const int CONFIG;
typedef const bool CONFIGB;
typedef char32 char;

itemdata ID[MAX_ITEMDATA+1]; //Used for quicker itemdata access
int ProgressMarkers[MAX_INT];
namespace Progress
{
	enum ProgressMarker
	{
		KNOWS_SPIRITORBS,
		VASU
	};
}
typedef Progress::ProgressMarker ProgressMarker;

//Constant names to match the module data
DEFINE IC_CUSTOMREFILL = IC_CUSTOM1;
DEFINE CR_SPIRIT_ORB = CR_SCRIPT1;
DEFINE CR_FORCE_GEM = CR_SCRIPT2;
DEFINE CR_RING_POINTS = CR_SCRIPT3;
DEFINE CR_LEVEL = CR_SCRIPT4;
DEFINE CR_FORCE_POINTS = CR_SCRIPT5;
DEFINE CR_FORCE_POWER = CR_SCRIPT6;
//Tiles/combos
CONFIG TILE_MOUSE_CURSOR = 211840;
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
