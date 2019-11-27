
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
	CONFIG RING_NULL_TILE = 202808;
	void name(char buf, Ring r) //start
	{
		switch(r)
		{
			case RED_RING:
				strcpy(buf, "Red Ring");
				return;
			case RED_RING_P:
				strcpy(buf, "Red Ring (P)");
				return;
			case BLUE_RING:
				strcpy(buf, "Blue Ring");
				return;
			case BLUE_RING_P:
				strcpy(buf, "Blue Ring (P)");
				return;
			case GREEN_RING:
				strcpy(buf, "Green Ring");
				return;
			case GREEN_RING_P:
				strcpy(buf, "Green Ring (P)");
				return;
			case SWORD_RING:
				strcpy(buf, "Sword Ring");
				return;
			case BOW_RING:
				strcpy(buf, "Bow Ring");
				return;
			case PERIL_RING:
				strcpy(buf, "Peril Ring");
				return;
			case PERIL_RING_P:
				strcpy(buf, "Peril Ring (P)");
				return;
			case ARMOR_RING:
				strcpy(buf, "Armor Ring");
				return;
			case ARMOR_RING_P:
				strcpy(buf, "Armor Ring (P)");
				return;
			case POWER_RING:
				strcpy(buf, "Power Ring");
				return;
			case POWER_RING_P:
				strcpy(buf, "Power Ring (P)");
				return;
			case CURSED_RING:
				strcpy(buf, "Cursed Ring");
				return;
			default:
				if(RING_DEBUG) Debug::err("Ring %d has no valid name!",r);
				sprintf(buf, "RING_%d", r);
				return;
		}
	} //end
	void description(char buf, Ring r) //start
	{
		switch(r)
		{
			case RED_RING:
				strcpy(buf, "+1 Attack");
				return;
			case RED_RING_P:
				strcpy(buf, "+1 Attack (Partner)");
				return;
			case BLUE_RING:
				strcpy(buf, "+1 Defense");
				return;
			case BLUE_RING_P:
				strcpy(buf, "+1 Defense (Partner)");
				return;
			case GREEN_RING:
				strcpy(buf, "-1 MP cost (all moves)");
				return;
			case GREEN_RING_P:
				strcpy(buf, "-1 MP cost (all moves) (Partner)");
				return;
			case SWORD_RING:
				strcpy(buf, "+1 sword damage\n-1 bow damage");
				return;
			case BOW_RING:
				strcpy(buf, "+1 bow damage\n-1 sword damage");
				return;
			case PERIL_RING:
				strcpy(buf, "+2 Defense (when in Danger)");
				return;
			case PERIL_RING_P:
				strcpy(buf, "+2 Defense (Partner) (when in Danger)");
				return;
			case ARMOR_RING:
				strcpy(buf, "+1 Defense\n-1 Attack");
				return;
			case ARMOR_RING_P:
				strcpy(buf, "+1 Defense (Partner)\n-1 Attack (Partner)");
				return;
			case POWER_RING:
				strcpy(buf, "+1 Attack\n-1 Defense");
				return;
			case POWER_RING_P:
				strcpy(buf, "+1 Attack (Partner)\n-1 Defense	 (Partner)");
				return;
			case CURSED_RING:
				strcpy(buf, "+2 Attack\nTake 5 damage at the end of your turn");
				return;
			default:
				if(RING_DEBUG) Debug::err("Ring %d has no valid description!",r);
				sprintf(buf, "UNDEFINED_RING %d", r);
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
				return RING_NULL_TILE;
		}
	} //end
	int cost(Ring r) //start	
	{
		switch(r)
		{
			case RED_RING:
				return 6;
			case RED_RING_P:
				return 6;
			case BLUE_RING:
				return 5;
			case BLUE_RING_P:
				return 5;
			case GREEN_RING:
				return 4;
			case GREEN_RING_P:
				return 4;
			case SWORD_RING:
				return 2;
			case BOW_RING:
				return 2;
			case PERIL_RING:
				return 2;
			case PERIL_RING_P:
				return 2;
			case ARMOR_RING:
				return 2;
			case ARMOR_RING_P: 
				return 2;
			case POWER_RING:
				return 2;
			case POWER_RING_P:
				return 2;
			case CURSED_RING:
				return 4;
			//TODO fill out rings
			default:
				if(RING_DEBUG) Debug::err("Ring %d has no valid cost!",r);
				return NULL;
		}
	} //end
	enum SortType
	{
		SORTTYPE_ID,
		SORTTYPE_RP,
		NUM_SORTTYPE
	};
	void loadRingArray(untyped buf, SortType sort, bool ascending, bool equippedOnly) //start
	{
		memset(buf, -1, SizeOfArray(buf));
		int ind = 0;
		switch(sort)
		{
			case SORTTYPE_ID:
				if(ascending)
				{
					for(int q = 0; q < NUM_RINGS; ++q)
					{
						unless(ringinv[q]) continue;
						if(equippedOnly && !rings[q]) continue;
						buf[ind++] = q;
					}
				}
				else
				{
					for(int q = NUM_RINGS-1; q >= 0; --q)
					{
						unless(ringinv[q]) continue;
						if(equippedOnly && !rings[q]) continue;
						buf[ind++] = q;
					}
				}
				break;
			case SORTTYPE_RP:
				int rporder[NUM_RINGS];
				getRPOrder(rporder, ascending);
				for(int q = 0; q < NUM_RINGS; ++q)
				{
					int r = rporder[q];
					unless(ringinv[r]) continue;
					if(equippedOnly && !rings[r]) continue;
					buf[ind++] = r;
				}
				break;
		}
		buf[ind] = -1;
	} //end
	
	void getRPOrder(untyped buf, bool ascending) //start
	{
		int ind = 0;
		for(int q = 0; q < NUM_RINGS; ++q)
		{
			int c = cost(<Ring>q);
			if(ind==0)
				buf[ind++] = q;
			else if(ind==1)
			{
				if(c < cost(buf[0]))
				{
					buf[1] = buf[0];
					buf[0] = q;
				}
				else
				{
					buf[1] = q;
				}
				++ind;
			}
			else
			{
				if(c < cost(buf[0]))
				{
					memmove(buf, 1, buf, 0, ind);
					buf[0] = q;
					++ind;
				}
				else
				{
					for(int f = 1; f < ind; ++f)
					{
						if(c >= cost(buf[f-1]) && c < cost(buf[f]))
						{
							memmove(buf, f+1, buf, f, NUM_RINGS-f-1);
							buf[f] = q;
							++ind;
							break;
						}
						else if(f==ind-1)
						{
							buf[ind++] = q;
							break;
						}
					}
				}
			}
		}
		unless(ascending)
		{
			int foo[NUM_RINGS];
			memcpy(foo, buf, NUM_RINGS);
			int ind;
			for(int q = (NUM_RINGS-1); q >= 0; --q)
			{
				buf[ind++] = foo[q];
			}
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
