CM_Print("CloudMusic client-side is initializing...")
LoadSettings()
CM_Print("CloudMusic client-side initialized")
function CloudMusic:Toggle()
    if IsValid(self.Frame) then
        self.Frame:Close()
    else
        LoadSettings()
        self.Frame = CloudMusic.UI.CreateVGUI("CloudMusicFrame")
        hook.Call("CloudMusicCreatePage", nil, self.Frame)
        self.Frame:Show()
    end
end
net.Receive("CloudMusicToggle",function()
    CloudMusic:Toggle()
end)
concommand.Add("cloudmusic", function()
    CloudMusic:Toggle() 
end, nil, CloudMusic.Languages.GetI18N("toggle_cloudmusic"))