
namespace Partner
{
	void init()
	{
		GameVars[CURR_PARTNER] = NULL_PARTNER;
	}
	
	enum Partner
	{
		NULL_PARTNER = -1, NAVI, DEKSTAR, MALISON, GORDON, SOLIA, LIZARUS, TUNKRAD, WINDSOR, STALLA, RALIS,
		NUM_PARTNERS
	};
	enum P_Data
	{
		PT_MAXHP, PT_HP, PT_LEVEL,
		SZ_PDATA
	};
	DEFINE SZ_PARTNER_DATA = SZ_PDATA*NUM_PARTNERS;

	int PartnerData[SZ_PARTNER_DATA];

	int HP(Partner p)
	{
		return PartnerData[(p*SZ_PDATA)+PT_HP];
	}

	void addHP(Partner p, int add)
	{
		PartnerData[(p*SZ_PDATA)+PT_HP] = Min(PartnerData[(p*SZ_PDATA)+PT_MAXHP], PartnerData[(p*SZ_PDATA)+PT_HP]+add);
	}

	void HP(Partner p, int hp)
	{
		PartnerData[(p*SZ_PDATA)+PT_HP] = hp;
	}

	void LevelUp(Partner p)
	{
		++PartnerData[(p*SZ_PDATA)+PT_LEVEL];
	}
}
typedef Partner::Partner Partner;
