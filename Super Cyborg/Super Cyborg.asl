state ("Super Cyborg")
{
    byte level:"Super Cyborg.exe", 0x0035C2C, 0x00;
    byte saveslot:"Super Cyborg.exe", 0x0125930, 0x00;
    byte input:"Super Cyborg.exe", 0x0335FD8, 0xB4;
    short lives:"Super Cyborg.exe", 0x0335FD8, 0x14;
    byte scroll:"Super Cyborg.exe", 0x0045620, 0x08;
}
start
{
    return(current.scroll == 0x00 && current.level == 0x01 && current.input == 0x07 && old.input != 0x07);
}
split
{
    if(current.level == old.level + 1) return true;
    if(current.level == 0x07)
    {
        if(current.input == 0x1F && old.input != 0x1F || current.input == 0x21 && old.input != 0x21) return true;
    }
}
startup
{
	settings.Add("main", false, "AutoSplitter for Super Cyborg by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
}