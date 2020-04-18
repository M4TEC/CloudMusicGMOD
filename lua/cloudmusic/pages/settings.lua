hook.Add("CloudMusicCreatePage", "CloudMusicSettingsPage", function(frame)
    local page = frame:AddPage("Settings")
    function page:Paint()
        draw.DrawText("This is second page", "CloudMusicText", 0, 0, Color(0,0,0))
    end
end)