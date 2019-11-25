
enum PlayerData
{
	PD_ATK,
	PD_DEF,
	PD_AVO,
	PD_BUFF_DATA,
	PD_DEFENSES,
	PD_SZ
};

int ringinv[Ring::NUM_RINGS]; //The ring inventory; all rings you have, equipped and unequipped. Value is number owned.
int rings[Ring::NUM_RINGS]; //Your equipped rings. Value is number equipped.
namespace Ring //start
{
	enum Ring //start
	{
		RED_RING,
		RED_RING_P,
		BLUE_RING,
		BLUE_RING_P,
		FIRE_ARROW,
		ICE_ARROW,
		SWORD_RING,
		BOW_RING,
		HEART_RING,
		HEART_RING_P,
		MAGIC_RING,
		FLURRY_RUSH,
		FLOURISH,
		ARROW_RAID,
		PERIL_RING,
		PERIL_RING_P,
		POWER_RING,
		POWER_RING_P,
		ARMOR_RING,
		ARMOR_RING_P,
		HEARTFUL_BLOW,
		HEARTFUL_BLOW_P,
		MAGIC_BLOW,
		MAGIC_BLOW_P,
		CURSED_RING,
		CHARGE_RING,
		CHARGE_RING_P,
		ICE_RING,
		FIRE_RING,
		HOLY_RING,
		DARK_RING,
		SHIELD_RING_P,
		CLOSE_CALL,
		CLOSE_CALL_P,
		FEELING_FINE,
		FEELING_FINE_P,
		GREEN_RING,
		GREEN_RING_P,
		PEGASUS_RING,
		FRIENDSHIP_RING,
		ADRENALINE_RING,
		ELECTRIC_RING,
		EARTH_RING,
		WEALTH_RING,
		HEART_JOY_RING,
		MAGIC_JOY_RING,
		SCAVENGER_RING,
		VICTORY_RING,
		BOMBPROOF_RING,
		SPIN_RING,
		ITEM_RING,
		ITEM_RING_P,
		APPLAUSE_RING,
		APPLAUSE_RING_P,
		QUICK_APPEAL,
		QUICK_APPEAL_P,
		SNIPER_RING,
		EQUIP_RING,
		SWAP_RING,
		COUNTER_RING,
		NUM_RINGS
	}; //end
	CONFIGB RING_DEBUG = false;
	void name(char buf, Ring r) //start
	{
		switch(r)
		{
			case RED_RING:
				strcpy(buf, "Red Ring");
				return;
			//TODO fill out rings
			default:
				if(RING_DEBUG) Debug::err("Ring %d has no valid name!",r);
				sprintf(buf, "RING_%d", r);
				return;
		}
	} //end
	int tile(Ring r) //start
	{
		switch(r)
		{
			case RED_RING:
				return 202840;
			case RED_RING_P:
				return 202841;
			case BLUE_RING:
				return 202820;
			case BLUE_RING_P:
				return 202821;
			case GREEN_RING:
				return 202860;
			case GREEN_RING_P:
				return 202861;
			case SWORD_RING:
				return 202880;
			case BOW_RING:
				return 202900;
			case PERIL_RING:
				return 202920;
			case PERIL_RING_P:
				return 202921;
			case ARMOR_RING:
				return 202940;
			case ARMOR_RING_P: 
				return 202941;
			case POWER_RING:
				return 202960;
			case POWER_RING_P:
				return 202961;
			case CURSED_RING:
				return 202980;
			//CURSED_RING_P does not exist, but has tile 202981
			//TODO fill out rings
			default:
				if(RING_DEBUG) Debug::err("Ring %d has no valid tile!",r);
				return NULL;
		}
	} //end
	int cost(Ring r) //start
	{
		switch(r)
		{
			case RED_RING:
				return 6;
			//TODO fill out rings
			default:
				if(RING_DEBUG) Debug::err("Ring %d has no valid cost!",r);
				return NULL;
		}
	} //end
} //end
typedef Ring::Ring Ring;

int equipment[Equipment::NUM_EQUIPMENT]; //The main equipment items; value is level equipped
namespace Equipment //start
{
	enum Equipment
	{
		INVALID = -1,
		SHIELD,
		SWORD,
		BOW,
		BOOMERANG,
		BOMBS,
		NUM_EQUIPMENT
	};
	
	Equipment get(int num)
	{
		switch(ID[num]->Family)
		{
			case IC_SHIELD:
				return SHIELD;
			case IC_SWORD:
				return SWORD;
			case IC_ARROW:
				return BOW;
			case IC_BRANG:
				return BOOMERANG;
			case IC_BOMB:
				return BOMBS;
			default:
				return INVALID;
		}
	}
} //end
typedef Equipment::Equipment Equipment;
