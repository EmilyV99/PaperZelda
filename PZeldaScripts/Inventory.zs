DEFINE MAX_MAX_INV_SIZE = 20; //The max size the inventory can be, including via upgrades (i.e. strange sack)
DEFINE START_INV_SIZE = 10;
InvItem Inventory[MAX_MAX_INV_SIZE];
int KeyInv[Item::NUM_KEYITEMS]; //Key item inventory
namespace Item
{
	void init()
	{
		int q;
		for(; q < START_INV_SIZE; ++q)
		{
			Inventory[q] = INV_NULL; //Valid, but empty, slots
		}
		for(; q < MAX_MAX_INV_SIZE; ++q)
		{
			Inventory[q] = INV_INVALID; //Invalid slots; cannot recieve an item (Higher than max inventory size)
		}
	}
	
	enum KeyItem
	{
		KI_ThisIsATest,
		NUM_KEYITEMS
	};
	
	enum InvItem
	{
		INV_INVALID = -1,
		INV_NULL,
		RED_JUICE,
		GREEN_JUICE,
		RED_POTION,
		GREEN_POTION,
		DINS_FIRE,
		NAYRUS_LOVE,
		FARORES_WIND,
		NUM_INVITEMS
	};
	
	CONFIGB ITEM_DEBUG = false;
	CONFIG ITEM_NULL_TILE = 202808;
	void name(char buf, KeyItem it) //start
	{
		switch(it)
		{
			default:
				if(ITEM_DEBUG) Debug::err("KeyItem %d has no valid name!",it);
				sprintf(buf, "KEYITEM_%d", it);
				return;
		}
	} //end
	void name(char buf, InvItem it) //start
	{
		switch(it)
		{
			case INV_INVALID:
			case INV_NULL:
				return;
			case RED_JUICE:
				strcpy(buf, "Red Juice");
				return;
			case GREEN_JUICE:
				strcpy(buf, "Green Juice");
				return;
			case RED_POTION:
				strcpy(buf, "Red Potion");
				return;
			case GREEN_POTION:
				strcpy(buf, "Green Potion");
				return;
			case DINS_FIRE:
				strcpy(buf, "Din's Fire");
				return;
			case NAYRUS_LOVE:
				strcpy(buf, "Nayru's Love");
				return;
			case FARORES_WIND:
				strcpy(buf, "Farore's Wind");
				return;
			default:
				if(ITEM_DEBUG) Debug::err("InvItem %d has no valid name!",it);
				sprintf(buf, "INVITEM_%d", it);
				return;
		}
	} //end
	void description(char buf, KeyItem it) //start
	{
		switch(it)
		{
			default:
				if(ITEM_DEBUG) Debug::err("KeyItem %d has no valid description!",it);
				sprintf(buf, "UNDEFINED_KEYITEM %d", it);
				return;
		}
	} //end
	void description(char buf, InvItem it) //start
	{
		switch(it)
		{
			case INV_INVALID:
			case INV_NULL:
				return;
			case RED_JUICE:
				strcpy(buf, "Restores 10 HP");
				return;
			case GREEN_JUICE:
				strcpy(buf, "Restores 5 MP");
				return;
			case RED_POTION:
				strcpy(buf, "Restores 20 HP");
				return;
			case GREEN_POTION:
				strcpy(buf, "Restores 10 MP");
				return;
			case DINS_FIRE:
				strcpy(buf, "Deals # Fire Damage to All Foes");
				return;
			case NAYRUS_LOVE:
				strcpy(buf, "Grants Dodgy to 1 Ally");
				return;
			case FARORES_WIND:
				strcpy(buf, "In Battle: Escape Battle\nOut of Battle: Escape Dungeon");
				return;
			default:
				if(ITEM_DEBUG) Debug::err("InvItem %d has no valid description!",it);
				sprintf(buf, "UNDEFINED_INVITEM %d", it);
				return;
		}
	} //end
	int tile(KeyItem it) //start
	{
		switch(it)
		{
			default:
				if(ITEM_DEBUG) Debug::err("KeyItem %d has no valid tile!",it);
				return ITEM_NULL_TILE;
		}
	} //end
	int tile(InvItem it) //start
	{
		switch(it)
		{
			case INV_INVALID:
			case INV_NULL:
				return NULL;
			case RED_JUICE:
			case GREEN_JUICE:
			case RED_POTION:
			case GREEN_POTION:
			case DINS_FIRE:
			case NAYRUS_LOVE:
			case FARORES_WIND:
			default:
				if(ITEM_DEBUG) Debug::err("InvItem %d has no valid tile!",it);
				return ITEM_NULL_TILE;
		}
	} //end
	bool outOfBattle(KeyItem it) //start
	{
		switch(it)
		{
			default:
				if(ITEM_DEBUG) Debug::err("KeyItem %d is not set up!",it);
				return false;
		}
	} //end
	bool outOfBattle(InvItem it) //start
	{
		switch(it)
		{
			case INV_INVALID:
			case INV_NULL:
			case DINS_FIRE:
			case NAYRUS_LOVE:
				return false;
			case RED_JUICE:
			case GREEN_JUICE:
			case RED_POTION:
			case GREEN_POTION:
				return true;
			case FARORES_WIND:
				//Can be true or false depending on your current location! ...for now, just false.
				return false;
			default:
				if(ITEM_DEBUG) Debug::err("InvItem %d is not set up!",it);
				return false;
		}
	} //end
	bool use(KeyItem it) //start
	{
		switch(it)
		{
			default:
				if(ITEM_DEBUG) Debug::err("KeyItem %d has no set up use!",it);
				return false;
		}
	} //end
	bool use(InvItem it) //start
	{
		switch(it)
		{
			case INV_INVALID:
			case INV_NULL:
				return false;
			case DINS_FIRE:
			case NAYRUS_LOVE:
				//battle only; add effects later!
				return false;
			case RED_JUICE:
				return false;
			case RED_POTION:
				return false;
			case GREEN_JUICE:
				Game->DCounter[CR_MAGIC] -= 5;
				//Add GFX later
				return true;
			case GREEN_POTION:
				Game->DCounter[CR_MAGIC] -= 10;
				//Add GFX later
				return true;
			case FARORES_WIND:
				//Add effects later!
				return false;
			default:
				if(ITEM_DEBUG) Debug::err("InvItem %d has no set up use!",it);
				return false;
		}
	} //end
	//start Give items
	bool give(KeyItem it)
	{
		++KeyInv[it];
		return true;
	}
	bool give(KeyItem it, int num)
	{
		KeyInv[it] += num;
		return true;
	}
	bool give(InvItem it)
	{
		for(int q = 0; q < MAX_MAX_INV_SIZE && Inventory[q] != INV_INVALID; ++q)
		{
			if(Inventory[q] == INV_NULL)
			{
				Inventory[q] = it;
				sort();
				return true;
			}
		}
		return false;
	}
	bool give(InvItem it, int num)
	{
		unless(has(INV_NULL, num)) return false;
		for(int q = 0; q < MAX_MAX_INV_SIZE && Inventory[q] != INV_INVALID; ++q)
		{
			if(Inventory[q] == INV_NULL)
			{
				Inventory[q] = it;
				unless(--num) break;
			}
		}
		sort();
		return true;
	}
	//end
	//start Check for items in inventory
	bool has(InvItem it)
	{
		for(int q = 0; q < MAX_MAX_INV_SIZE && Inventory[q] != INV_INVALID; ++q)
		{
			if(Inventory[q] == it)
			{
				return true;
			}
		}
		return false;
	}
	bool has(InvItem it, int num)
	{
		int found;
		for(int q = 0; q < MAX_MAX_INV_SIZE && Inventory[q] != INV_INVALID; ++q)
		{
			if(Inventory[q] == it)
			{
				++found;
			}
		}
		return found >= num;
	}
	bool has(KeyItem it)
	{
		return KeyInv[it] > 0;
	}
	bool has(KeyItem it, int num)
	{
		return KeyInv[it] >= num;
	}
	//end
	//start Take away items
	bool take(InvItem it)
	{
		for(int q = 0; q < MAX_MAX_INV_SIZE && Inventory[q] != INV_INVALID; ++q)
		{
			if(Inventory[q] == it)
			{
				Inventory[q] = INV_NULL;
				normalize();
				return true;
			}
		}
		return false;
	}
	bool take(InvItem it, int num)
	{
		unless(has(it, num)) return false;
		for(int q = 0; q < MAX_MAX_INV_SIZE && Inventory[q] != INV_INVALID; ++q)
		{
			if(Inventory[q] == it)
			{
				Inventory[q] = INV_NULL;
				unless(--num) break;
			}
		}
		normalize();
		return true;
	}
	bool take(KeyItem it)
	{
		if(KeyInv[it] > 0)
		{
			--KeyInv[it];
			return true;
		}
		return false;
	}
	bool take(KeyItem it, int num)
	{
		if(KeyInv[it] >= num)
		{
			KeyInv[it] -= num;
			return true;
		}
		return false;
	}
	//end
	void normalize() //start Normalizes the inventory, forcing empty slots to the bottom
	{
		for(int q = 1; q < MAX_MAX_INV_SIZE; ++q)
		{
			if(Inventory[q] == INV_INVALID) return;
			if(Inventory[q-1] == INV_NULL)
			{
				Inventory[q-1] = Inventory[q];
				Inventory[q] = INV_NULL;
			}
		}
	} //end
	void sort() //start Sort by ID
	{
		InvItem tmp[MAX_MAX_INV_SIZE];
		int indx;
		for(InvItem it = <InvItem>1; it < NUM_INVITEMS; it = <InvItem>(it+1))
		{
			for(int q = 0; q < MAX_MAX_INV_SIZE; ++q)
			{
				if(Inventory[q] == it)
				{
					tmp[indx++] = it;
				}
				if(Inventory[q] == INV_INVALID) break;
			}
		}
		for(int q = 0; q < MAX_MAX_INV_SIZE; ++q)
		{
			if(Inventory[q] == INV_INVALID)
				tmp[q] = INV_INVALID;
		}
		memcpy(Inventory, tmp, MAX_MAX_INV_SIZE);
	} //end
}
typedef Item::InvItem InvItem;
typedef Item::KeyItem KeyItem;
