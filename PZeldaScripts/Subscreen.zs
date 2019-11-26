
dmapdata script PassiveSubscreen
{
	void run()
	{
		//Read anything dmap-specific here, using the 'this' pointer.
		while(true)
		{
			//TODO Anything that needs doing every frame, mostly draws.
			Waitframe();
		}
	}
}

dmapdata script ActiveSubscreen
{
	using namespace PlayTime;
	//start Constants
	//start General Constants
	DEFINE SCREENWID = 256;
	DEFINE SCREENHEI = 224;
	DEFINE TILE_PER_PAGE = 260;
	DEFINE TILE_PER_ROW = 20;
	COLOR BG_COLOR = C_TRANS;
	CONFIG FADETIME = 30; //Time, in frames, of the opening/closing animation
	CONFIG SBG_TWID = 16;
	CONFIG SBG_THEI = 10;
	CONFIG SBG_PX_HEIGHT = (16*SBG_THEI)-4;
	CONFIG SBG_PX_WIDTH = (16*SBG_TWID)-12;
	CONFIG SBG_X = 0;
	CONFIG SBG_Y = ((SCREENHEI/2)-(SBG_PX_HEIGHT/2));
	CONFIGB NO_PASSIVE = true;
	CONFIG MENU_SMALLFONT = FONT_Z3SMALL;//FONT_MARIOLAND;
	CONFIG MENU_SMALLFONT_HEIGHT = FONT_Z3SMALL_HEIGHT;//FONT_MARIOLAND_HEIGHT;
	//
	CONFIGB DEBUG_OUTPUT_BG_BITMAP = false;
	CONFIGB DEBUG_MOUSE_STUFF = true;
	// Tiles / Combos
	CONFIG SBG_TILE_TAB_START = 211640;
	CONFIG TILE_NUMBERS = 211390;
	CONFIG TILE_COLON = 211389;
	CONFIG TILE_MINUS = 211388;
	CONFIG TILE_SLASH = 211387;
	CONFIG NUMBERTILE_WID = 6;
	CONFIG NUMBERTILE_HEI = 8;
	CONFIG NUMBERTILE_SPACING = 1;
	CONFIG COMBO_MENU_CURSOR = 65029;
	CONFIG MENUCURSOR_WID = 8;
	CONFIG MENUCURSOR_HEI = 8;
	//
	DEFINE SBG_BOX_BORDER_PX = 2;
	COLOR SBG_BOX_CDARK = C_TAN_DARK;
	COLOR SBG_BOX_CLIGHT = C_TAN_LIGHT;
	//end General Constants
	//start Link Tab Constants
	CONFIG LINK_SMALLFONT = FONT_MARIOLAND;
	CONFIG LINK_SMALLFONT_HEIGHT = FONT_MARIOLAND_HEIGHT;
	//
	CONFIG BX_FORCE_POWER = 123;
	CONFIG BY_FORCE_POWER = 58;
	CONFIG BPW_FORCE_POWER = 7*16;
	CONFIG BPH_FORCE_POWER = 2*16;
	CONFIG TILE_FORCEPOWER_ICON = 208819;
	CONFIG TILE_SPECIALMOVE_ICON = 208859;
	CONFIG TILE_TEXT_SPECIAL = 211380;
	CONFIG TEXT_SPECIAL_TILEWIDTH = 3;
	//
	CONFIG BX_CTRS = BX_FORCE_POWER;
	CONFIG BY_CTRS = BY_FORCE_POWER + 38;
	CONFIG BPW_CTRS = BPW_FORCE_POWER;
	CONFIG BPH_CTRS = 5*16 + 2;
	CONFIG COMBO_SPIRIT_ORB = 65024;
	CONFIG COMBO_FORCE_GEM = 65025;
	CONFIG COMBO_FORCE_POINT = 65026;
	CONFIG COMBO_RUPEE = 65027;
	CONFIG COMBO_CLOCK = 65028;
	CONFIG TILE_TEXT_FPTS = 211400;
	CONFIG TEXT_FPTS_TILEWIDTH = 4;
	CONFIG TILE_TEXT_RUPEES = 211420;
	CONFIG TEXT_RUPEES_TILEWIDTH = 3;
	CONFIG TILE_TEXT_FORCEGEM = 211440;
	CONFIG TEXT_FORCEGEM_TILEWIDTH = 4;
	CONFIG TILE_TEXT_SPIRITORB = 211460;
	CONFIG TEXT_SPIRITORB_TILEWIDTH = 5;
	//
	CONFIG BX_LVL = 17;
	CONFIG BY_LVL = 55;
	CONFIG BPW_LVL = 90;//70;
	CONFIG BPH_LEVEL = 4+LINK_SMALLFONT_HEIGHT;
	//
	CONFIG BPW_LINKSPRITE = 2*16;
	CONFIG BPH_LINKSPRITE = 3*16;
	CONFIG BX_LINKSPRITE = BX_LVL + (BPW_LVL/2) - (BPW_LINKSPRITE/2);
	CONFIG BY_LINKSPRITE = BY_LVL + BPH_LEVEL + 4;
	//
	CONFIG TILE_HEART = 208899;
	CONFIG TILE_MAGIC = 208919;
	CONFIG TILE_RING = 208939;
	CONFIG TILE_TEXT_HP = 211480;
	CONFIG TILE_TEXT_MP = 211500;
	CONFIG TILE_TEXT_RP = 211520;
	CONFIG BX_STATS = 15;
	CONFIG BY_STATS = 122;
	CONFIG BPW_STATS = 95;
	CONFIG BPH_STATS = 8+(16*3);
	//end Link Tab Constants
	//start Ring Tab Constants
	CONFIG END_BX_RINGS = 236;
	CONFIG END_BY_RINGS = 183;
	CONFIG BW_RINGS = 170;
	CONFIG BH_RINGS = 130;
	CONFIG BX_RINGS = END_BX_RINGS - BW_RINGS;
	CONFIG BY_RINGS = END_BY_RINGS - BH_RINGS;
	CONFIG RING_RP_WID = 16;
	CONFIG RING_EQ_WID = 40;
	CONFIG RING_TILE_X = 5;
	CONFIG RING_TILE_HEIGHT = 16;
	CONFIG RING_TILE_SPACE = 1;
	CONFIG RING_TEXT_X = RING_TILE_X + 18;
	CONFIG RING_TEXT_YOFF = 4;
	CONFIG RING_EQ_X = BW_RINGS  - RING_EQ_WID;
	CONFIG RING_RP_X = RING_EQ_X - RING_RP_WID;
	CONFIG RING_COL_LABEL_Y = 3;
	CONFIG RING_START_Y = RING_COL_LABEL_Y + 1 + MENU_SMALLFONT_HEIGHT;
	CONFIG RINGS_PER_PAGE = ((BH_RINGS - RING_START_Y - RING_COL_LABEL_Y) / 16) <<0;
	CONFIG RING_EQUIP_HIGHLIGHT_BUFFER = 3;
	COLOR RING_EQUIP_L = C_LINK_LGREEN;
	COLOR RING_EQUIP_D = C_LINK_DGREEN;
	CONFIG RING_BUTTON_X = 10;
	CONFIG RING_BUTTON_WID = 54;
	CONFIG RING_BUTTON_PADDING = 2;
	CONFIG RING_BUTTON_HEI = (RING_BUTTON_PADDING*2)+1+MENU_SMALLFONT_HEIGHT;
	CONFIG RING_BUTTON_CX = RING_BUTTON_X+(RING_BUTTON_WID/2);
	CONFIG RING_BUTTON_ALL_Y = 54;
	CONFIG RING_BUTTON_EQ_Y = RING_BUTTON_ALL_Y + RING_BUTTON_HEI + 2;
	CONFIG RING_BUTTON_ASC_Y = RING_BUTTON_EQ_Y + RING_BUTTON_HEI + 8;
	CONFIG RING_BUTTON_DESC_Y = RING_BUTTON_ASC_Y + RING_BUTTON_HEI + 2;
	CONFIG RING_BUTTON_IDSORT_Y = RING_BUTTON_DESC_Y + RING_BUTTON_HEI + 8;
	CONFIG RING_BUTTON_RPSORT_Y = RING_BUTTON_IDSORT_Y + RING_BUTTON_HEI + 2;
	COLOR RING_BUTTON_LCOLOR = C_BLUE;
	COLOR RING_BUTTON_DCOLOR = C_DBLUE;
	CONFIG RING_COMBO_LEFTARR = 65030;
	CONFIG RING_COMBO_RIGHTARR = 65031;
	CONFIG RING_L_TILE = 211414;
	CONFIG RING_R_TILE = 211415;
	CONFIG RING_BUTTON_CTR_Y = BY_RINGS + BH_RINGS - RING_BUTTON_HEI - 1;
	//end Ring Tab Constants
	enum Tab
	{
		TAB_LINK,
		TAB_PARTY,
		TAB_GEAR,
		TAB_INVENTORY,
		TAB_RINGS,
		TAB_MAP,
		TAB_JOURNAL,
		NUM_TABS
	};
	//end Constants
	void run()
	{
		Game->FFRules[qr_PASSIVE_SUBSCRIPT_RUNS_DURING_ACTIVE_SUBSCRIPT] = !NO_PASSIVE;
		//Start was just pressed! Do any loading stuff, declare any local vars needed, etc
		Tab tab = TAB_LINK; //The tab you are on when you open the subscreen
		int ctimer = 0;
		bitmap background_bmp = bitmaps::acquire(SCREENWID*NUM_TABS, SCREENHEI);
		background_bmp->Clear(0);
		for(int q = 0; q < NUM_TABS; ++q)
		{
			background_bmp->DrawTile(0,(q*SCREENWID)+SBG_X,SBG_Y,SBG_TILE_TAB_START+(q*TILE_PER_PAGE),SBG_TWID,SBG_THEI,0,-1,-1,0,0,0,FLIP_NONE,true,OP_OPAQUE);
		}
		if(DEBUG_OUTPUT_BG_BITMAP) background_bmp->Write(7, "PZ_BG.png", true);
		bitmap subbmp = bitmaps::acquire(SCREENWID,SCREENHEI);
		int fade_timer = FADETIME;
		TotalNoAction();
		int cursor_index;
		int oldCursor[10];
		int oldCursorIndex = 0;
		//Ring specific
		untyped ringbuf[Ring::NUM_RINGS];
		Ring::SortType ringsort = Ring::SORTTYPE_ID;
		bool ringascending = true;
		bool ring_eq_only;
		Ring::loadRingArray(ringbuf, ringsort, ringascending, ring_eq_only);
		int num_rings_owned;
		for(num_rings_owned = 0; ringbuf[num_rings_owned] != -1; ++num_rings_owned);
		int max_page = Ceiling(num_rings_owned / RINGS_PER_PAGE)-1;
		int ring_page;
		//
		//start Mouse system stuff
		int x1=-1, y1, x2=-1, y2, tx, ty;
		bool active;
		bool wasmouse;
		bool shift = false;
		//end Mouse system stuff
		//start Cursor positions
		// {x1, y1, x2, y2} //etc
		int LinkTabPos[] = {12, 44};
		int PartyTabPos[] = {45, 44};
		int GearTabPos[] = {80, 44};
		int InvTabPos[] = {114, 44};
		int RingTabPos[] = {148, 44, RING_BUTTON_X, RING_BUTTON_EQ_Y - 1, RING_BUTTON_X, RING_BUTTON_DESC_Y - 1, RING_BUTTON_X, RING_BUTTON_RPSORT_Y - 1,
			BX_RINGS + RING_TILE_X, BY_RINGS + RING_START_Y + ((RING_TILE_HEIGHT+RING_TILE_SPACE)*(.5 + 0)),
			BX_RINGS + RING_TILE_X, BY_RINGS + RING_START_Y + ((RING_TILE_HEIGHT+RING_TILE_SPACE)*(.5 + 1)),
			BX_RINGS + RING_TILE_X, BY_RINGS + RING_START_Y + ((RING_TILE_HEIGHT+RING_TILE_SPACE)*(.5 + 2)),
			BX_RINGS + RING_TILE_X, BY_RINGS + RING_START_Y + ((RING_TILE_HEIGHT+RING_TILE_SPACE)*(.5 + 3)),
			BX_RINGS + RING_TILE_X, BY_RINGS + RING_START_Y + ((RING_TILE_HEIGHT+RING_TILE_SPACE)*(.5 + 4)),
			BX_RINGS + RING_TILE_X, BY_RINGS + RING_START_Y + ((RING_TILE_HEIGHT+RING_TILE_SPACE)*(.5 + 5)),
			BX_RINGS + RING_TILE_X, BY_RINGS + RING_START_Y + ((RING_TILE_HEIGHT+RING_TILE_SPACE)*(.5 + 6))
		};
		int MapTabPos[] = {183, 44};
		int NotesTabPos[] = {215, 44};
		//end Cursor positions
		do //start Loop
		{
			subbmp->ClearToColor(0,BG_COLOR); //Reset the bitmap to the BG color
			//start Tab Switching
			unless(cursor_index)
			{
				Tab old = tab;
				if(Input->Press[CB_R] || Input->Press[CB_RIGHT])
				{
					tab = getTab(tab+1);
				}
				else if(Input->Press[CB_L] || Input->Press[CB_LEFT])
				{
					tab = getTab(tab-1);
				}
				if(tab != old) //things to do when changing tabs
				{
					cursor_index = 0;
					switch(tab)
					{
						case TAB_RINGS:
							ring_page = 0;
							break;
					}
					TotalNoAction();
				}
			}
			//end Tab Switching
			//Draw the background for this tab
			background_bmp->Blit(0,subbmp,tab*SCREENWID,0,SCREENWID,SCREENHEI,0,0,SCREENWID,SCREENHEI,0,0,0,BITDX_NORMAL,0,true);
			//start tab-specific
			switch(tab)
			{
				case TAB_LINK: //start
				{
					DrawMenuCursor(subbmp, LinkTabPos[cursor_index*2], LinkTabPos[(cursor_index*2)+1]);
					DEFINE TEXT_YOFF = 3;
					//start Upper-right box
					DrawBox(subbmp, BX_FORCE_POWER, BY_FORCE_POWER, BPW_FORCE_POWER, BPH_FORCE_POWER);
					subbmp->FastTile(1, BX_FORCE_POWER + 4, BY_FORCE_POWER + 1, TILE_FORCEPOWER_ICON, 0, OP_OPAQUE);
					for(int q = 1; q <= Game->MCounter[CR_FORCE_POWER]; ++q)
					{
						int tile = (q <= Game->Counter[CR_FORCE_POWER]) ? TILE_FORCE_POWER+q : TILE_FORCE_POWER;
						subbmp->FastTile(1, (BX_FORCE_POWER+4) + 12 + (q-1)*11, BY_FORCE_POWER+1, tile, 0, OP_OPAQUE);
					}
					subbmp->FastTile(1, BX_FORCE_POWER + 4, BY_FORCE_POWER+15, TILE_SPECIALMOVE_ICON, 0, OP_OPAQUE);
					for(int q = 0; q < TEXT_SPECIAL_TILEWIDTH; ++q)
					{
						subbmp->FastTile(1, BX_FORCE_POWER+4 +20 + (16*q), BY_FORCE_POWER+15+3, TILE_TEXT_SPECIAL+q, 0, OP_OPAQUE);
					}
					//end Upper-right box
					//start Lower-right box
					DrawBox(subbmp, BX_CTRS, BY_CTRS, BPW_CTRS, BPH_CTRS);
					int yoff = 2;
					subbmp->FastCombo(1, BX_CTRS + 4, BY_CTRS + yoff, COMBO_FORCE_POINT, 0, OP_OPAQUE);
					for(int q = 0; q < TEXT_FPTS_TILEWIDTH; ++q)
					{
						subbmp->FastTile(1, BX_CTRS+4 +20 + (16*q), BY_CTRS+ TEXT_YOFF + yoff, TILE_TEXT_FPTS+q, 0, OP_OPAQUE);
					}
					DrawNumber(subbmp, BX_CTRS+BPW_CTRS-((NUMBERTILE_WID+NUMBERTILE_SPACING)*2)-2, BY_CTRS+ 3 + yoff, Game->Counter[CR_FORCE_POINTS], 2, true);
					yoff += 16;
					//
					subbmp->FastCombo(1, BX_CTRS + 4, BY_CTRS + yoff, COMBO_RUPEE, 0, OP_OPAQUE);
					for(int q = 0; q < TEXT_RUPEES_TILEWIDTH; ++q)
					{
						subbmp->FastTile(1, BX_CTRS+4 +20 + (16*q), BY_CTRS+ TEXT_YOFF + yoff, TILE_TEXT_RUPEES+q, 0, OP_OPAQUE);
					}
					DrawNumber(subbmp, BX_CTRS+BPW_CTRS-((NUMBERTILE_WID+NUMBERTILE_SPACING)*3)-2, BY_CTRS+ 3 + yoff, Game->Counter[CR_RUPEES], 3, false);
					yoff += 14;
					//
					subbmp->FastCombo(1, BX_CTRS + 4, BY_CTRS + yoff, COMBO_FORCE_GEM, 0, OP_OPAQUE);
					for(int q = 0; q < TEXT_FORCEGEM_TILEWIDTH; ++q)
					{
						subbmp->FastTile(1, BX_CTRS+4 +20 + (16*q), BY_CTRS+ TEXT_YOFF + yoff, TILE_TEXT_FORCEGEM+q, 0, OP_OPAQUE);
					}
					DrawNumber(subbmp, BX_CTRS+BPW_CTRS-((NUMBERTILE_WID+NUMBERTILE_SPACING)*3)-2, BY_CTRS+ 3 + yoff, Game->Counter[CR_FORCE_GEM], 3, true);
					yoff += 14;
					//
					subbmp->FastCombo(1, BX_CTRS + 4, BY_CTRS + yoff, COMBO_SPIRIT_ORB, 0, OP_OPAQUE);
					for(int q = 0; q < TEXT_SPIRITORB_TILEWIDTH; ++q)
					{
						subbmp->FastTile(1, BX_CTRS+4 +20 + (16*q), BY_CTRS+ TEXT_YOFF + yoff, TILE_TEXT_SPIRITORB+q, 0, OP_OPAQUE);
					}
					DrawNumber(subbmp, BX_CTRS+BPW_CTRS-((NUMBERTILE_WID+NUMBERTILE_SPACING)*3)-2, BY_CTRS+ 3 + yoff, Game->Counter[CR_SPIRIT_ORB], 3, true);
					yoff += 17;
					//
					subbmp->FastCombo(1, BX_CTRS + 4, BY_CTRS + yoff, COMBO_CLOCK, 0, OP_OPAQUE);
					if(Game->TimeValid)
					{
						int digit = 0;
						digit += DrawNumber(subbmp, BX_CTRS+4 +20 + ((NUMBERTILE_WID+NUMBERTILE_SPACING)*digit), BY_CTRS+ 3 + yoff, getHour(), 2, false);
						subbmp->FastTile(1, BX_CTRS+4 +20 + ((NUMBERTILE_WID+NUMBERTILE_SPACING)*digit++), BY_CTRS + 3 + yoff, TILE_COLON, 0, OP_OPAQUE);
						digit += DrawNumber(subbmp, BX_CTRS+4 +20 + ((NUMBERTILE_WID+NUMBERTILE_SPACING)*digit), BY_CTRS+ 3 + yoff, getMinute(), 2, false);
						subbmp->FastTile(1, BX_CTRS+4 +20 + ((NUMBERTILE_WID+NUMBERTILE_SPACING)*digit++), BY_CTRS + 3 + yoff, TILE_COLON, 0, OP_OPAQUE);
						digit += DrawNumber(subbmp, BX_CTRS+4 +20 + ((NUMBERTILE_WID+NUMBERTILE_SPACING)*digit), BY_CTRS+ 3 + yoff, getSecond(), 2, false);
					}
					else
					{
						subbmp->FastTile(1, BX_CTRS+4 +20 + ((NUMBERTILE_WID+NUMBERTILE_SPACING)*0), BY_CTRS + 3 + yoff, TILE_MINUS, 0, OP_OPAQUE);
						subbmp->FastTile(1, BX_CTRS+4 +20 + ((NUMBERTILE_WID+NUMBERTILE_SPACING)*1), BY_CTRS + 3 + yoff, TILE_MINUS, 0, OP_OPAQUE);
						subbmp->FastTile(1, BX_CTRS+4 +20 + ((NUMBERTILE_WID+NUMBERTILE_SPACING)*2), BY_CTRS + 3 + yoff, TILE_COLON, 0, OP_OPAQUE);
						subbmp->FastTile(1, BX_CTRS+4 +20 + ((NUMBERTILE_WID+NUMBERTILE_SPACING)*3), BY_CTRS + 3 + yoff, TILE_MINUS, 0, OP_OPAQUE);
						subbmp->FastTile(1, BX_CTRS+4 +20 + ((NUMBERTILE_WID+NUMBERTILE_SPACING)*4), BY_CTRS + 3 + yoff, TILE_MINUS, 0, OP_OPAQUE);
						subbmp->FastTile(1, BX_CTRS+4 +20 + ((NUMBERTILE_WID+NUMBERTILE_SPACING)*5), BY_CTRS + 3 + yoff, TILE_COLON, 0, OP_OPAQUE);
						subbmp->FastTile(1, BX_CTRS+4 +20 + ((NUMBERTILE_WID+NUMBERTILE_SPACING)*6), BY_CTRS + 3 + yoff, TILE_MINUS, 0, OP_OPAQUE);
						subbmp->FastTile(1, BX_CTRS+4 +20 + ((NUMBERTILE_WID+NUMBERTILE_SPACING)*7), BY_CTRS + 3 + yoff, TILE_MINUS, 0, OP_OPAQUE);
					}
					//end Lower-right box
					//start Link box
					subbmp->Rectangle(0, BX_LVL, BY_LVL, BX_LVL+BPW_LVL, BY_LVL+BPH_LEVEL, C_LINKTAB_GREEN, 1, 0, 0, 0, true, OP_OPAQUE);
					ShadowString(subbmp, 1, BX_LVL+4, BY_LVL+2, LINK_SMALLFONT, C_WHITE, -1, TF_NORMAL, "Link", OP_OPAQUE);
					char buf[32];
					sprintf(buf, "Lvl. %d", Game->Counter[CR_LEVEL]);
					ShadowString(subbmp, 1, BX_LVL+BPW_LVL - 3 - Text->StringWidth(buf, LINK_SMALLFONT), BY_LVL+2, LINK_SMALLFONT, C_WHITE, -1, TF_NORMAL, buf, OP_OPAQUE);
					//end Link box
					//start TODO Link Sprite
					//Placeholder
					subbmp->Rectangle(0, BX_LINKSPRITE, BY_LINKSPRITE, BX_LINKSPRITE + BPW_LINKSPRITE -1, BY_LINKSPRITE + BPH_LINKSPRITE -1, C_BLACK, 1, 0, 0, 0, false, OP_OPAQUE);
					//end Link Sprite
					//start StatBox
					DrawBox(subbmp, BX_STATS, BY_STATS, BPW_STATS, BPH_STATS);
					yoff = 4;
					int digit = 0;
					subbmp->FastTile(1, BX_STATS + 4, BY_STATS + yoff + TEXT_YOFF, TILE_TEXT_HP, 0, OP_OPAQUE);
					subbmp->FastTile(1, BX_STATS + 4+18, BY_STATS + yoff, TILE_HEART, 0, OP_OPAQUE);
					digit += DrawNumber(subbmp, (BX_STATS+4+18+20)+((NUMBERTILE_WID+NUMBERTILE_SPACING)*digit), BY_STATS + yoff + TEXT_YOFF, Game->Counter[CR_LIFE], 1, true);
					subbmp->FastTile(1, (BX_STATS+4+18+20)+((NUMBERTILE_WID+NUMBERTILE_SPACING)*digit++), BY_STATS + yoff + TEXT_YOFF, TILE_SLASH, 0, OP_OPAQUE);
					digit += DrawNumber(subbmp, (BX_STATS+4+18+20)+((NUMBERTILE_WID+NUMBERTILE_SPACING)*digit), BY_STATS + yoff + TEXT_YOFF, Game->MCounter[CR_LIFE], 1, true);
					yoff += 18;
					digit = 0;
					subbmp->FastTile(1, BX_STATS + 4, BY_STATS + yoff + TEXT_YOFF, TILE_TEXT_MP, 0, OP_OPAQUE);
					subbmp->FastTile(1, BX_STATS + 4+18, BY_STATS + yoff, TILE_MAGIC, 0, OP_OPAQUE);
					digit += DrawNumber(subbmp, (BX_STATS+4+18+20)+((NUMBERTILE_WID+NUMBERTILE_SPACING)*digit), BY_STATS + yoff + TEXT_YOFF, Game->Counter[CR_MAGIC], 1, true);
					subbmp->FastTile(1, (BX_STATS+4+18+20)+((NUMBERTILE_WID+NUMBERTILE_SPACING)*digit++), BY_STATS + yoff + TEXT_YOFF, TILE_SLASH, 0, OP_OPAQUE);
					digit += DrawNumber(subbmp, (BX_STATS+4+18+20)+((NUMBERTILE_WID+NUMBERTILE_SPACING)*digit), BY_STATS + yoff + TEXT_YOFF, Game->MCounter[CR_MAGIC], 1, true);
					yoff += 16;
					digit = 0;
					subbmp->FastTile(1, BX_STATS + 4, BY_STATS + yoff + TEXT_YOFF, TILE_TEXT_RP, 0, OP_OPAQUE);
					subbmp->FastTile(1, BX_STATS + 4+18, BY_STATS + yoff, TILE_RING, 0, OP_OPAQUE);
					digit += DrawNumber(subbmp, (BX_STATS+4+18+20)+((NUMBERTILE_WID+NUMBERTILE_SPACING)*digit), BY_STATS + yoff + TEXT_YOFF, Game->Counter[CR_RING_POINTS], 1, true);
					//end StatBox
					break;
				} //end
				case TAB_PARTY: //start
				{
					DrawMenuCursor(subbmp, PartyTabPos[cursor_index*2], PartyTabPos[(cursor_index*2)+1]);
					//TODO Per-frame draws for this tab
					break;
				} //end
				case TAB_GEAR: //start
				{
					DrawMenuCursor(subbmp, GearTabPos[cursor_index*2], GearTabPos[(cursor_index*2)+1]);
					//TODO Per-frame draws for this tab
					break;
				} //end
				case TAB_INVENTORY: //start
				{
					DrawMenuCursor(subbmp, InvTabPos[cursor_index*2], InvTabPos[(cursor_index*2)+1]);
					//TODO Per-frame draws for this tab
					break;
				} //end
				case TAB_RINGS: //start
				{
					int selected_ring_indx = (cursor_index > 3 ? (ring_page*RINGS_PER_PAGE) + (cursor_index-4) : -1);
					Ring selected_ring = <Ring>(selected_ring_indx < 0 ? -1 : ringbuf[selected_ring_indx]);
					switch(cursor_index)
					{
						case 0:
							if(Input->Press[CB_A])
								cursor_index=1;
							break;
						case 1:
							if(Input->Press[CB_B])
								cursor_index=0;
							else if(Input->Press[CB_A])
							{
								ring_eq_only = !ring_eq_only;
								Ring::loadRingArray(ringbuf, ringsort, ringascending, ring_eq_only);
								for(num_rings_owned = 0; ringbuf[num_rings_owned] != -1; ++num_rings_owned);
								max_page = Ceiling(num_rings_owned / RINGS_PER_PAGE)-1;
								if(ring_page > max_page) ring_page = 0;
							}
							else if(Input->Press[CB_RIGHT])
							{
								oldCursor[oldCursorIndex++] = cursor_index;
								cursor_index = 4;
							}
							else if(Input->Press[CB_UP])
								cursor_index = 3;
							else if(Input->Press[CB_DOWN])
								cursor_index = 2;
							break;
						case 2:
							if(Input->Press[CB_B])
								cursor_index = 0;
							else if(Input->Press[CB_A])
							{
								ringascending = !ringascending;								
								Ring::loadRingArray(ringbuf, ringsort, ringascending, ring_eq_only);
								for(num_rings_owned = 0; ringbuf[num_rings_owned] != -1; ++num_rings_owned);
								max_page = Ceiling(num_rings_owned / RINGS_PER_PAGE)-1;
								if(ring_page > max_page) ring_page = 0;
							}
							else if(Input->Press[CB_RIGHT])
							{
								oldCursor[oldCursorIndex++] = cursor_index;
								cursor_index = 4;
							}
							else if(Input->Press[CB_UP])
								cursor_index = 1;
							else if(Input->Press[CB_DOWN])
								cursor_index = 3;
							break;
						case 3:
							if(Input->Press[CB_B])
								cursor_index = 0;
							else if(Input->Press[CB_A])
							{
								ringsort = <Ring::SortType>((ringsort+1)%Ring::NUM_SORTTYPE);								
								Ring::loadRingArray(ringbuf, ringsort, ringascending, ring_eq_only);
								for(num_rings_owned = 0; ringbuf[num_rings_owned] != -1; ++num_rings_owned);
								max_page = Ceiling(num_rings_owned / RINGS_PER_PAGE)-1;
								if(ring_page > max_page) ring_page = 0;
							}
							else if(Input->Press[CB_RIGHT])
							{
								oldCursor[oldCursorIndex++] = cursor_index;
								cursor_index = 4;
							}
							else if(Input->Press[CB_UP])
								cursor_index = 2;
							else if(Input->Press[CB_DOWN])
								cursor_index = 1;
							break;
						case 4:
						case 5:
						case 6:
						case 7:
						case 8:
						case 9:
						case 10:
							if(Input->Press[CB_B])
							{
								cursor_index = oldCursor[--oldCursorIndex];
								break;
							}
							else if(Input->Press[CB_UP])
							{
								if(cursor_index == 4)
								{
									--ring_page;
									if(ring_page < 0) ring_page = max_page;
									cursor_index = 10;
									selected_ring_indx = (cursor_index > 3 ? (ring_page*RINGS_PER_PAGE) + (cursor_index-4) : -1);
									while(selected_ring_indx >= num_rings_owned)
									{
										--cursor_index;
										--selected_ring_indx;
									}
								}
								else --cursor_index;
							}
							else if(Input->Press[CB_DOWN])
							{
								if(cursor_index == 10 || (selected_ring_indx+1 == num_rings_owned))
								{
									++ring_page;
									if(ring_page > max_page) ring_page = 0;
									cursor_index = 4;
								}
								else ++cursor_index;
							}
							else if(Input->Press[CB_L])
							{
								--ring_page;
								if(ring_page < 0) ring_page = max_page;
								selected_ring_indx = (cursor_index > 3 ? (ring_page*RINGS_PER_PAGE) + (cursor_index-4) : -1);
								while(selected_ring_indx >= num_rings_owned)
								{
									--cursor_index;
									--selected_ring_indx;
								}
							}
							else if(Input->Press[CB_R])
							{
								++ring_page;
								if(ring_page > max_page) ring_page = 0;
								selected_ring_indx = (cursor_index > 3 ? (ring_page*RINGS_PER_PAGE) + (cursor_index-4) : -1);
								while(selected_ring_indx >= num_rings_owned)
								{
									--cursor_index;
									--selected_ring_indx;
								}
							}
							else if(Input->Press[CB_RIGHT])
							{
								if(ringinv[selected_ring] > rings[selected_ring])
								{
									if(Game->Counter[CR_RING_POINTS] >= Ring::cost(selected_ring))
									{
										++rings[selected_ring];
										Game->Counter[CR_RING_POINTS] -= Ring::cost(selected_ring);
									}
								}
							}
							else if(Input->Press[CB_LEFT])
							{
								if(rings[selected_ring] > 0)
								{
									--rings[selected_ring];
									Game->Counter[CR_RING_POINTS] += Ring::cost(selected_ring);
								}
							}
							subbmp->FastTile(3, BX_RINGS + BW_RINGS + 1, BY_RINGS, RING_L_TILE, 0, OP_OPAQUE);
							subbmp->FastTile(3, BX_RINGS + BW_RINGS + 1, BY_RINGS + BH_RINGS - 16, RING_R_TILE, 0, OP_OPAQUE);
							break;
					}
					DrawMenuCursor(subbmp, RingTabPos[cursor_index*2], RingTabPos[(cursor_index*2)+1]);
					//
					DrawBox(subbmp, BX_RINGS, BY_RINGS, BW_RINGS, BH_RINGS);
					subbmp->Rectangle(0, RING_BUTTON_X, RING_BUTTON_ALL_Y, RING_BUTTON_X+RING_BUTTON_WID, RING_BUTTON_ALL_Y + RING_BUTTON_HEI, RING_BUTTON_DCOLOR, 1, 0, 0, 0, true, OP_OPAQUE);
					subbmp->Rectangle(0, RING_BUTTON_X, RING_BUTTON_ALL_Y, RING_BUTTON_X+RING_BUTTON_WID-1, RING_BUTTON_ALL_Y + RING_BUTTON_HEI-1, ring_eq_only ? RING_BUTTON_DCOLOR : RING_BUTTON_LCOLOR, 1, 0, 0, 0, true, OP_OPAQUE);
					ShadowString(subbmp, 1, RING_BUTTON_CX, RING_BUTTON_ALL_Y + RING_BUTTON_PADDING +1, MENU_SMALLFONT, C_WHITE, -1, TF_CENTERED, "All", OP_OPAQUE);
					subbmp->Rectangle(0, RING_BUTTON_X, RING_BUTTON_EQ_Y, RING_BUTTON_X+RING_BUTTON_WID, RING_BUTTON_EQ_Y + RING_BUTTON_HEI, RING_BUTTON_DCOLOR, 1, 0, 0, 0, true, OP_OPAQUE);
					subbmp->Rectangle(0, RING_BUTTON_X, RING_BUTTON_EQ_Y, RING_BUTTON_X+RING_BUTTON_WID-1, RING_BUTTON_EQ_Y + RING_BUTTON_HEI-1, ring_eq_only ? RING_BUTTON_LCOLOR : RING_BUTTON_DCOLOR, 1, 0, 0, 0, true, OP_OPAQUE);
					ShadowString(subbmp, 1, RING_BUTTON_CX, RING_BUTTON_EQ_Y + RING_BUTTON_PADDING +1, MENU_SMALLFONT, C_WHITE, -1, TF_CENTERED, "Equipped", OP_OPAQUE);
					//
					subbmp->Rectangle(0, RING_BUTTON_X, RING_BUTTON_ASC_Y, RING_BUTTON_X+RING_BUTTON_WID, RING_BUTTON_ASC_Y + RING_BUTTON_HEI, RING_BUTTON_DCOLOR, 1, 0, 0, 0, true, OP_OPAQUE);
					subbmp->Rectangle(0, RING_BUTTON_X, RING_BUTTON_ASC_Y, RING_BUTTON_X+RING_BUTTON_WID-1, RING_BUTTON_ASC_Y + RING_BUTTON_HEI-1, ringascending ? RING_BUTTON_LCOLOR : RING_BUTTON_DCOLOR, 1, 0, 0, 0, true, OP_OPAQUE);
					ShadowString(subbmp, 1, RING_BUTTON_CX, RING_BUTTON_ASC_Y + RING_BUTTON_PADDING +1, MENU_SMALLFONT, C_WHITE, -1, TF_CENTERED, "Ascending", OP_OPAQUE);
					subbmp->Rectangle(0, RING_BUTTON_X, RING_BUTTON_DESC_Y, RING_BUTTON_X+RING_BUTTON_WID, RING_BUTTON_DESC_Y + RING_BUTTON_HEI, RING_BUTTON_DCOLOR, 1, 0, 0, 0, true, OP_OPAQUE);
					subbmp->Rectangle(0, RING_BUTTON_X, RING_BUTTON_DESC_Y, RING_BUTTON_X+RING_BUTTON_WID-1, RING_BUTTON_DESC_Y + RING_BUTTON_HEI-1, ringascending ? RING_BUTTON_DCOLOR : RING_BUTTON_LCOLOR, 1, 0, 0, 0, true, OP_OPAQUE);
					ShadowString(subbmp, 1, RING_BUTTON_CX, RING_BUTTON_DESC_Y + RING_BUTTON_PADDING +1, MENU_SMALLFONT, C_WHITE, -1, TF_CENTERED, "Descending", OP_OPAQUE);
					//
					subbmp->Rectangle(0, RING_BUTTON_X, RING_BUTTON_IDSORT_Y, RING_BUTTON_X+RING_BUTTON_WID, RING_BUTTON_IDSORT_Y + RING_BUTTON_HEI, RING_BUTTON_DCOLOR, 1, 0, 0, 0, true, OP_OPAQUE);
					subbmp->Rectangle(0, RING_BUTTON_X, RING_BUTTON_IDSORT_Y, RING_BUTTON_X+RING_BUTTON_WID-1, RING_BUTTON_IDSORT_Y + RING_BUTTON_HEI-1, ringsort==Ring::SORTTYPE_ID ? RING_BUTTON_LCOLOR : RING_BUTTON_DCOLOR, 1, 0, 0, 0, true, OP_OPAQUE);
					ShadowString(subbmp, 1, RING_BUTTON_CX, RING_BUTTON_IDSORT_Y + RING_BUTTON_PADDING +1, MENU_SMALLFONT, C_WHITE, -1, TF_CENTERED, "Sort ID", OP_OPAQUE);
					subbmp->Rectangle(0, RING_BUTTON_X, RING_BUTTON_RPSORT_Y, RING_BUTTON_X+RING_BUTTON_WID, RING_BUTTON_RPSORT_Y + RING_BUTTON_HEI, RING_BUTTON_DCOLOR, 1, 0, 0, 0, true, OP_OPAQUE);
					subbmp->Rectangle(0, RING_BUTTON_X, RING_BUTTON_RPSORT_Y, RING_BUTTON_X+RING_BUTTON_WID-1, RING_BUTTON_RPSORT_Y + RING_BUTTON_HEI-1, ringsort==Ring::SORTTYPE_RP ? RING_BUTTON_LCOLOR : RING_BUTTON_DCOLOR, 1, 0, 0, 0, true, OP_OPAQUE);
					ShadowString(subbmp, 1, RING_BUTTON_CX, RING_BUTTON_RPSORT_Y + RING_BUTTON_PADDING +1, MENU_SMALLFONT, C_WHITE, -1, TF_CENTERED, "Sort RP", OP_OPAQUE);
					//
					ShadowString(subbmp, 2, BX_RINGS + RING_TEXT_X, BY_RINGS + RING_COL_LABEL_Y, MENU_SMALLFONT, C_WHITE, -1, TF_NORMAL, "Name", OP_OPAQUE);
					ShadowString(subbmp, 2, BX_RINGS + RING_RP_X, BY_RINGS + RING_COL_LABEL_Y, MENU_SMALLFONT, C_WHITE, -1, TF_NORMAL, "RP", OP_OPAQUE);
					ShadowString(subbmp, 2, BX_RINGS + RING_EQ_X, BY_RINGS + RING_COL_LABEL_Y, MENU_SMALLFONT, C_WHITE, -1, TF_NORMAL, "Equipped", OP_OPAQUE);
					//
					subbmp->Rectangle(0, RING_BUTTON_X, RING_BUTTON_CTR_Y, RING_BUTTON_X+RING_BUTTON_WID, RING_BUTTON_CTR_Y + RING_BUTTON_HEI, RING_BUTTON_DCOLOR, 1, 0, 0, 0, true, OP_OPAQUE);
					subbmp->Rectangle(0, RING_BUTTON_X, RING_BUTTON_CTR_Y, RING_BUTTON_X+RING_BUTTON_WID-1, RING_BUTTON_CTR_Y + RING_BUTTON_HEI-1, RING_BUTTON_LCOLOR, 1, 0, 0, 0, true, OP_OPAQUE);
					char buf[64];
					sprintf(buf, "RP: %d / %d", Game->Counter[CR_RING_POINTS], Game->MCounter[CR_RING_POINTS]);
					ShadowString(subbmp, 2, RING_BUTTON_CX, RING_BUTTON_CTR_Y + RING_BUTTON_PADDING + 1, MENU_SMALLFONT, C_WHITE, -1, TF_CENTERED, buf, OP_OPAQUE);
					for(int q = 0; q < RINGS_PER_PAGE; ++q)
					{
						int y = BY_RINGS + RING_START_Y + ((RING_TILE_HEIGHT+RING_TILE_SPACE)*q);
						Ring r = ringbuf[(ring_page*RINGS_PER_PAGE)+q];
						if(r < 0) break;
						subbmp->FastTile(1, BX_RINGS + RING_TILE_X, y, Ring::tile(r), 0, OP_OPAQUE);
						char buf[64];
						Ring::name(buf, r);
						ShadowString(subbmp, 1, BX_RINGS + RING_TEXT_X, y + RING_TEXT_YOFF, MENU_SMALLFONT, C_WHITE, -1, TF_NORMAL, buf, OP_OPAQUE);
						char buf2[4];
						itoa(buf2, Ring::cost(r));
						ShadowString(subbmp, 1, BX_RINGS + RING_RP_X, y + RING_TEXT_YOFF, MENU_SMALLFONT, C_WHITE, -1, TF_NORMAL, buf2, OP_OPAQUE);
						char buf3[8];
						sprintf(buf3, "%d/%d", rings[r], ringinv[r]);
						ShadowString(subbmp, 1, BX_RINGS + RING_EQ_X + 6, y + RING_TEXT_YOFF, MENU_SMALLFONT, C_WHITE, -1, TF_NORMAL, buf3, OP_OPAQUE);
						if(r == selected_ring)
						{
							if(rings[r] > 0)
								subbmp->FastCombo(1, BX_RINGS + RING_EQ_X, y + RING_TEXT_YOFF, RING_COMBO_LEFTARR, 0, OP_OPAQUE);
							if(rings[r] < ringinv[r] && Game->Counter[CR_RING_POINTS] >= Ring::cost(r))
								subbmp->FastCombo(1, BX_RINGS + RING_EQ_X + 6 + 2 + Text->StringWidth(buf3, MENU_SMALLFONT), y + RING_TEXT_YOFF, RING_COMBO_RIGHTARR, 0, OP_OPAQUE);
						}
						if(rings[r])
						{
							subbmp->Rectangle(0, BX_RINGS, y + RING_EQUIP_HIGHLIGHT_BUFFER, BX_RINGS + BW_RINGS - 1, y + RING_TILE_HEIGHT - (1+RING_EQUIP_HIGHLIGHT_BUFFER), RING_EQUIP_D, 1, 0, 0, 0, true, OP_OPAQUE);
							subbmp->Rectangle(0, BX_RINGS + 2, y + RING_EQUIP_HIGHLIGHT_BUFFER, BX_RINGS + BW_RINGS - 1, y + RING_TILE_HEIGHT - (2+RING_EQUIP_HIGHLIGHT_BUFFER), RING_EQUIP_L, 1, 0, 0, 0, true, OP_OPAQUE);
						}
					}
					break;
				} //end
				case TAB_MAP: //start
				{
					DrawMenuCursor(subbmp, MapTabPos[cursor_index*2], MapTabPos[(cursor_index*2)+1]);
					//TODO Per-frame draws for this tab
					break;
				} //end
				case TAB_JOURNAL: //start
				{
					DrawMenuCursor(subbmp, NotesTabPos[cursor_index*2], NotesTabPos[(cursor_index*2)+1]);
					//TODO Per-frame draws for this tab
					break;
				} //end
			} //end tab-specific
			
			//Draw to the screen, and finish the frame
			if(NO_PASSIVE)
			{
				Screen->Rectangle(7, 0, -56, SCREENWID-1, -1, C_BLACK, 1, 0, 0, 0, true, OP_OPAQUE);
			}
			if(fade_timer>0) //Opening animation
			{
				//TODO Do some sort of rotated/stetched blit for the "opening subscreen" effect
				int percent = 1 - (fade_timer/FADETIME);
				subbmp->Blit(7,RT_SCREEN,0,0,SCREENWID,SCREENHEI,(SCREENWID/2)*(1-percent),((SCREENHEI/2)*(1-percent))-56,SCREENWID*percent,SCREENHEI*percent,0,0,0,BITDX_NORMAL,0,true);
				--fade_timer;
				shift=false;
			}
			else subbmp->Blit(7,RT_SCREEN,0,0,SCREENWID,SCREENHEI,0,-56,SCREENWID,SCREENHEI,0,0,0,BITDX_NORMAL,0,true);
			if(DEBUG_MOUSE_STUFF) //start MouseStuff
			{
				if(Input->KeyPress[KEY_LSHIFT] || Input->KeyPress[KEY_RSHIFT]) shift = !shift;
				int mx = shift ? GridX(Input->Mouse[MOUSE_X]+8)-1 : Input->Mouse[MOUSE_X];
				int my = shift ? GridY(Input->Mouse[MOUSE_Y]+8)-1 : Input->Mouse[MOUSE_Y];
				if(shift && x1!=-1)
				{
					mx += x1%16;
					my += y1%16;
				}
				if(Input->Mouse[MOUSE_RIGHT])
				{
					active = false;
					x1 = x2 = -1;
				}
				if(Input->Mouse[MOUSE_LEFT])
				{
					unless(wasmouse)
					{
						wasmouse=true;
						if(active) 
						{
						}
						else if(x1==-1)
						{
							x1 = mx;
							y1 = my;
						}
						else
						{
							x2 = mx;
							y2 = my;
							tx = Div(x2-x1,16)+1;
							ty = Div(y2-y1,16)+1;
							active=true;
						}
					}
				}
				else wasmouse=false;
				if(active)
				{
					if(Input->Press[CB_RIGHT])
					{
						++x1;
						++x2;
					}
					else if(Input->Press[CB_LEFT])
					{
						--x1;
						--x2;
					}
					if(Input->Press[CB_DOWN])
					{
						++y1;
						++y2;
					}
					else if(Input->Press[CB_UP])
					{
						--y1;
						--y2;
					}
					if(shift)
					{
						Screen->Rectangle(7,x1,y1,x1+(tx*16)-1,y1+(ty*16)-1,C_WHITE,1,0,0,0,true,OP_OPAQUE);
						if(tx <= 0 || ty <= 0)
						{
							Screen->DrawString(7,256,-56,FONT_Z3SMALL,C_WHITE,C_BLACK,TF_RIGHT,"In tile mode, you must start from the upper-left",OP_OPAQUE);
						}
					}
					else
						Screen->Rectangle(7,x1,y1,x2,y2,C_WHITE,1,0,0,0,true,OP_OPAQUE);
				}
				else if(x1!=-1)
				{
					if(shift)
					{
						Screen->Rectangle(7,x1,y1,x1+((Div(mx-x1,16)+1)*16)-1,y1+((Div(my-y1,16)+1)*16)-1,C_WHITE,1,0,0,0,false,OP_OPAQUE);
						if(mx < x1 || my < y1)
						{
							Screen->DrawString(7,256,-56,FONT_Z3SMALL,C_WHITE,C_BLACK,TF_RIGHT,"In tile mode, you must start from the upper-left",OP_OPAQUE);
						}
					}
					else
						Screen->Rectangle(7,x1,y1,mx,my,C_WHITE,1,0,0,0,false,OP_OPAQUE);
				}
				//cursor
				{
					Screen->FastTile(7,mx,my,TILE_MOUSE_CURSOR,0,OP_OPAQUE);
				}
				if(x1!=-1)
				{
					char buf[16];
					sprintf(buf, "x1,y1: %d,%d",x1,y1+56);
					Screen->DrawString(7,0,-56,FONT_Z3SMALL,C_WHITE,C_BLACK,TF_NORMAL,buf,OP_OPAQUE);
				}
				else if(mx>=0&&my>=-56&&mx<256&&my<176)
				{
					char buf[16];
					sprintf(buf, "x,y: %d,%d",mx,my+56);
					Screen->DrawString(7,0,-56,FONT_Z3SMALL,C_WHITE,C_BLACK,TF_NORMAL,buf,OP_OPAQUE);
				}
				if(x2!=-1)
				{
					char buf[16];
					if(shift)
					{
						sprintf(buf, "tw,th: %d,%d",tx,ty);
						Screen->DrawString(7,0,Text->FontHeight(FONT_Z3SMALL)-56,FONT_Z3SMALL,C_WHITE,C_BLACK,TF_NORMAL,buf,OP_OPAQUE);
					}
					else
					{
						sprintf(buf, "x2,y2: %d,%d",x2,y2+56);
						Screen->DrawString(7,0,Text->FontHeight(FONT_Z3SMALL)-56,FONT_Z3SMALL,C_WHITE,C_BLACK,TF_NORMAL,buf,OP_OPAQUE);
						char buf2[16];
						sprintf(buf2, "w,h: %d,%d", x2-x1, y2-y1);
						Screen->DrawString(7,0,Text->FontHeight(FONT_Z3SMALL)*2-56,FONT_Z3SMALL,C_WHITE,C_BLACK,TF_NORMAL,buf2,OP_OPAQUE);
					}
				}
			}
			//end MouseStuff
			
			ctimer = (ctimer + 1) % 200000;
			Waitframe();
			bitmaps::updatefreed();
			if(fade_timer) TotalNoAction(); //No buttons while the animation is playing
		}
		until(Input->Press[CB_START]); //end loop
		fade_timer = FADETIME;
		while(fade_timer>0)
		{
			TotalNoAction();
			//TODO Do some sort of rotated/stretched blit for the "closing subscreen" effect
			int percent = (fade_timer/FADETIME);
			subbmp->Blit(7,RT_SCREEN,0,0,SCREENWID,SCREENHEI,(SCREENWID/2)*(1-percent),((SCREENHEI/2)*(1-percent))-56,SCREENWID*percent,SCREENHEI*percent,0,0,0,BITDX_NORMAL,0,true);
			--fade_timer;
			Waitframe();
		}
		bitmaps::release(subbmp, 7);
		bitmaps::release(background_bmp, 7);
	}
	Tab getTab(int tab) //Gets a 'Tab' constant value from an int.
	{
		while(tab<0) tab+=NUM_TABS;
		if(tab>=NUM_TABS) tab%=NUM_TABS;
		return <Tab>tab;
	}
	void DrawBox(bitmap b, int x, int y, int pwid, int phei)
	{
		DrawBox(b, x, y, pwid, phei, SBG_BOX_CLIGHT, SBG_BOX_CDARK);
	}
	void DrawBox(bitmap b, int x, int y, int pwid, int phei, Color light, Color dark)
	{
		bitmap temp = bitmaps::acquire(pwid, phei);
		temp->ClearToColor(0, dark);
		temp->Rectangle(0, SBG_BOX_BORDER_PX, SBG_BOX_BORDER_PX, pwid-1, phei-1, light, 1, 0, 0, 0, true, OP_OPAQUE);
		temp->Triangle(0, 0, 0, 0, (SBG_BOX_BORDER_PX*3), (SBG_BOX_BORDER_PX*3), 0, 0, 0, dark, 0, 0, PT_FLAT, NULL);
		temp->Triangle(0, 0, 0, 0, (SBG_BOX_BORDER_PX*2)-1, (SBG_BOX_BORDER_PX*2)-1, 0, 0, 0, 0, 0, 0, PT_FLAT, NULL);
		temp->Triangle(0, pwid, 0, pwid, (SBG_BOX_BORDER_PX*2), pwid-(SBG_BOX_BORDER_PX*2), 0, 0, 0, 0, 0, 0, PT_FLAT, NULL);
		temp->Triangle(0, pwid, phei, pwid, phei-(SBG_BOX_BORDER_PX*2), pwid-(SBG_BOX_BORDER_PX*2), phei, 0, 0, 0, 0, 0, PT_FLAT, NULL);
		temp->Triangle(0, 0, phei, 0, phei-(SBG_BOX_BORDER_PX*2), (SBG_BOX_BORDER_PX*2), phei, 0, 0, 0, 0, 0, PT_FLAT, NULL);
		temp->Blit(0, b, 0, 0, pwid, phei, x, y, pwid, phei, 0, 0, 0, BITDX_NORMAL, 0, true);
		bitmaps::release(temp);
	}
	int DrawNumber(bitmap b, int x, int y, int num, int mindigits, bool blank_0) //start Draws a number with tiles
	{
		int d6 = Div(num,100000),
		    d5	 = Div(num%100000,10000),
		    d4 = Div(num%10000,1000),
		    d3 = Div(num%1000,100),
		    d2 = Div(num%100,10),
		    d1 = num%10;
		int digits = 0;
		bool didDraw;
		int curr_x = x;
		if(d6 || mindigits>=6)
		{
			unless(blank_0&&!(d6||didDraw))
			{
				b->FastTile(3, curr_x, y, TILE_NUMBERS+d6, 0, OP_OPAQUE);
				didDraw = true;
			}
			curr_x += NUMBERTILE_WID + NUMBERTILE_SPACING;
			++digits;
		}
		if(didDraw || d5 || mindigits>=5)
		{
			unless(blank_0&&!(d5||didDraw))
			{
				b->FastTile(3, curr_x, y, TILE_NUMBERS+d5, 0, OP_OPAQUE);
				didDraw = true;
			}
			curr_x += NUMBERTILE_WID + NUMBERTILE_SPACING;
			++digits;
		}
		if(didDraw || d4 || mindigits>=4)
		{
			unless(blank_0&&!(d4||didDraw))
			{
				b->FastTile(3, curr_x, y, TILE_NUMBERS+d4, 0, OP_OPAQUE);
				didDraw = true;
			}
			curr_x += NUMBERTILE_WID + NUMBERTILE_SPACING;
			++digits;
		}
		if(didDraw || d3 || mindigits>=3)
		{
			unless(blank_0&&!(d3||didDraw))
			{
				b->FastTile(3, curr_x, y, TILE_NUMBERS+d3, 0, OP_OPAQUE);
				didDraw = true;
			}
			curr_x += NUMBERTILE_WID + NUMBERTILE_SPACING;
			++digits;
		}
		if(didDraw || d2 || mindigits>=2)
		{
			unless(blank_0&&!(d2||didDraw))
			{
				b->FastTile(3, curr_x, y, TILE_NUMBERS+d2, 0, OP_OPAQUE);
				didDraw = true;
			}
			curr_x += NUMBERTILE_WID + NUMBERTILE_SPACING;
			++digits;
		}
		b->FastTile(3, curr_x, y, TILE_NUMBERS+d1, 0, OP_OPAQUE);
		return ++digits;
	} //end
	void ShadowString(bitmap b, int layer, int x, int y, int font, int color, int bg, int fmat, char str, int op) //start
	{
		b->DrawString(layer, x+1, y, font, C_BLACK, bg, fmat, str, op);
		b->DrawString(layer, x, y+1, font, C_BLACK, bg, fmat, str, op);
		b->DrawString(layer, x+1, y+1, font, C_BLACK, bg, fmat, str, op);
		b->DrawString(layer, x, y, font, color, bg, fmat, str, op);
	} //end
	void DrawMenuCursor(bitmap b, int x, int y) //start
	{
		x-= MENUCURSOR_WID;
		y-= MENUCURSOR_HEI/2;
		b->FastCombo(7, x, y, COMBO_MENU_CURSOR, 0, OP_OPAQUE);
	} //end
}
