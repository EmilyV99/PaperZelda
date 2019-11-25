enum KeyItem
{
	KI_ThisIsATest,
	NUM_KEYITEMS
};

int KeyItem[NUM_KEYITEMS]; //Key item inventory

enum InvItem
{
	RED_JUICE,
	GREEN_JUICE,
	RED_POTION,
	GREEN_POTION,
	DINS_FIRE,
	NAYRUS_LOVE,
	FARORES_WIND,
	NUM_INVITEMS
};
DEFINE MAX_MAX_INV_SIZE = 20; //The max size the inventory can be, including via upgrades (i.e. strange sack)
int Invenory[MAX_MAX_INV_SIZE];
