
void NoDirs()
{
	Input->Press[CB_UP] = false;
	Input->Press[CB_DOWN] = false;
	Input->Press[CB_LEFT] = false;
	Input->Press[CB_RIGHT] = false;
	Input->Button[CB_UP] = false;
	Input->Button[CB_DOWN] = false;
	Input->Button[CB_LEFT] = false;
	Input->Button[CB_RIGHT] = false;
}

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
