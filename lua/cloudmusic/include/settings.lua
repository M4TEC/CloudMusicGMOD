local FORMAT_VERSION = "1.3.1" -- DO NOT MODIFY unless you know WHAT ARE YOU DOING
if not file.Exists("cloudmusic", "DATA") or not file.IsDir("cloudmusic", "DATA") then
    file.CreateDir("cloudmusic")
end
if not file.Exists("cloudmusic/settings", "DATA") or not file.IsDir("cloudmusic/settings", "DATA") then
    file.CreateDir("cloudmusic/settings")
end
local path = "cloudmusic/settings/"..string.Replace(FORMAT_VERSION, ".", "_")..".dat"
local settingsMeta = {
    __newindex = function(tbl,index,value)
        rawset(tbl,"CloudMusic"..index,value)
        SaveSettings()
    end,
    __index = function(tbl,index)
        return rawget(tbl,"CloudMusic"..index)
    end
}
CloudMusic.DefaultSettings = {
    ["CloudMusicAnimation"] = true,
    ["CloudMusicAnimationTime"] = 0.3,
    ["CloudMusicTitleBarTextColor"] = Color(255,255,255),
    ["CloudMusicTitleBarColor"] = Color(102,204,255),
    ["CloudMusicBackgroundColor"] = Color(255,255,255),
    ["CloudMusicButtonTextColor"] = Color(255,255,255),
    ["CloudMusicButtonColor"] = Color(102,204,255),
    ["CloudMusicButtonHoverColor"] = Color(0,153,230),
    ["CloudMusicButtonActivateColor"] = Color(0,86,130),
}
CloudMusic.Settings = table.Copy(CloudMusic.DefaultSettings)
function SaveSettings()
    local temp = table.Copy(CloudMusic.Settings)
    temp["version"] = FORMAT_VERSION
    file.Write(path, util.Compress(util.TableToJSON(temp)))
    CM_Print("User settings saved")
end
function LoadSettings()
    if not file.Exists(path, "DATA") then
        SaveSettings()
        CM_Print("No settings file, creating a new file")
    end
    local json = util.JSONToTable(util.Decompress(file.Read(path)))
    if not json then
        SaveSettings()
        CM_Print("Invalid settings file, resetting settings file")
    else
        if json["version"] ~= FORMAT_VERSION then
            SaveSettings()
            json = CloudMusic.DefaultSettings
            CM_Print("Settings file version is different from current version, resetting setttings file")
        end
        local index = 0
        for k,_ in ipairs(json) do
            if k == "version" then
                table.remove(json,index) 
            end
            index = index + 1
        end
        for k,v in pairs(CloudMusic.DefaultSettings) do
            if json[k] == nil then
                json[k] = v
            end
        end
        CloudMusic.Settings = json
        SaveSettings()
        setmetatable(CloudMusic.Settings, settingsMeta)
        CM_Print("User settings loaded")
    end
end
concommand.Add("cloudmusic_load_settings", LoadSettings, nil, "Reload Cloud Music Settings", FCVAR_LUA_CLIENT)
concommand.Add("cloudmusic_save_settings", SaveSettings, nil, "Save Cloud Music Settings", FCVAR_LUA_CLIENT)