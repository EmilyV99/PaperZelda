
enum Partner
{
	NAVI, DEKSTAR, MALISON, GORDON, SOLIA, LIZARUS, TUNKRAD, WINDSOR, STALLA, RALIS,
	NUM_PARTNERS
};
enum P_Data
{
	PT_HP, PT_LEVEL,
	SZ_PDATA
};
DEFINE SZ_PARTNER_DATA = SZ_PDATA*NUM_PARTNERS;

int PartnerData[SZ_PARTNER_DATA];

int PartnerHP(Partner p)
{
	return PartnerData[(p*NUM_PARTNERS)+PT_HP];
}

void addPartnerHP(Partner p, int add)
{
	PartnerData[(p*NUM_PARTNERS)+PT_HP] += add;
}

void PartnerHP(Partner p, int hp)
{
	PartnerData[(p*NUM_PARTNERS)+PT_HP] = hp;
}

void LevelUp(Partner p)
{
	++PartnerData[(p*NUM_PARTNERS)+PT_LEVEL];
}
