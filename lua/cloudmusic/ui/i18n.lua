function CloudMusic.Languages.GetI18N(name,...)
    local text = (CloudMusic.Languages[GetConVar("gmod_language"):GetString()] or CloudMusic.Languages['en'])[name] or name
    for _,v in pairs{...} do
        text = string.Replace(text,"%"..v[1].."%",v[2])
    end
    return text
end