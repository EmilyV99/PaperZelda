
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