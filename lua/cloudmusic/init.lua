util.AddNetworkString("CloudMusicToggle")
hook.Add("PlayerSay", "CloudMusic_CommandHandler", function(ply,text)
    if string.lower(text) == "!cm" or string.lower(text) == "!cloudmusic" then
        net.Start("CloudMusicToggle")
        net.Send(ply)
        return ""
    end
end)