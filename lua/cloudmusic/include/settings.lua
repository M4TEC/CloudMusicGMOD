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
DefaultSettings = {
    ["CloudMusicAnimation"] = true,
    ["CloudMusicAnimationTime"] = 0.3,
    ["CloudMusicTitleBarTextColor"] = Color(255,255,255),
    ["CloudMusicTitleBarColor"] = Color(102,204,255),
    ["CloudMusicBackgroundColor"] = Color(255,255,255)
}
Settings = table.Copy(DefaultSettings)
function SaveSettings()
    local temp = table.Copy(Settings)
    temp["version"] = FORMAT_VERSION
    file.Write(path, util.Compress(util.TableToJSON(temp)))
    Print("User settings saved")
end
function LoadSettings()
    if not file.Exists(path, "DATA") then
        SaveSettings()
        Print("No settings file, creating a new file")
    end
    local json = util.JSONToTable(util.Decompress(file.Read(path)))
    if not json then
        SaveSettings()
        Print("Invalid settings file, resetting settings file")
    else
        if json["version"] ~= FORMAT_VERSION then
            SaveSettings()
            json = Settings
            Print("Settings file version is different from current version, resetting setttings file")
        end
        local index = 0
        for k,_ in ipairs(json) do
            if k == "version" then
                table.remove(json,index) 
            end
            index = index + 1
        end
        for k,v in pairs(DefaultSettings) do
            if json[k] == nil then
                json[k] = v
            end
        end
        Settings = json
        SaveSettings()
        setmetatable(Settings, settingsMeta)
        Print("User settings loaded")
    end
end