state("Shenmue2")
{
	int TimePassing : 0xE0BC90;			//Will be 0 in the Main Menu, in the Y Menu, Viewing items in the menu or Pausing the Game
	int MainMenu : 0x8205E18;			//Will be 0 while in the Main Menu, 1 in-game and 3 when the game is paused
	int Notebook : 0xAA0980;			//Will be 1 when the Notebook is open
	int YMenu : 0x3D58650;				//Will be 1 when the Y menu is open
	int MapGlitch : 0xAA1808;			//Will be 1 when viewing an item in the Y Menu, which is what this glitch does
	int DustyBooks : 0xE80ED8;			//Will be 1 when carrying books (Time works differently in this area)
	int Fight : 0x3D84438;				//Will be 1 during un-winnable fight
	int Donation : 0xD05D5C;			//Will be 1 during Donation scene
	int RenQTE : 0x6DA0634;				//Will be 1 during Ren QTE chase
	int Goodbye : 0xE1848C;				//Will be 1 during leaving Hong Kong segment
	int GreatView : 0xF5D480; 			//Will be 1 when in when in the Great View building cutscene
}

isLoading
{
	if (current.Notebook > 0 && current.TimePassing < 1) {		//If the Notebook is open, then do not pause the timer
		return false;
	} 
	else if (current.MainMenu < 1 && current.TimePassing < 1) {	//If in the Main Menu, then do not pause the timer
		return false;
	}
	else if (current.MainMenu == 3 && current.TimePassing < 1) {	//If the Game is paused, then do not pause the timer
		return false;
	}
	else if (current.YMenu > 0 && current.TimePassing < 1) {	//If the Y Menu is open, then do not pause the timer
		return false;
	}
	else if (current.MapGlitch > 0 && current.TimePassing < 1) {	//If viewing an item in the menu, then do not pause the timer
		return false;
	}
	else if (current.DustyBooks > 0 && current.TimePassing < 1) {	//If carrying books, then do not pause the timer
		return false;
	}
	else if (current.Fight > 0 && current.TimePassing < 1) {	//If in un-winnable fight, then do not pause the timer
		return false;
	} 
	else if (current.Donation > 0 && current.TimePassing < 1) {	//If in the donation cutscene, then do not pause the timer
		return false;
	} 
	else if (current.RenQTE > 0 && current.TimePassing < 1) {	//If in the chasing Ren QTE, then do not pause the timer
		return false;
	} 
	else if (current.Goodbye > 0 && current.TimePassing < 1) {	//If in the leaving Hong Kong sequence, then do not pause the timer
		return false;
	} 
	else if (current.GreatView == 1 && current.TimePassing < 1) {	//If in Great View building cutscene, then do not pause the timer
		return false;
	} 
	else return current.TimePassing < 1;				//Else pause the timer if the Time Passing value is 0
}
