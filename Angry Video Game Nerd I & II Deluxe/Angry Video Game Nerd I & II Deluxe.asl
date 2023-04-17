state ("Angry Video Game Nerd I & II Deluxe")
{
    float igt: "mono-2.0-bdwgc.dll", 0x00497D88, 0x7A0, 0x580, 0x9C8;
    byte screen: "UnityPlayer.dll", 0x19C5C40;
    byte menu: "mono-2.0-bdwgc.dll", 0x00497D88, 0x440, 0x320, 0xE94;
    float igtlvl: "mono-2.0-bdwgc.dll", 0x00497DC8, 0xB0, 0xDF0;
}
init
{
    vars.levelComplete = false;
}
isLoading
{
    return true;
}
gameTime
{
    return TimeSpan.FromSeconds(current.igt);
}
start
{
    if (old.igt == 0x00 && current.igt != 0x00 && current.screen == 0x17)
    {
        vars.levelComplete = false;
        return true;
    }
}
split
{
    if (current.igtlvl == old.igtlvl && current.menu != 1) vars.levelComplete = true;
    if (old.screen != 0x04 && current.screen == 0x04 && vars.levelComplete == true)
    {
        vars.levelComplete = false;
        return true;
    }
    if (old.screen == 0x05 && current.screen == 0x03) return true;
}
startup 
{
	settings.Add("main", false, "AutoSplitter for Angry Video Game Nerd I & II Deluxe by PakLomak & Xanders08");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
    settings.Add("main2", false, "--https://www.twitch.tv/xanders08", "main");
}
