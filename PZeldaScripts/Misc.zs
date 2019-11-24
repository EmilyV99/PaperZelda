
void TotalNoAction()
{
	for(int q = 0; q < CB_MAX; ++q)
	{
		Input->Button[q] = false;
		Input->Press[q] = false;
	}
}

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

namespace PlayTime
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
}
