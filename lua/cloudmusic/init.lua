util.AddNetworkString("CloudMusicToggle")
util.AddNetworkString("CloudMusicAction")
function CloudMusic.Toggle(ply)
    net.Start("CloudMusicToggle")
    net.Send(ply)
end
function CloudMusic.PlayPause(ply)
    net.Start("CloudMusicAction")
    net.WriteUInt(CM_ACTION_PLAY_PAUSE,4)
    net.Send(ply)
end
function CloudMusic.Next(ply)
    net.Start("CloudMusicAction")
    net.WriteUInt(CM_ACTION_NEXT,4)
    net.Send(ply)
end
function CloudMusic.Prev(ply)
    net.Start("CloudMusicAction")
    net.WriteUInt(CM_ACTION_PREV,4)
    net.Send(ply)
end
hook.Add("PlayerSay", "CloudMusic_CommandHandler", function(ply,text)
    if string.lower(text) == "!cm" or string.lower(text) == "!cloudmusic" then
        CloudMusic.Toggle(ply)
        return ""
    end
end)
hook.Add("PlayerButtonDown", "CloudMusic_ShortcutHandler", function(ply, btn)
    if not game.SinglePlayer() then return end
    if key == KEY_LALT or key == KEY_RALT then ply.CM_Alt = true end
    if ply.CM_Alt then
        if btn == KEY_DOWN then
            CloudMusic.Toggle(ply)
        elseif btn == KEY_LEFT then
            CloudMusic.Prev(ply)
        elseif btn == KEY_RIGHT then
            CloudMusic.Next(ply)
        elseif btn == KEY_UP then
            CloudMusic.PlayPause(ply)
        end
    end
end)
hook.Add("PlayerButtonUp", "CloudMusic_ShortcutHandler", function(ply, btn)
    if not game.SinglePlayer() then return end
    if key == KEY_LALT or key == KEY_RALT then ply.CM_Alt = false end
end)