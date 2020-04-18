hook.Add("CloudMusicCreatePage", "CloudMusicMainPage", function(frame)
    local page = frame:AddPage("Main")
    function page:Paint()
        draw.DrawText("This is main page","CloudMusicText",0,0,Color(0,0,0))
    end
    local sBtn = CreateVGUI("DButton", page)
    sBtn:SetPos(0, 20)
    function sBtn:DoClick()
        frame:SwitchPage("Settings")
    end
end)