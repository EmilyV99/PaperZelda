global script Init
{
	void run()
	{
		
	}
}

global script Active
{
	void run()
	{
		LinkMovement_Init();
		TangoInit();
		while(true)
		{
			Tango_Update1();
			LinkMovement_Update1();
			Waitdraw();
			Tango_Update2();
			LinkMovement_Update2();
			Waitframe();
			bitmaps::updatefreed();
		}
	}
}

global script onExit
{
	void run()
	{
		
	}
}

global script onSaveLoad
{
	void run()
	{
		
	}
}

global script onContGame
{
	void run()
	{
		
	}
}

global script onLaunch
{
	void run()
	{
		bitmaps::refresh_pointers();
	}
}

global script onF6Menu
{
	void run()
	{
		
	}
}

hero script hInit
{
	void run()
	{
		
	}
}

hero script hActive
{
	void run()
	{
		
	}
}

hero script hOnDeath
{
	void run()
	{
		
	}
}

hero script hOnWin //Touching a Zelda flag; custom credits
{
	void run()
	{
		
	}
}

