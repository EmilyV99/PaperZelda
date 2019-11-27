
void TotalNoAction()
{
	for(int q = 0; q < CB_MAX; ++q)
	{
		Input->Button[q] = false;
		Input->Press[q] = false;
	}
}

enum BitNum
{
	FLAG_1, FLAG_2, FLAG_3, FLAG_4,
	FLAG_5, FLAG_6, FLAG_7, FLAG_8,
	FLAG_9, FLAG_10, FLAG_11, FLAG_12,
	FLAG_13, FLAG_14, FLAG_15, FLAG_16,
	FLAG_17, FLAG_18, FLAG_19, FLAG_20,
	FLAG_21, FLAG_22, FLAG_23, FLAG_24,
	FLAG_25, FLAG_26, FLAG_27, FLAG_28,
	FLAG_29, FLAG_30, FLAG_31, FLAG_32
};

//32-bit binary accessor
bool get_bit(int num, int bit)
{
	#option BINARY_32BIT on
	return num & (1<<bit);
}

//32-bit binary setter
int set_bit(int num, int bit, bool state)
{
	#option BINARY_32BIT on
	if(state)
		num |= 1<<bit;
	else
		num &= ~(1<<bit);
	return num;
}

namespace PlayTime //start
{
	DEFINE TIME_FRAME = 0.0001;
	DEFINE FRAME_PER_SECOND = 60;
	DEFINE SECOND_PER_MINUTE = 60;
	DEFINE MINUTE_PER_HOUR = 60;
	int getHour()
	{
		unless(Game->TimeValid) return -1;
		return ((Game->Time / (FRAME_PER_SECOND*SECOND_PER_MINUTE))	 / MINUTE_PER_HOUR) * 10000;
	}
	
	int getMinute()
	{
		unless(Game->TimeValid) return -1;
		return ((Game->Time % (TIME_FRAME*FRAME_PER_SECOND*SECOND_PER_MINUTE*MINUTE_PER_HOUR)) / (FRAME_PER_SECOND*SECOND_PER_MINUTE)) *10000;
	}
	
	int getSecond()
	{
		unless(Game->TimeValid) return -1;
		return ((Game->Time % (TIME_FRAME*FRAME_PER_SECOND*SECOND_PER_MINUTE)) / FRAME_PER_SECOND) * 10000;
	}
	
	int getFrame(bool percent)
	{
		unless(Game->TimeValid) return -1;
		int frame = (Game->Time % (TIME_FRAME*FRAME_PER_SECOND)) * 10000;
		return percent ? Floor((frame/60)*100): frame;
	}
	
	int getTotalMinutes()
	{
		unless(Game->TimeValid) return -1;
		return ((Game->Time) / (FRAME_PER_SECOND*SECOND_PER_MINUTE)) *10000;
	}
	
	int getTotalSeconds()
	{
		unless(Game->TimeValid) return -1;
		return ((Game->Time) / FRAME_PER_SECOND) * 10000;
	}
} //end PlayTime

