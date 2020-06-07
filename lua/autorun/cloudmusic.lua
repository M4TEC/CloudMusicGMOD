CreateConVar("cloudmusic_verbose", 0, FCVAR_NONE, "Toggle CloudMusic Verbose Mode")
function CM_Print(msg,color)
    if GetConVar("cloudmusic_verbose") ~= nil and GetConVar("cloudmusic_verbose"):GetInt() ~= 1 then return end
    local DEF_COLOR = CLIENT and Color( 255, 222, 102 ) or Color( 137, 222, 255 )
    if color == nil then color = DEF_COLOR end
    MsgC(DEF_COLOR,"[",Color(102,204,255),"CloudMusic",DEF_COLOR,"] ",color,msg,"\n")
end
CLOUDMUSIC_VER = "1.6.0[Alpha v1]" -- DO NOT modify unless you know WHAT ARE YOU DOING
CloudMusic = {
    Languages = {}
}
AddCSLuaFile()
AddCSLuaFile("cloudmusic/cl_init.lua")
for _,v in pairs(select(2,file.Find("cloudmusic/*","lsv"))) do
    for _,f in pairs(file.Find("cloudmusic/"..v.."/*.lua","lsv")) do
        AddCSLuaFile("cloudmusic/"..v.."/"..f)
    end
end
if SERVER then
    include "cloudmusic/include/constant.lua"
    include "cloudmusic/init.lua"
end
if CLIENT then
    for _,v in pairs(select(2,file.Find("cloudmusic/*","lsv"))) do
        for _,f in pairs(file.Find("cloudmusic/"..v.."/*.lua","lsv")) do
            include("cloudmusic/"..v.."/"..f)
        end
    end
    include "cloudmusic/cl_init.lua"
end