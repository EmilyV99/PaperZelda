
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
	CONFIG MENU_SMALLFONT = FONT_MARIOLAND;//FONT_Z3SMALL;
	CONFIG MENU_SMALLFONT_HEIGHT = FONT_MARIOLAND_HEIGHT;//FONT_Z3SMALL_HEIGHT
	//
	CONFIGB DEBUG_OUTPUT_BG_BITMAP = false;
	CONFIGB DEBUG_MOUSE_STUFF = true;
	// Tiles / Combos
	CONFIG SBG_TILE_TAB_START = 211640;
	CONFIG SBG_TILE_BOX_START = 211656;
	CONFIG TILE_NUMBERS = 211390;
	CONFIG TILE_COLON = 211389;
	CONFIG TILE_MINUS = 211388;
	CONFIG TILE_SLASH = 211387;
	CONFIG NUMBERTILE_WID = 6;
	CONFIG NUMBERTILE_HEI = 8;
	CONFIG NUMBERTILE_SPACING = 1;
	//
	DEFINE SBG_BOX_BORDER_PX = 2;
	COLOR SBG_BOX_CDARK = C_TAN_DARK;
	COLOR SBG_BOX_CLIGHT = C_TAN_LIGHT;
	//end General Constants
	//start Link Tab Constants
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
	CONFIG BPH_LEVEL = 4+MENU_SMALLFONT_HEIGHT;
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
		//start Mouse system stuff
		int x1=-1, y1, x2=-1, y2, tx, ty;
		bool active;
		bool wasmouse;
		bool shift = false;
		//end Mouse system stuff
		do //start Loop
		{
			subbmp->ClearToColor(0,BG_COLOR); //Reset the bitmap to the BG color
			//start Tab Switching
			if(Input->Press[CB_R])
			{
				tab = getTab(tab+1);
			}
			else if(Input->Press[CB_L])
			{
				tab = getTab(tab-1);
			}
			//end Tab Switching
			//Draw the background for this tab
			background_bmp->Blit(0,subbmp,tab*SCREENWID,0,SCREENWID,SCREENHEI,0,0,SCREENWID,SCREENHEI,0,0,0,BITDX_NORMAL,0,true);
			//start tab-specific
			switch(tab)
			{
				case TAB_LINK: //start
				{
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
					subbmp->Rectangle(0, BX_LVL, BY_LVL, BX_LVL+BPW_LVL, BY_LVL+BPH_LEVEL, C_LINK_GREEN, 1, 0, 0, 0, true, OP_OPAQUE);
					ShadowString(subbmp, 1, BX_LVL+4, BY_LVL+2, MENU_SMALLFONT, C_WHITE, -1, TF_NORMAL, "Link", OP_OPAQUE);
					char buf[32];
					sprintf(buf, "Lvl. %d", Game->Counter[CR_LEVEL]);
					ShadowString(subbmp, 1, BX_LVL+BPW_LVL - 3 - Text->StringWidth(buf, MENU_SMALLFONT), BY_LVL+2, MENU_SMALLFONT, C_WHITE, -1, TF_NORMAL, buf, OP_OPAQUE);
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
					//TODO Per-frame draws for this tab
					break;
				} //end
				case TAB_GEAR: //start
				{
					//TODO Per-frame draws for this tab
					break;
				} //end
				case TAB_INVENTORY: //start
				{
					//TODO Per-frame draws for this tab
					break;
				} //end
				case TAB_RINGS: //start
				{
					//TODO Per-frame draws for this tab
					break;
				} //end
				case TAB_MAP: //start
				{
					//TODO Per-frame draws for this tab
					break;
				} //end
				case TAB_JOURNAL: //start
				{
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
					Screen->FastTile(7,mx,my,TILE_CURSOR,0,OP_OPAQUE);
				}
				if(x1!=-1)
				{
					char buf[16];
					sprintf(buf, "x1,y1: %d,%d",x1,y1+56);
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
		bitmap temp = bitmaps::acquire(pwid, phei);
		temp->ClearToColor(0, SBG_BOX_CDARK);
		temp->Rectangle(0, SBG_BOX_BORDER_PX, SBG_BOX_BORDER_PX, pwid-1, phei-1, SBG_BOX_CLIGHT, 1, 0, 0, 0, true, OP_OPAQUE);
		temp->Triangle(0, 0, 0, 0, (SBG_BOX_BORDER_PX*3), (SBG_BOX_BORDER_PX*3), 0, 0, 0, SBG_BOX_CDARK, 0, 0, PT_FLAT, NULL);
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
		int curr_x = x;
		if(d6 || mindigits>=6)
		{
			unless(blank_0&&!d6) b->FastTile(3, curr_x, y, TILE_NUMBERS+d6, 0, OP_OPAQUE);
			curr_x += NUMBERTILE_WID + NUMBERTILE_SPACING;
			++digits;
		}
		if(d5 || mindigits>=5)
		{
			unless(blank_0&&!d5) b->FastTile(3, curr_x, y, TILE_NUMBERS+d5, 0, OP_OPAQUE);
			curr_x += NUMBERTILE_WID + NUMBERTILE_SPACING;
			++digits;
		}
		if(d4 || mindigits>=4)
		{
			unless(blank_0&&!d4) b->FastTile(3, curr_x, y, TILE_NUMBERS+d4, 0, OP_OPAQUE);
			curr_x += NUMBERTILE_WID + NUMBERTILE_SPACING;
			++digits;
		}
		if(d3 || mindigits>=3)
		{
			unless(blank_0&&!d3) b->FastTile(3, curr_x, y, TILE_NUMBERS+d3, 0, OP_OPAQUE);
			curr_x += NUMBERTILE_WID + NUMBERTILE_SPACING;
			++digits;
		}
		if(d2 || mindigits>=2)
		{
			unless(blank_0&&!d2) b->FastTile(3, curr_x, y, TILE_NUMBERS+d2, 0, OP_OPAQUE);
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
	/* Ended up not needing this.
	void DrawComboTimer(bitmap b, int x, int y, int combo, int clk)
	{
		combodata cd = Game->LoadComboData(combo);
		unless(cd->Frames) cd->Frames = 1;
		unless(cd->ASpeed) cd->ASpeed = 1;
		int t = clk % (cd->Frames * cd->ASpeed);
		int tile = OTILE + Div(t, cd->ASpeed);
		b->FastTile(3, x, y, tile, 0, OP_OPAQUE);
	}*/
}