namespace Debug
{
	typedef untyped u;
	//start Error Logging
	void err(char buf, u a1, u a2, u a3, u a4, u a5, u a6, u a7, u a8, u a9, u aA, u aB, u aC, u aD, u aE, u aF)
	{
		if(DEBUG_LOGGING)
		{
			char temp[512];
			sprintf(temp, "[ERROR] %s\n", buf);
			printf(temp, a1, a2, a3, a4, a5, a6, a7, a8, a9, aA, aB, aC, aD, aE, aF);
		}
	}
	void err(char buf, u a1, u a2, u a3, u a4, u a5, u a6, u a7, u a8, u a9, u aA, u aB, u aC, u aD, u aE)
	{
		if(DEBUG_LOGGING)
		{
			char temp[512];
			sprintf(temp, "[ERROR] %s\n", buf);
			printf(temp, a1, a2, a3, a4, a5, a6, a7, a8, a9, aA, aB, aC, aD, aE);
		}
	}
	void err(char buf, u a1, u a2, u a3, u a4, u a5, u a6, u a7, u a8, u a9, u aA, u aB, u aC, u aD)
	{
		if(DEBUG_LOGGING)
		{
			char temp[512];
			sprintf(temp, "[ERROR] %s\n", buf);
			printf(temp, a1, a2, a3, a4, a5, a6, a7, a8, a9, aA, aB, aC, aD);
		}
	}
	void err(char buf, u a1, u a2, u a3, u a4, u a5, u a6, u a7, u a8, u a9, u aA, u aB, u aC)
	{
		if(DEBUG_LOGGING)
		{
			char temp[512];
			sprintf(temp, "[ERROR] %s\n", buf);
			printf(temp, a1, a2, a3, a4, a5, a6, a7, a8, a9, aA, aB, aC);
		}
	}
	void err(char buf, u a1, u a2, u a3, u a4, u a5, u a6, u a7, u a8, u a9, u aA, u aB)
	{
		if(DEBUG_LOGGING)
		{
			char temp[512];
			sprintf(temp, "[ERROR] %s\n", buf);
			printf(temp, a1, a2, a3, a4, a5, a6, a7, a8, a9, aA, aB);
		}
	}
	void err(char buf, u a1, u a2, u a3, u a4, u a5, u a6, u a7, u a8, u a9, u aA)
	{
		if(DEBUG_LOGGING)
		{
			char temp[512];
			sprintf(temp, "[ERROR] %s\n", buf);
			printf(temp, a1, a2, a3, a4, a5, a6, a7, a8, a9, aA);
		}
	}
	void err(char buf, u a1, u a2, u a3, u a4, u a5, u a6, u a7, u a8, u a9)
	{
		if(DEBUG_LOGGING)
		{
			char temp[512];
			sprintf(temp, "[ERROR] %s\n", buf);
			printf(temp, a1, a2, a3, a4, a5, a6, a7, a8, a9);
		}
	}
	void err(char buf, u a1, u a2, u a3, u a4, u a5, u a6, u a7, u a8)
	{
		if(DEBUG_LOGGING)
		{
			char temp[512];
			sprintf(temp, "[ERROR] %s\n", buf);
			printf(temp, a1, a2, a3, a4, a5, a6, a7, a8);
		}
	}
	void err(char buf, u a1, u a2, u a3, u a4, u a5, u a6, u a7)
	{
		if(DEBUG_LOGGING)
		{
			char temp[512];
			sprintf(temp, "[ERROR] %s\n", buf);
			printf(temp, a1, a2, a3, a4, a5, a6, a7);
		}
	}
	void err(char buf, u a1, u a2, u a3, u a4, u a5, u a6)
	{
		if(DEBUG_LOGGING)
		{
			char temp[512];
			sprintf(temp, "[ERROR] %s\n", buf);
			printf(temp, a1, a2, a3, a4, a5, a6);
		}
	}
	void err(char buf, u a1, u a2, u a3, u a4, u a5)
	{
		if(DEBUG_LOGGING)
		{
			char temp[512];
			sprintf(temp, "[ERROR] %s\n", buf);
			printf(temp, a1, a2, a3, a4, a5);
		}
	}
	void err(char buf, u a1, u a2, u a3, u a4)
	{
		if(DEBUG_LOGGING)
		{
			char temp[512];
			sprintf(temp, "[ERROR] %s\n", buf);
			printf(temp, a1, a2, a3, a4);
		}
	}
	void err(char buf, u a1, u a2, u a3)
	{
		if(DEBUG_LOGGING)
		{
			char temp[512];
			sprintf(temp, "[ERROR] %s\n", buf);
			printf(temp, a1, a2, a3);
		}
	}
	void err(char buf, u a1, u a2)
	{
		if(DEBUG_LOGGING)
		{
			char temp[512];
			sprintf(temp, "[ERROR] %s\n", buf);
			printf(temp, a1, a2);
		}
	}
	void err(char buf, u a1)
	{
		if(DEBUG_LOGGING)
		{
			char temp[512];
			sprintf(temp, "[ERROR] %s\n", buf);
			printf(temp, a1);
		}
	}
	void err(char buf)
	{
		if(DEBUG_LOGGING)
		{
			printf("[ERROR] %s\n", buf);
		}
	}
	//end Error Logging
}
