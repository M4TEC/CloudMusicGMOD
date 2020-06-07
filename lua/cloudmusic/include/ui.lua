CloudMusic.UI = {}
CloudMusic.UI.Materials = {}
CloudMusic.UI.Materials.Back = Material("cloudmusic/back.png")
function CloudMusic.UI.CreateVGUI(...)
    local panel = vgui.Create(...)
    if not panel then return nil end
    if panel.SetFont then panel:SetFont("CloudMusicDermaFont") end
    function panel:SetI18N(name)
        
    end
    function panel:RemoveI18N()

    end
    return panel
end