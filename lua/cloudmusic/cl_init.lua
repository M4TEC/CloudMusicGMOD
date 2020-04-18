Print("CloudMusic client-side is initializing...")
function GetAssetUrl(name)
    return "asset://garrysmod/materials/"..name
end
function CreateVGUI(...)
    local panel = vgui.Create(...)
    if not panel then return nil end
    if panel.SetFont then panel:SetFont("CloudMusicDermaFont") end
    function panel:SetI18N(name)
        
    end
    function panel:RemoveI18N()

    end
    return panel
end
LoadSettings()
Print("CloudMusic client-side initialized")
function CloudMusic:Toggle()
    if IsValid(self.Frame) then
        self.Frame:Close()
    else
        LoadSettings()
        self.Frame = CreateVGUI("CloudMusicFrame")
        hook.Call("CloudMusicCreatePage", nil, self.Frame)
        self.Frame:Show()
    end
end
net.Receive("CloudMusicToggle",function()
    CloudMusic:Toggle()
end)
concommand.Add("cloudmusic", function()
    CloudMusic:Toggle() 
end, nil, GetI18N("toggle_cloudmusic"))