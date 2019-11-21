//start Elements
namespace Element
{
	enum Element
	{
		NONE,
		FIRE,
		ICE,
		LIGHT,
		DARK,
		EXPLOSION,
		NUM_ELEMENTS
	};

	Element opposite(Element e)
	{
		switch(e)
		{
			case FIRE: return ICE;
			case ICE: return FIRE;
			case LIGHT: return DARK;
			case DARK: return LIGHT;
			default: return NONE; //No opposite
		}
	}
}
//end Elements
//start Buffs/Debuffs
namespace Buff
{
	enum Buff
	{
		NULL_BUFF,
		CHARGE,
		STATUS_IMMUNE,
		//
		SEALED,
		BURN,
		FROZEN,
		NUM_BUFFS
	};
	DEFINE SZ_BUFFS = NUM_BUFFS*2;
}
typedef Buff::Buff Buff;
//end Buffs/Debuffs

DEFINE MAX_ENEMIES = 5;
npc BattleEnemies[MAX_ENEMIES];

/* TODO
int AttackEnemy(npc n, int dmg, Element e, bool isPartner)
{
	untyped arr = n->Misc[NPCMISC_DATA];
}

int AttackPlayer(npc n, int dmg, Element e, bool isPartner)
{
	untyped arr = n->Misc[NPCMISC_DATA];
	
}*/

