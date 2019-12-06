
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
		LEECH_RING,
		LEECH_RING_P,
		SIPHON_RING,
		SIPHON_RING_P,
		CURSED_RING,
		CHARGE_RING,
		CHARGE_RING_P,
		ICE_RING,
		FIRE_RING,
		LIGHT_RING,
		DARK_RING,
		SHIELD_RING_P,
		CLUTCH_RING,
		CLUTCH_RING_P,
		RESIST_RING,
		RESIST_RING_P,
		GREEN_RING,
		GREEN_RING_P,
		PEGASUS_RING,
		FRIENDSHIP_RING,
		ADRENALINE_RING,
		ELECTRIC_RING,
		EARTH_RING,
		WEALTH_RING,
		JOY_RING,
		SALVAGE_RING,
		SCAVENGE_RING,
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
		LUCK_RING,
		LUCK_RING_P,
		DODGE_RING,
		DODGE_RING_P,
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
			case LUCK_RING:
				strcpy(buf, "Luck Ring");
				return;
			case LUCK_RING_P:
				strcpy(buf, "Luck Ring (P)");
				return;
			case CLUTCH_RING:
				strcpy(buf, "Clutch Ring");
				return;
			case CLUTCH_RING_P:
				strcpy(buf, "Clutch Ring (P)");
				return;
			case DODGE_RING:
				strcpy(buf, "Dodge Ring");
				return;
			case DODGE_RING_P:
				strcpy(buf, "Dodge Ring (P)");
				return;
			case FIRE_RING:
				strcpy(buf, "Fire Ring");
				return;
			case ICE_RING:
				strcpy(buf, "Ice Ring");
				return;
			case EARTH_RING:
				strcpy(buf, "Earth Ring");
				return;
			case ELECTRIC_RING:
				strcpy(buf, "Electric Ring");
				return;
			case LIGHT_RING:
				strcpy(buf, "Light Ring");
				return;
			case DARK_RING:
				strcpy(buf, "Dark Ring");
				return;
			case HEART_RING:
				strcpy(buf, "Heart Ring");
				return;
			case HEART_RING_P:
				strcpy(buf, "Heart Ring (P)");
				return;
			case MAGIC_RING:
				strcpy(buf, "Magic Ring");
				return;
			case LEECH_RING:
				strcpy(buf, "Leech Ring");
				return;
			case LEECH_RING_P:
				strcpy(buf, "Leech Ring (P)");
				return;
			case SIPHON_RING:
				strcpy(buf, "Siphon Ring");
				return;
			case SIPHON_RING_P:
				strcpy(buf, "Siphon Ring (P)");
				return;
			case SHIELD_RING_P:
				strcpy(buf, "Shield Ring (P)");
				return;
			case RESIST_RING:
				strcpy(buf, "Resist Ring");
				return;
			case RESIST_RING_P:
				strcpy(buf, "Resist Ring (P)");
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
				strcpy(buf, "+1 Attack (Partner)\n-1 Defense (Partner)");
				return;
			case CURSED_RING:
				strcpy(buf, "+2 Attack\nTake 5 damage at the end of your turn");
				return;
			case LUCK_RING:
				strcpy(buf, "+10% Avo");
				return;
			case LUCK_RING_P:
				strcpy(buf, "+10% Avo (Partner)");
				return;
			case CLUTCH_RING:
				strcpy(buf, "+20% Avo when in Danger");
				return;
			case CLUTCH_RING_P:
				strcpy(buf, "+20% Avo when in Danger (Partner)");
				return;
			case DODGE_RING:
				strcpy(buf, "+20% Avo");
				return;
			case DODGE_RING_P:
				strcpy(buf, "+20% Avo (Partner)");
				return;
			case FIRE_RING:
				strcpy(buf, "+1 Def vs Fire; +1 Atk with Fire; +1 Dmg vs Ice");
				return;
			case ICE_RING:
				strcpy(buf, "+1 Def vs Ice; +1 Atk with Ice; +1 Dmg vs Fire");
				return;
			case EARTH_RING:
				strcpy(buf, "+1 Def vs Earth; +1 Atk with Earth; +1 Dmg vs Electric");
				return;
			case ELECTRIC_RING:
				strcpy(buf, "+1 Def vs Electric; +1 Atk with Electric; +1 Dmg vs Earth");
				return;
			case LIGHT_RING:
				strcpy(buf, "+1 Def vs Light; +1 Atk with Light; +1 Dmg vs Dark");
				return;
			case DARK_RING:
				strcpy(buf, "+1 Def vs Dark; +1 Atk with Dark; +1 Dmg vs Light");
				return;
			case HEART_RING:
				strcpy(buf, "Regenerate 1 HP per turn");
				return;
			case HEART_RING_P:
				strcpy(buf, "Regenerate 1 HP per turn (Partner)");
				return;
			case MAGIC_RING:
				strcpy(buf, "Regenerate 1 MP per turn");
				return;
			case LEECH_RING:
				strcpy(buf, "Recover 1 HP per attack\n-1 Atk");
				return;
			case LEECH_RING_P:
				strcpy(buf, "Recover 1 HP per attack\n-1 Atk (Partner)");
				return;
			case SIPHON_RING:
				strcpy(buf, "Recover 1 MP per attack\n-1 Atk");
				return;
			case SIPHON_RING_P:
				strcpy(buf, "Recover 1 MP per attack\n-1 Atk (Partner)");
				return;
			case SHIELD_RING_P:
				strcpy(buf, "Extra -1 Dmg taken when guarding (Partner)");
				return;
			case RESIST_RING:
				strcpy(buf, "Grants status immunity");
				return;
			case RESIST_RING_P:
				strcpy(buf, "Grants status immunity (Partner)");
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
			case LUCK_RING:
				return 203000;
			case LUCK_RING_P:
				return 203001;
			case CLUTCH_RING:
				return 203020;
			case CLUTCH_RING_P:
				return 203021;
			case DODGE_RING:
				return 203040;
			case DODGE_RING_P:
				return 203041;
			case FIRE_RING:
				return 202825;
			case ICE_RING:
				return 202845;
			case EARTH_RING:
				return 202865;
			case ELECTRIC_RING:
				return 202885;
			case LIGHT_RING:
				return 202905;
			case DARK_RING:
				return 202925;
			case HEART_RING:
				return 202945;
			case HEART_RING_P:
				return 202946;
			case MAGIC_RING:
				return 202965;
			case LEECH_RING:
				return 202985;
			case LEECH_RING_P:
				return 202986;
			case SIPHON_RING:
				return 203005;
			case SIPHON_RING_P:
				return 203006;
			case SHIELD_RING_P:
				return 203026;
			case RESIST_RING:
				return 203045;
			case RESIST_RING_P:
				return 203046;
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
			case LUCK_RING:
				return 2;
			case LUCK_RING_P:
				return 2;
			case CLUTCH_RING:
				return 1;
			case CLUTCH_RING_P:
				return 1;
			case DODGE_RING:
				return 4;
			case DODGE_RING_P:
				return 4;
			case FIRE_RING:
				return 1;
			case ICE_RING:
				return 1;
			case EARTH_RING:
				return 1;
			case ELECTRIC_RING:
				return 1;
			case LIGHT_RING:
				return 1;
			case DARK_RING:
				return 1;
			case HEART_RING:
				return 2;
			case HEART_RING_P:
				return 2;
			case MAGIC_RING:
				return 2;
			case LEECH_RING:
				return 1;
			case LEECH_RING_P:
				return 1;
			case SIPHON_RING:
				return 1;
			case SIPHON_RING_P:
				return 1;
			case SHIELD_RING_P:
				return 2;
			case RESIST_RING:
				return 4;
			case RESIST_RING_P:
				return 4;
			//TODO fill out rings
			default:
				if(RING_DEBUG) Debug::err("Ring %d has no valid cost!",r);
				return NULL;
		}
	} //end
	int max(Ring r) //start	
	{
		switch(r)
		{
			case RED_RING:
			case RED_RING_P:
			case BLUE_RING:
			case BLUE_RING_P:
			case GREEN_RING:
			case GREEN_RING_P:
			case SWORD_RING:
			case BOW_RING:
			case PERIL_RING:
			case PERIL_RING_P:
			case ARMOR_RING:
			case ARMOR_RING_P: 
			case POWER_RING:
			case POWER_RING_P:
			case CURSED_RING:
			case HEART_RING:
			case HEART_RING_P:
			case MAGIC_RING:
			case LEECH_RING:
			case LEECH_RING_P:
			case SIPHON_RING:
			case SIPHON_RING_P:
			case SHIELD_RING_P:
				return MAX_INT; //Stackable to no limit
			case LUCK_RING:
				return 1;
			case LUCK_RING_P:
				return 1;
			case CLUTCH_RING:
				return 1;
			case CLUTCH_RING_P:
				return 1;
			case DODGE_RING:
				return 1;
			case DODGE_RING_P:
				return 1;
			case FIRE_RING:
				return 1;
			case ICE_RING:
				return 1;
			case EARTH_RING:
				return 1;
			case ELECTRIC_RING:
				return 1;
			case LIGHT_RING:
				return 1;
			case DARK_RING:
				return 1;
			case RESIST_RING:
				return 1;
			case RESIST_RING_P:
				return 1;
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
