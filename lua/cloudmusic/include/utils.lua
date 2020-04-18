function DrawCircle( x, y, radius, seg )
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
function AbsNumDiff(a,b)
    if not a or not b then return 0 end
    return math.abs(a-b)
end
function NumTo(a,b,c)
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
            local speed = AbsNumDiff(v[3],v[4]) / v[5]
            local change = speed * FrameTime()
            v[7] = v[7] + NumTo(v[4],v[7],math.min(AbsNumDiff(v[4],v[7]),change))
            v[1][v[2]] = v[7]
            if v[7] == v[4] then table.remove(lerps, i) if v[6] ~= nil then v[6]() end end
        else
            table.remove(lerps, i)
        end
    end
    for i,v in pairs(lerpcalls) do
        local speed = AbsNumDiff(v[2],v[3]) / v[4]
        local change = speed * FrameTime()
        v[5] = v[5] + NumTo(v[3],v[5],math.min(AbsNumDiff(v[3],v[5]),change))
        pcall(v[1], v[5])
        if v[5] == v[3] then table.remove(lerpcalls,i) if v[6] ~= nil then v[6]() end end
    end
end)
function LerpChange(object,index,from,to,time,completecallback)
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
function LerpCall(callback,from,to,time,completecallback)
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