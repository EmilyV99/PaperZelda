
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
	//start Constants
	DEFINE SCREENWID = 256;
	DEFINE SCREENHEI = 224;
	COLOR BG_COLOR = COLOR_BLACK;
	CONFIG FADETIME = 120; //Time, in frames, of the opening/closing animation
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
		//Start was just pressed! Do any loading stuff, declare any local vars needed, etc
		Tab tab = TAB_LINK; //The tab you are on when you open the subscreen
		
		bitmap background_bmp = bitmaps::acquire(SCREENWID*NUM_TABS, SCREENHEI);
		//TODO Draw the 7 backgrounds to the background_bmp here!
		bitmap subbmp = bitmaps::acquire(SCREENWID,SCREENHEI);
		
		int fade_timer = FADETIME;
		
		do
		{
			if(fade_timer) TotalNoAction(); //No buttons while the animation is playing
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
					//TODO Per-frame draws for this tab
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
			if(fade_timer) //Opening animation
			{
				//TODO Do some sort of rotated/stetched blit for the "opening subscreen" effect
				--fade_timer;
			}
			else subbmp->Blit(7,RT_SCREEN,0,0,SCREENWID,SCREENHEI,0,-56,SCREENWID,SCREENHEI,0,0,0,BITDX_NORMAL,0,true);
			Waitframe();
		}
		until(Input->Press[CB_START]);
		fade_timer = FADETIME;
		while(fade_timer)
		{
			TotalNoAction();
			//TODO Do some sort of rotated/stretched blit for the "closing subscreen" effect
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
}
