CloudMusic.Utils = {}
function CloudMusic.Utils.DrawCircle( x, y, radius, seg )
	local cir = {}

	table.insert( cir, { x = x, y = y, u = 0.5, v = 0.5 } )
	for i = 0, seg do
		local a = math.rad( ( i / seg ) * -360 )
		table.insert( cir, { x = x + math.sin( a ) * radius, y = y + math.cos( a ) * radius, u = math.sin( a ) / 2 + 0.5, v = math.cos( a ) / 2 + 0.5 } )
	end

	local a = math.rad( 0 )
	table.insert( cir, { x = x + math.sin( a ) * radius, y = y + math.cos( a ) * radius, u = math.sin( a ) / 2 + 0.5, v = math.cos( a ) / 2 + 0.5 } )

	surface.DrawPoly( cir )
end
function CloudMusic.Utils.AbsNumDiff(a,b)
    if not a or not b then return 0 end
    return math.abs(a-b)
end
function CloudMusic.Utils.NumTo(a,b,c)
    if not a or not b or not c then return end
    if a-b < 0 then
        return -c
    else
        return c
    end
end

local lerps = {}
local lerpcalls = {}
hook.Add("Think", "CloudMusicLerpThink", function()
    for i,v in pairs(lerps) do
        if IsValid(v[1]) then
            local speed = CloudMusic.Utils.AbsNumDiff(v[3],v[4]) / v[5]
            local change = speed * FrameTime()
            v[7] = v[7] + CloudMusic.Utils.NumTo(v[4],v[7],math.min(CloudMusic.Utils.AbsNumDiff(v[4],v[7]),change))
            v[1][v[2]] = v[7]
            if v[7] == v[4] then table.remove(lerps, i) if v[6] ~= nil then v[6]() end end
        else
            table.remove(lerps, i)
        end
    end
    for i,v in pairs(lerpcalls) do
        local speed = CloudMusic.Utils.AbsNumDiff(v[2],v[3]) / v[4]
        local change = speed * FrameTime()
        v[5] = v[5] + CloudMusic.Utils.NumTo(v[3],v[5],math.min(CloudMusic.Utils.AbsNumDiff(v[3],v[5]),change))
        pcall(v[1], v[5])
        if v[5] == v[3] then table.remove(lerpcalls,i) if v[6] ~= nil then v[6]() end end
    end
end)
function CloudMusic.Utils.LerpChange(object,index,from,to,time,completecallback)
    for k,v in pairs(lerps) do
        if not IsValid(object) or (v[1] == object and v[2] == index) then
            table.remove(lerps, k)
        end
    end
    time = time or 0.3
    table.insert(lerps, {
        object,
        index,
        from,
        to,
        time,
        completecallback,
        from -- Current Value
    })
end
function CloudMusic.Utils.LerpCall(callback,from,to,time,completecallback)
    time = time or 0.3
    table.insert(lerpcalls, {
        callback,
        from,
        to,
        time,
        from, -- Current Value
        completecallback
    })
end
function CloudMusic.Utils.ColorEqual(a,b)
    if type(a) ~= "table" or type(b) ~= "table" then return false end
    if a.r == b.r and a.g == b.g and a.b == b.b then return true end
    return false
end
function CloudMusic.Utils.UnpackColor(c)
    return c.r,c.g,c.b
end
function CloudMusic.Utils.GetAssetUrl(name)
    return "asset://garrysmod/materials/"..name
end