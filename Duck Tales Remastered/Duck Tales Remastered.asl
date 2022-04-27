state ("ducktales")
{
    byte scene:         "DuckTales.exe", 0x007EC3FC, 0x18;
    byte scene2:        "DuckTales.exe", 0x00008A9C, 0x20;
    uint loading: 		"DuckTales.exe", 0x7BDC18;
    uint level:         "DuckTales.exe", 0x7BE348;
}
update
{
    //print(current.start.ToString("X8"));
}

start
{
    return (current.scene == 13 && old.scene == 0);
}

split
{
    if (current.level == 1 && old.scene2 == 15 && current.scene2 == 20) return true; // 1st boss
    /*if (old.level == 31 && current.level == 0) return true; //The Amazon & The Moon
    if (old.level == 11 && current.level == 0) return true; //Transylvania
    if (old.level == 17 && current.level == 0) return true; //African mines
    if (old.level == 24 && current.level == 0) return true; //The Himalayas
    if (old.level == 59 && current.level == 0) return true; //Mount Vesuvius*/
    if (old.scene == 5 && current.scene == 255) return true; // Clear -> dark
    if (old.scene == 19 && current.scene == 0) return true;
}

isLoading
{
    return (current.level == 0);
}

reset
{
    return (old.scene == 255 && current.scene == 1);
}

startup 
{
    refreshRate = 70;
	settings.Add("main", false, "AutoSplitter for DuckTales Remastered by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
}