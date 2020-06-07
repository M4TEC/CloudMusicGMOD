local PANEL = {}
AccessorFunc(PANEL, "max_value", "MaxValue", FORCE_NUMBER)
function PANEL:Paint(w,h)
    
end
vgui.Register("CloudMusicSlider", PANEL, "Panel")