
namespace BattleEnemy
{
	enum Misc
	{
		NPCMISC_DATA,
		NPCMISC_ISTURN
	};
	enum EnemyData
	{
		ED_HP,
		ED_MP,
		ED_ATK,
		ED_DEF,
		ED_AVO,
		ED_BUFF_DATA,
		ED_DEFENSES,
		ED_ATTACKS,
		ED_FLAGS,
		ED_SZ
	};
	enum EFlag
	{
		EF_SPIKED,
		MAX_EFLAG = 32
	};
	enum AttackData
	{
		ATK_DMG,
		ATK_ELEMENT,
		ATK_FLAGS,
		SZ_ATK_DATA
	};
	DEFINE MAX_ATTACKS = 32;
	DEFINE SZ_ATTACKS = MAX_ATTACKS*SZ_ATK_DATA;
	
	void prepEnemy(npc n) //Do stuff that needs to be done for ALL battle enemies
	{
		n->CollDetection = false;
		n->HitXOffset = 900;
	}
	
	npc script templateBattleEnemy
	{
		void run()
		{
			untyped data[ED_SZ];
			untyped buffdata[Buff::SZ_BUFFS];
			untyped defenses[Element::NUM_ELEMENTS];
			untyped attacks[SZ_ATTACKS];
			this->Misc[NPCMISC_DATA] = data;
			data[ED_BUFF_DATA] = buffdata;
			data[ED_DEFENSES] = defenses;
			data[ED_ATTACKS] = attacks;
			prepEnemy(this);
			enum Attack
			{
				//Fill this with attack constants
				NUM_ATTACKS
			};
			//Fill 'defenses' with elemental defenses
			//Fill 'attacks' with attack data; in form 'attacks[(q*SZ_ATK_DATA)+CONSTANT]' to access a var
			//Set stats; HP, MP, DEF, AVO, and FLAGS
			//Set ->OriginalTile, ->AFrames, etc, for the animation.
			//Set X/Y for position
			while(data[ED_HP] > 0)
			{
				this->Misc[NPCMISC_ISTURN] = false;
				until(this->Misc[NPCMISC_ISTURN])
				{
					//Any stuff needed while idle
					Waitframe();
				}
				//run any start-of-turn-effects
				Attack atk;
				//choose an attack, with some logic
				switch(atk) //Do the attack
				{
					default:
						break;
				}
				//run any end-of-turn-effects
			}
			//Grant star points, death animation
		}
	}
}
