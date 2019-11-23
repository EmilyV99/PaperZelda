
enum PlayerData
{
	PD_ATK,
	PD_DEF,
	PD_AVO,
	PD_BUFF_DATA,
	PD_DEFENSES,
	PD_SZ
};

int ringinv[Rings::NUM_RINGS]; //The ring inventory; all rings you have, equipped and unequipped. Value is number owned.
int rings[Rings::NUM_RINGS]; //Your equipped rings. Value is number equipped.
namespace Rings //start
{
	enum Ring
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
		BRAZEN_RING,
		CAREFUL_RING,
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
		MAGIC_SAVER,
		MAGIC_SAVER_P,
		PEGASUS_RING,
		FRIENDSHIP_RING,
		ADRENALINE_RING,
		NUM_RINGS
	};
} //end
typedef Rings::Ring Ring;

int equipment[Equipment::NUM_EQUIPMENT]; //The main equipment items; value is level equipped
namespace Equipment //start
{
	enum Equipment
	{
		SHIELD,
		SWORD,
		BOW,
		BOOMERANG,
		BOMBS,
		NUM_EQUIPMENT
	};
} //end
typedef Equipment::Equipment Equipment;
