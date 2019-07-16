if CLIENT then
    local function Init()
        print("===========================\n")
        print("    Cloud Music for LUA    \n")
        print("         By  Texas         \n")
        print("===========================")
        if CloudMusic ~= nil and CloudMusic.Remove then
            local players = player.GetAll()
            for i=1,#players do
                local p = players[i]
                if IsValid(p.MusicChannel) then
                    p.MusicChannel:Stop()
                    p.MusicChannel = nil
                end
            end
            if CloudMusic.CurrentChannel then
                CloudMusic.CurrentChannel:Stop()
            end
            if CloudMusic.HUD ~= nil and CloudMusic.HUD.Remove then
                CloudMusic.HUD:Remove()
            end
            CloudMusic:Remove()
            CloudMusic = nil
        end
        surface.CreateFont("CloudMusicTitle", {
            font = "Microsoft YaHei",
            extended = false,
            size = 24,
            weight = 500,
            blursize = 0,
            scanlines = 0,
            antialias = true,
            underline = false,
            italic = false,
            strikeout = false,
            symbol = false,
            rotary = false,
            shadow = false,
            additive = false,
            outline = false,
        })
        surface.CreateFont("CloudMusicSubTitle", {
            font = "Microsoft YaHei",
            extended = false,
            size = 22,
            weight = 500,
            blursize = 0,
            scanlines = 0,
            antialias = true,
            underline = false,
            italic = false,
            strikeout = false,
            symbol = false,
            rotary = false,
            shadow = false,
            additive = false,
            outline = false,
        })
        surface.CreateFont("CloudMusicSmallTitle", {
            font = "Microsoft YaHei",
            extended = false,
            size = 18,
            weight = 500,
            blursize = 0,
            scanlines = 0,
            antialias = true,
            underline = false,
            italic = false,
            strikeout = false,
            symbol = false,
            rotary = false,
            shadow = false,
            additive = false,
            outline = false,
        })
        surface.CreateFont("CloudMusicText", {
            font = "Microsoft YaHei",
            extended = false,
            size = 14,
            weight = 500,
            blursize = 0,
            scanlines = 0,
            antialias = true,
            underline = false,
            italic = false,
            strikeout = false,
            symbol = false,
            rotary = false,
            shadow = false,
            additive = false,
            outline = false,
        })
        local winw,winh = ScrW()*0.8,ScrH()*0.7
        local targetOpacity = 0
        local isProgDragging = false
        local isVolDragging = false
        local lrc = nil
        local transLrc = nil
        local currentShowingPage = "Main"
        local currentMode = LocalPlayer():GetPData("CloudMusicMode","ListLoop")
        local slideAnimPix = winw/10
        local msg = ""
        local lrcStartPos = 1
        local transLrcStartPos = 1
        local function TextMessage(str)
            msg = str
            timer.Simple(10, function()msg = "" end)
        end
        local function GetMainColor()
            local r = tonumber(LocalPlayer():GetPData("CloudMusicMainRed","255")) or 255
            local g = tonumber(LocalPlayer():GetPData("CloudMusicMainGreen","255")) or 255
            local b = tonumber(LocalPlayer():GetPData("CloudMusicMainBlue","255")) or 255
            return Color(r,g,b)
        end
        local function SetMainColor(r,g,b)
            LocalPlayer():SetPData("CloudMusicMainRed",r)
            LocalPlayer():SetPData("CloudMusicMainGreen",g)
            LocalPlayer():SetPData("CloudMusicMainBlue",b)
            if CloudMusic.HUD.Ready then
                CloudMusic.HUD:RunJavascript([[
                    setMainColor(]]..r..[[,]]..g..[[,]]..b..[[);
                ]])
            end
        end
        local function GetSubColor()
            local r = tonumber(LocalPlayer():GetPData("CloudMusicSubRed","102")) or 102
            local g = tonumber(LocalPlayer():GetPData("CloudMusicSubGreen","204")) or 204
            local b = tonumber(LocalPlayer():GetPData("CloudMusicSubBlue","255")) or 255
            return Color(r,g,b)
        end
        local function SetSubColor(r,g,b)
            LocalPlayer():SetPData("CloudMusicSubRed",r)
            LocalPlayer():SetPData("CloudMusicSubGreen",g)
            LocalPlayer():SetPData("CloudMusicSubBlue",b)
            if CloudMusic.HUD.Ready then
                CloudMusic.HUD:RunJavascript([[
                    setSubColor(]]..r..[[,]]..g..[[,]]..b..[[);
                ]])
            end
        end
        local function FetchLyric()
            local currentPlaying = CloudMusic.CurrentPlaying
            lrc = nil
            transLrc = nil
            if LocalPlayer():GetPData("CloudMusicLyric","true") ~= "true" then return end
            lrcStartPos = 1
            transLrcStartPos = 1
            http.Fetch("http://129.204.91.119:21340/NeteaseLyric.aspx?song="..CloudMusic.CurrentPlaying.ID, function(body)
                local json = util.JSONToTable(body)
                if json == nil then
                    notification.AddLegacy("无法获取 "..currentPlaying.Name.." 的歌词", NOTIFY_ERROR, 3)
                    return
                end
                if json["code"] ~= 200 then
                    notification.AddLegacy("无法获取 "..currentPlaying.Name.." 的歌词（"..json["msg"].."）", NOTIFY_ERROR, 3)
                    return
                end
                if json["lyric"] == nil then
                    notification.AddLegacy("歌曲 "..currentPlaying.Name.." 暂无歌词", NOTIFY_GENERIC, 3)
                    return
                end
                if currentPlaying.ID ~= CloudMusic.CurrentPlaying.ID then return end
                lrc = json["lyric"]["lrc"]
                transLrc = json["lyric"]["tlrc"]
            end, function()notification.AddLegacy("无法获取 "..currentPlaying.Name.." 的歌词", NOTIFY_ERROR, 3) end)
        end
        local function SongEnded()
            if currentMode == "ListLoop" then
                CloudMusic:Next()
            elseif currentMode == "List" then
                local last = false
                for i=1,#CloudMusic.Songs do
                    local song = CloudMusic.Songs[i]
                    if song.ID == CloudMusic.CurrentPlaying.ID then
                        if i == #CloudMusic.Songs then
                            last = true
                        end
                        break
                    end
                end
                if not last then
                    CloudMusic:Next()
                end
            elseif currentMode == "Random" then
                CloudMusic:Play(math.random(1, #CloudMusic.Songs))
            elseif currentMode == "SingleLoop" then
                lrcStartPos = 1
                transLrcStartPos = 1
                CloudMusic.CurrentChannel:Play()
            end
        end
        local function SendSyncData()
            if LocalPlayer():GetPData("CloudMusic3D","false") ~= "true" then return end
            net.Start("CloudMusic3DSync")
            net.WriteEntity(LocalPlayer())
            net.WriteBool(IsValid(CloudMusic.CurrentChannel))
            net.WriteInt(IsValid(CloudMusic.CurrentChannel) and CloudMusic.CurrentChannel:GetState() or -1,32)
            net.WriteFloat(CloudMusic.Volume)
            net.WriteString(CloudMusic.CurrentPlaying and CloudMusic.CurrentPlaying.ID or "")
            net.WriteFloat(IsValid(CloudMusic.CurrentChannel) and CloudMusic.CurrentChannel:GetTime() or 0)
            net.SendToServer()
        end
        local function Create3DChannel(id,ply)
            if not ply.ChannelCreating then
                ply.ChannelCreating = true
                sound.PlayURL("https://music.163.com/song/media/outer/url?id="..id,"noblock 3d",function(station)
                    ply.ChannelCreating = false
                    if IsValid(station) then
                        ply.MusicChannel = station
                        ply.MusicChannelID = id
                        net.Start("CloudMusicReqSync")
                        net.SendToServer()
                    end
                end)
            end
        end
        function ToggleCloudMusic()
            if CloudMusic:IsVisible() then
                targetOpacity = 0
                if LocalPlayer():GetPData("CloudMusicAnimation","true") ~= "true" then
                    CloudMusic:SetAlpha(0)
                    CloudMusic:SetVisible(false)
                end
            else
                CloudMusic:MakePopup()
                CloudMusic:SetVisible(true)
                targetOpacity = 255
                if LocalPlayer():GetPData("CloudMusicAnimation","true") == "true" then
                    CloudMusic:SetAlpha(1)
                else
                    CloudMusic:SetAlpha(255)
                end
            end
        end
        if not CloudMusicRegisteredCAMI and CAMI then
            CloudMusicRegisteredCAMI = true
            CAMI.RegisterPrivilege({
                ["Name"] = "CloudMusic3D",
                ["MinAccess"] = "user"
            })
        end
        CloudMusic = vgui.Create("DFrame")
        CloudMusic:ShowCloseButton(false)
        CloudMusic:SetTitle("")
        function CloudMusic:Paint(w,h)
            surface.SetDrawColor(GetMainColor())
            surface.DrawRect(0, 0, w, h)
            surface.SetDrawColor(GetSubColor())
            surface.DrawRect(0, 0, winw, 30)
            draw.DrawText("网易云音乐", "CloudMusicTitle", 5, 3, GetMainColor())
            if msg ~= "" then draw.DrawText(msg, "CloudMusicText", 110, 13, GetMainColor()) end
        end
        function CloudMusic:Think()
            if not input.IsMouseDown(MOUSE_LEFT) and (CloudMusic.Dragging or isProgDragging or isVolDragging) then
                CloudMusic.Dragging = false
                isProgDragging = false
                isVolDragging = false
                SendSyncData()
            end
            if LocalPlayer():GetPData("CloudMusicAnimation","true") == "true" then
                if CloudMusic:GetAlpha() == 0 and targetOpacity == 0 then
                    CloudMusic:SetVisible(false)
                end
                if CloudMusic:GetAlpha() > targetOpacity then
                    CloudMusic:SetAlpha(CloudMusic:GetAlpha()-25.5)
                    if CloudMusic:GetAlpha() < 0 then
                        CloudMusic:SetAlpha(0)
                    end
                elseif CloudMusic:GetAlpha() < targetOpacity then
                    CloudMusic:SetAlpha(CloudMusic:GetAlpha()+25.5)
                    if CloudMusic:GetAlpha() > 255 then
                        CloudMusic:SetAlpha(255)
                    end
                end
            end
            if CloudMusic.Dragging then
                local cx,cy = gui.MouseX(),gui.MouseY()
                CloudMusic:SetPos(cx-CloudMusic.StartX,cy-CloudMusic.StartY)
            end
        end
        function CloudMusic:OnKeyCodePressed(key)
            if key == KEY_F8 then
                ToggleCloudMusic()
            end
        end
        function CloudMusic:OnMousePressed(key)
            local x,y = self:LocalCursorPos()
            if key == MOUSE_LEFT and y <= 30 then
                CloudMusic.Dragging = true
                CloudMusic.StartX = x
                CloudMusic.StartY = y
            end
        end
        function CloudMusic:OnMouseReleased(key)
            CloudMusic.Dragging = false
        end
        CloudMusic:SetSize(winw, winh)
        CloudMusic:SetPos(ScrW()/2-winw/2,ScrH()/2-winh/2)
        CloudMusic.Close = vgui.Create("DButton",CloudMusic)
        CloudMusic.Close:SetSize(30,30)
        CloudMusic.Close:SetPos(winw-30,0)
        CloudMusic.Close:SetColor(Color(255,255,255))
        CloudMusic.Close:SetText("X")
        CloudMusic.Close:SetDrawBackground(false)
        CloudMusic.Close.DoClick = ToggleCloudMusic
        function CloudMusic.Close:Paint(w,h)
            if self:IsHovered() then
                surface.SetDrawColor(255, 0, 0)
                surface.DrawRect(0,0,w,h)
            end
        end
        CloudMusic.Body = vgui.Create("DPanel",CloudMusic)
        CloudMusic.Body:SetPos(0,30)
        CloudMusic.Body:SetSize(winw,winh-30)
        function CloudMusic.Body:Paint(w,h)
            draw.DrawText("Made by Texas ", "CloudMusicText", winw, 0, Color(202,202,202), TEXT_ALIGN_RIGHT)
        end
        function CloudMusic.Body:Think()
            if currentShowingPage == "Settings" and (self:GetPos()) > -winw then
                if LocalPlayer():GetPData("CloudMusicAnimation","true") == "true" then
                    self:SetPos((self:GetPos()-slideAnimPix),30)
                else
                    self:SetPos(-winw,30)
                end
            elseif currentShowingPage == "Main" and (self:GetPos()) ~= 0 then
                if LocalPlayer():GetPData("CloudMusicAnimation","true") == "true" then
                    self:SetPos((self:GetPos()+slideAnimPix),30)
                    if (self:GetPos()) > 0 then self:SetPos(0,30) end
                else
                    self:SetPos(0,30)
                end
            end
        end
        CloudMusic.SettingsButton = vgui.Create("DButton",CloudMusic.Body)
        CloudMusic.SettingsButton:SetPos(winw-35,19)
        CloudMusic.SettingsButton:SetSize(30,20)
        CloudMusic.SettingsButton:SetColor(Color(255,255,255))
        CloudMusic.SettingsButton:SetText("设置")
        CloudMusic.SettingsButton.DoClick = function()currentShowingPage = "Settings" end
        function CloudMusic.SettingsButton:Paint(w,h)
            draw.RoundedBox(10, 0, 0, w, h, (self:IsHovered() and not self:GetDisabled()) and Color(0,153,230) or GetSubColor())
        end
        CloudMusic.SonglistForm = vgui.Create("DPanel",CloudMusic.Body)
        CloudMusic.SonglistForm:SetPos(5,5)
        CloudMusic.SonglistForm:SetSize(100,34)
        CloudMusic.SonglistForm:SetDrawBackground(false)
        function CloudMusic.SonglistForm:Paint(w,h)
            draw.DrawText("歌单ID","CloudMusicText",0,0,Color(0,0,0))
        end
        CloudMusic.SonglistForm.Input = vgui.Create("DTextEntry",CloudMusic.SonglistForm)
        CloudMusic.SonglistForm.Input:SetPos(0,14)
        CloudMusic.SonglistForm.Input:SetNumeric(true)
        CloudMusic.SonglistForm.Fetch = vgui.Create("DButton",CloudMusic.SonglistForm)
        CloudMusic.SonglistForm.Fetch:SetPos(65,14)
        CloudMusic.SonglistForm.Fetch:SetSize(30,20)
        CloudMusic.SonglistForm.Fetch:SetText("获取")
        CloudMusic.SonglistForm.Fetch:SetColor(Color(255,255,255))
        CloudMusic.SonglistForm.Fetch.DoClick = function()
            local success,songlist = xpcall(function()return CloudMusic.SonglistForm.Input:GetInt() end,function() end)
            if not success or songlist == nil then
                Derma_Message("请输入正确的歌单ID", "错误", "好的")
                return
            end
            http.Fetch("http://music.163.com/api/playlist/detail?id="..songlist, function(json)
                local obj = util.JSONToTable(json)
                if obj["code"] ~= 200 then
                    Derma_Message("获取歌单失败", "错误", "好的")
                    return
                end
                CloudMusic.PrevPage:SetVisible(false)
                CloudMusic.NextPage:SetVisible(false)
                CloudMusic.Songs = {}
                if #CloudMusic.Songlist:GetLines() ~= 0 then
                    for i=1,#CloudMusic.Songlist:GetLines() do
                        CloudMusic.Songlist:RemoveLine(i)
                    end
                end
                for i=1,#obj["result"]["tracks"] do
                    local track = obj["result"]["tracks"][i]
                    local artist = ""
                    for j=1,#track["artists"] do
                        if j ~= 1 then
                            artist = artist .. ", "
                        end
                        artist = artist .. track["artists"][j]["name"]
                    end
                    CloudMusic.Songlist:AddLine(track["name"],artist,track["id"])
                    table.insert(CloudMusic.Songs,{
                        Name = track["name"],
                        Artist = artist,
                        ID = track["id"],
                        Thumbnail = track["album"]["picUrl"]
                    })
                end
            end, function()Derma_Message("获取歌单失败", "错误", "好的") end)
        end
        function CloudMusic.SonglistForm.Fetch:Paint(w,h)
            draw.RoundedBox(10, 0, 0, w, h, (self:IsHovered() and not self:GetDisabled()) and Color(0,153,230) or GetSubColor())
        end
        local offset = 0
        local songCount = 0
        local searchWord = ""
        CloudMusic.SearchForm = vgui.Create("DPanel",CloudMusic.Body)
        CloudMusic.SearchForm:SetPos(105,5)
        CloudMusic.SearchForm:SetSize(135,34)
        function CloudMusic.SearchForm:Paint(w,h)
            draw.DrawText("搜索歌曲", "CloudMusicText", 0, 0, Color(0,0,0))
        end
        CloudMusic.SearchForm.Input = vgui.Create("DTextEntry",CloudMusic.SearchForm)
        CloudMusic.SearchForm.Input:SetPos(0,14)
        CloudMusic.SearchForm.Input:SetSize(100,20)
        CloudMusic.SearchForm.Search = vgui.Create("DButton",CloudMusic.SearchForm)
        CloudMusic.SearchForm.Search:SetPos(105,14)
        CloudMusic.SearchForm.Search:SetSize(30,20)
        CloudMusic.SearchForm.Search:SetColor(Color(255,255,255))
        CloudMusic.SearchForm.Search:SetText("搜索")
        CloudMusic.SearchForm.Search.DoClick = function()
            http.Post("http://music.163.com/api/search/pc", {
                ["s"] = CloudMusic.SearchForm.Input:GetValue(),
                ["type"] = "1",
                ["limit"] = "100"
            }, function(body)
                local json = util.JSONToTable(body)
                if json == nil or json["code"] ~= 200 then
                    Derma_Message("搜索失败", "错误", "好的")
                    return
                end
                TextMessage("搜索到 "..json["result"]["songCount"].." 首歌曲")
                if json["result"]["songCount"] > 100 then
                    CloudMusic.PrevPage:SetDisabled(true)
                    CloudMusic.PrevPage:SetVisible(true)
                    CloudMusic.NextPage:SetVisible(true)
                else
                    CloudMusic.PrevPage:SetVisible(false)
                    CloudMusic.NextPage:SetVisible(false)
                end
                offset = 0
                songCount = json["result"]["songCount"]
                searchWord = CloudMusic.SearchForm.Input:GetValue()
                CloudMusic.Songs = {}
                if #CloudMusic.Songlist:GetLines() ~= 0 then
                    for i=1,#CloudMusic.Songlist:GetLines() do
                        CloudMusic.Songlist:RemoveLine(i)
                    end
                end
                for i=1,#json["result"]["songs"] do
                    local track = json["result"]["songs"][i]
                    local artist = ""
                    for j=1,#track["artists"] do
                        if j ~= 1 then
                            artist = artist .. ", "
                        end
                        artist = artist .. track["artists"][j]["name"]
                    end
                    CloudMusic.Songlist:AddLine(track["name"],artist,track["id"])
                    table.insert(CloudMusic.Songs,{
                        Name = track["name"],
                        Artist = artist,
                        ID = track["id"],
                        Thumbnail = track["album"]["picUrl"]
                    })
                end
            end, function()Derma_Message("搜索失败", "错误", "好的") end)
        end
        function CloudMusic.SearchForm.Search:Paint(w,h)
            draw.RoundedBox(10, 0, 0, w, h, (self:IsHovered() and not self:GetDisabled()) and Color(0,153,230) or GetSubColor())
        end
        CloudMusic.PrevPage = vgui.Create("DButton",CloudMusic.Body)
        CloudMusic.PrevPage:SetPos(winw-190,19)
        CloudMusic.PrevPage:SetSize(45,20)
        CloudMusic.PrevPage:SetColor(Color(255,255,255))
        CloudMusic.PrevPage:SetText("上一页")
        CloudMusic.PrevPage:SetVisible(false)
        CloudMusic.PrevPage.DoClick = function()
            if offset == 0 then return end
            http.Fetch("http://music.163.com/api/search/pc?s="..CloudMusic.SearchForm.Input:GetValue().."&type=1&limit=100&offset="..offset-100, function(body)
                local json = util.JSONToTable(body)
                if json == nil or json["code"] ~= 200 then
                    Derma_Message("换页失败", "错误", "好的")
                end
                CloudMusic.NextPage:SetDisabled(false)
                offset = offset - 100
                if offset == 0 then CloudMusic.PrevPage:SetDisabled(true) end
                CloudMusic.Songs = {}
                if #CloudMusic.Songlist:GetLines() ~= 0 then
                    for i=1,#CloudMusic.Songlist:GetLines() do
                        CloudMusic.Songlist:RemoveLine(i)
                    end
                end
                for i=1,#json["result"]["songs"] do
                    local track = json["result"]["songs"][i]
                    local artist = ""
                    for j=1,#track["artists"] do
                        if j ~= 1 then
                            artist = artist .. ", "
                        end
                        artist = artist .. track["artists"][j]["name"]
                    end
                    CloudMusic.Songlist:AddLine(track["name"],artist,track["id"])
                    table.insert(CloudMusic.Songs,{
                        Name = track["name"],
                        Artist = artist,
                        ID = track["id"],
                        Thumbnail = track["album"]["picUrl"]
                    })
                end
            end, function()Derma_Message("换页失败", "错误", "好的") end)
        end
        function CloudMusic.PrevPage:Paint(w,h)
            draw.RoundedBox(10, 0, 0, w, h, (self:IsHovered() and not self:GetDisabled()) and Color(0,153,230) or GetSubColor())
        end
        CloudMusic.NextPage = vgui.Create("DButton",CloudMusic.Body)
        CloudMusic.NextPage:SetPos(winw-140,19)
        CloudMusic.NextPage:SetSize(45,20)
        CloudMusic.NextPage:SetColor(Color(255,255,255))
        CloudMusic.NextPage:SetText("下一页")
        CloudMusic.NextPage:SetVisible(false)
        CloudMusic.NextPage.DoClick = function()
            if offset+100 > songCount then return end
            http.Fetch("http://music.163.com/api/search/pc?s="..CloudMusic.SearchForm.Input:GetValue().."&type=1&limit=100&offset="..offset+100, function(body)
                local json = util.JSONToTable(body)
                if json == nil or json["code"] ~= 200 then
                    Derma_Message("换页失败", "错误", "好的")
                end
                CloudMusic.PrevPage:SetDisabled(false)
                offset = offset + 100
                if offset+100 > songCount then CloudMusic.NextPage:SetDisabled(true) end
                CloudMusic.Songs = {}
                if #CloudMusic.Songlist:GetLines() ~= 0 then
                    for i=1,#CloudMusic.Songlist:GetLines() do
                        CloudMusic.Songlist:RemoveLine(i)
                    end
                end
                for i=1,#json["result"]["songs"] do
                    local track = json["result"]["songs"][i]
                    local artist = ""
                    for j=1,#track["artists"] do
                        if j ~= 1 then
                            artist = artist .. ", "
                        end
                        artist = artist .. track["artists"][j]["name"]
                    end
                    CloudMusic.Songlist:AddLine(track["name"],artist,track["id"])
                    table.insert(CloudMusic.Songs,{
                        Name = track["name"],
                        Artist = artist,
                        ID = track["id"],
                        Thumbnail = track["album"]["picUrl"]
                    })
                end
            end, function()Derma_Message("换页失败", "错误", "好的") end)
        end
        function CloudMusic.NextPage:Paint(w,h)
            draw.RoundedBox(10, 0, 0, w, h, (self:IsHovered() and not self:GetDisabled()) and Color(0,153,230) or GetSubColor())
        end
        CloudMusic.Songlist = vgui.Create("DListView",CloudMusic.Body)
        CloudMusic.Songlist:AddColumn("歌曲名")
        CloudMusic.Songlist:AddColumn("歌手")
        CloudMusic.Songlist:AddColumn("歌曲ID"):SetMaxWidth(100)
        CloudMusic.Songlist:SetMultiSelect(false)
        CloudMusic.Songlist:SetPos(5,44)
        CloudMusic.Songlist:SetSize(winw-10,winh-149)
        function CloudMusic.Songlist:DoDoubleClick(id, line)
            CloudMusic:Play(id)
        end
        function CloudMusic:Play(id)
            if #CloudMusic.Songs == 0 then
                notification.AddLegacy("歌曲列表为空", NOTIFY_GENERIC, 3)
                return
            end
            if id ~= nil and CloudMusic.Songs[id] ~= nil then
                CloudMusic.CurrentPlaying = CloudMusic.Songs[id]
            end
            if CloudMusic.CurrentPlaying == nil then
                CloudMusic.CurrentPlaying = CloudMusic.Songs[1]
            end
            CloudMusic.Player.Thumbnail:SetHTML([[
                <body style="margin:0;">
                    <img src="]]..CloudMusic.CurrentPlaying.Thumbnail..[[" style="width:100%;height:100%;"/>
                </body>
            ]])
            CloudMusic.HUD:RunJavascript([[
                setThumbnail("]]..CloudMusic.CurrentPlaying.Thumbnail..[[");
                setSongname("]]..CloudMusic.CurrentPlaying.Name..[[");
                setArtist("]]..CloudMusic.CurrentPlaying.Artist..[[");
            ]])
            if IsValid(CloudMusic.CurrentChannel) then
                CloudMusic.CurrentChannel:Stop()
            end
            sound.PlayURL("https://music.163.com/song/media/outer/url?id="..CloudMusic.CurrentPlaying.ID..".mp3", "noblock", function(station)
                if IsValid(station) then
                    station:Play()
                    CloudMusic.CurrentChannel = station
                    FetchLyric()
                else
                    notification.AddLegacy("无法播放 "..CloudMusic.CurrentPlaying.Name, NOTIFY_ERROR, 3)
                    if currentMode == "ListLoop" then
                        CloudMusic:Next()
                    elseif currentMode == "List" then
                        local last = false
                        for i=1,#CloudMusic.Songs do
                            local song = CloudMusic.Songs[i]
                            if song.ID == CloudMusic.CurrentPlaying.ID then
                                if i == #CloudMusic.Songs then
                                    last = true
                                end
                                break
                            end
                        end
                        if not last then
                            CloudMusic:Next()
                        end
                    elseif currentMode == "Random" then
                        CloudMusic:Play(math.random(1, #CloudMusic.Songs))
                    elseif currentMode == "SingleLoop" then
                        notification.AddLegacy("由于 "..CloudMusic.CurrentPlaying.Name.." 无法播放，已切到下一首", NOTIFY_GENERIC, 3)
                        CloudMusic:Next()
                    end
                end
                SendSyncData()
            end)
        end
        function CloudMusic:Next()
            if CloudMusic.CurrentPlaying ~= nil and #CloudMusic.Songs ~= 0 then
                local found = false
                for i=1,#CloudMusic.Songs do
                    local song = CloudMusic.Songs[i]
                    if song.ID == CloudMusic.CurrentPlaying.ID then
                        if i == #CloudMusic.Songs then
                            CloudMusic:Play(1)
                        else
                            CloudMusic:Play(i+1)
                        end
                        found = true
                        break
                    end
                end
                if not found then
                    CloudMusic:Play(1)
                end
            else
                CloudMusic:Play()
            end
        end
        function CloudMusic:Prev()
            if CloudMusic.CurrentPlaying ~= nil and #CloudMusic.Songs ~= 0 then
                local found = false
                for i=1,#CloudMusic.Songs do
                    local song = CloudMusic.Songs[i]
                    if song.ID == CloudMusic.CurrentPlaying.ID then
                        if i == 1 then
                            CloudMusic:Play(#CloudMusic.Songs)
                        else
                            CloudMusic:Play(i-1)
                        end
                        found = true
                        break
                    end
                end
                if not found then
                    CloudMusic:Play(1)
                end
            else
                CloudMusic:Play()
            end
        end
        CloudMusic.Player = vgui.Create("DPanel", CloudMusic.Body)
        CloudMusic.Volume = tonumber(LocalPlayer():GetPData("CloudMusicVolume","1")) or 1
        CloudMusic.Player:SetPos(5,49+(winh-149))
        CloudMusic.Player:SetSize(winw-10,winh-44-(winh-149)-40)
        CloudMusic.Player.Thumbnail = vgui.Create("DHTML",CloudMusic.Player)
        CloudMusic.Player.Thumbnail:SetSize(CloudMusic.Player:GetTall(),CloudMusic.Player:GetTall())
        function CloudMusic.Player:Paint(w,h)
            local left = winh-44-(winh-149)-35
            if CloudMusic.CurrentPlaying == nil then
                return
            end
            if IsValid(CloudMusic.CurrentChannel) and LocalPlayer():GetPData("CloudMusicFFT","true") == "true" then
                local samples = {}
                local count = CloudMusic.CurrentChannel:FFT(samples,FFT_256)
                local width = ((w-(winh-44-(winh-149)+155)-130)-count*1+1)/count
                local l = winh-44-(winh-149)+155
                for i=1,count do
                    local sample = samples[i]*2
                    surface.SetDrawColor(0, 0, 0)
                    surface.DrawRect(l, h-h*sample, width, h*sample)
                    l = l + width + 1
                end
            end
            draw.DrawText(CloudMusic.CurrentPlaying.Name,"CloudMusicTitle",left,0,Color(0,0,0))
            draw.DrawText(CloudMusic.CurrentPlaying.Artist,"CloudMusicText",left,24,Color(0,0,0))
            local maxwidth = winw-10-left
            draw.RoundedBox(2.5, left, 40, maxwidth, 5, Color(226,226,226))
            if IsValid(CloudMusic.CurrentChannel) then
                draw.RoundedBox(2.5, left, 40, CloudMusic.CurrentChannel:GetTime() / CloudMusic.CurrentChannel:GetLength() * maxwidth, 5, GetSubColor())
            end
            draw.DrawText("音量", "CloudMusicText", self:GetWide()-133, self:GetTall()-14, Color(0,0,0))
            draw.RoundedBox(2.5, self:GetWide()-100, self:GetTall()-9.5, 100, 5, Color(226,226,226))
            draw.RoundedBox(2.5, self:GetWide()-100, self:GetTall()-9.5, CloudMusic.Volume*100, 5, GetSubColor())
        end
        function CloudMusic.Player:OnMousePressed(key)
            if key == MOUSE_LEFT then
                local x,y = CloudMusic.Player:LocalCursorPos()
                local maxwidth = winw-10-(winh-44-(winh-149)-35)
                if y >= 40 and y <= 45 and x>= winh-44-(winh-149)-35 and x <= winh-44-(winh-149)-35+maxwidth then
                    isProgDragging = true
                end
                if y >= self:GetTall()-9.5 and y <= self:GetTall()-4.5 and x >= self:GetWide()-100 and x<= self:GetWide() then
                    isVolDragging = true
                end
            end
        end
        function CloudMusic.Player:OnMouseReleased()
            isProgDragging = false
            isVolDragging = false
            SendSyncData()
        end
        function CloudMusic.Player:Think()
            if isProgDragging and IsValid(CloudMusic.CurrentChannel) then
                local x,y = CloudMusic.Player:LocalCursorPos()
                local left = x - (winh-44-(winh-149)-35)
                local maxwidth = winw-10-(winh-44-(winh-149)-35)
                local percent = left / maxwidth
                if percent < 0 then
                    percent = 0
                elseif percent > 1 then
                    percent = 1
                end
                lrcStartPos = 1
                transLrcStartPos = 1
                CloudMusic.CurrentChannel:SetTime(percent * CloudMusic.CurrentChannel:GetLength())
            end
            if isVolDragging then
                local x,y = CloudMusic.Player:LocalCursorPos()
                local left = x - (self:GetWide()-100)
                local percent = left / 100
                if percent < 0 then
                    percent = 0
                elseif percent > 1 then
                    percent = 1
                end
                CloudMusic.Volume = percent
                LocalPlayer():SetPData("CloudMusicVolume",percent)
            end
            if CloudMusic.CurrentPlaying == nil then
                CloudMusic.Player.Prev:SetVisible(false)
                CloudMusic.Player.PlayPause:SetVisible(false)
                CloudMusic.Player.Next:SetVisible(false)
                CloudMusic.Player.Mode:SetVisible(false)
                CloudMusic.Player.CopyLink:SetVisible(false)
            else
                CloudMusic.Player.Prev:SetVisible(true)
                CloudMusic.Player.PlayPause:SetVisible(true)
                CloudMusic.Player.Next:SetVisible(true)
                CloudMusic.Player.Mode:SetVisible(true)
                CloudMusic.Player.CopyLink:SetVisible(true)
            end
        end
        CloudMusic.Player.Prev = vgui.Create("DButton",CloudMusic.Player)
        CloudMusic.Player.Prev:SetPos(winh-44-(winh-149)-35,48)
        CloudMusic.Player.Prev:SetSize(45,20)
        CloudMusic.Player.Prev:SetColor(Color(255,255,255))
        CloudMusic.Player.Prev:SetText("上一首")
        CloudMusic.Player.Prev.DoClick = CloudMusic.Prev
        function CloudMusic.Player.Prev:Paint(w,h)
            draw.RoundedBox(10, 0, 0, w, h, (self:IsHovered() and not self:GetDisabled()) and Color(0,153,230) or GetSubColor())
        end
        function CloudMusic.Player.Prev:Think()
            self:SetDisabled(not IsValid(CloudMusic.CurrentChannel))
        end
        CloudMusic.Player.PlayPause = vgui.Create("DButton",CloudMusic.Player)
        CloudMusic.Player.PlayPause:SetPos(winh-44-(winh-149)+13,48)
        CloudMusic.Player.PlayPause:SetSize(30,20)
        CloudMusic.Player.PlayPause:SetColor(Color(255,255,255))
        CloudMusic.Player.PlayPause.DoClick = function()
            if CloudMusic.CurrentChannel:GetState() == GMOD_CHANNEL_PLAYING or CloudMusic.CurrentChannel:GetState() == GMOD_CHANNEL_STALLED then
                CloudMusic.CurrentChannel:Pause()
            else
                CloudMusic.CurrentChannel:Play()
            end
        end
        function CloudMusic.Player.PlayPause:Paint(w,h)
            draw.RoundedBox(10, 0, 0, w, h, (self:IsHovered() and not self:GetDisabled()) and Color(0,153,230) or GetSubColor())
        end
        function CloudMusic.Player.PlayPause:Think()
            if IsValid(CloudMusic.CurrentChannel) then
                self:SetDisabled(false)
                self:SetText((CloudMusic.CurrentChannel:GetState() == GMOD_CHANNEL_PLAYING or CloudMusic.CurrentChannel:GetState() == GMOD_CHANNEL_STALLED) and "暂停" or "播放")
            else
                self:SetText("播放")
                self:SetDisabled(true)
            end
        end
        CloudMusic.Player.Next = vgui.Create("DButton",CloudMusic.Player)
        CloudMusic.Player.Next:SetPos(winh-44-(winh-149)+46,48)
        CloudMusic.Player.Next:SetSize(45,20)
        CloudMusic.Player.Next:SetColor(Color(255,255,255))
        CloudMusic.Player.Next:SetText("下一首")
        CloudMusic.Player.Next.DoClick = CloudMusic.Next
        function CloudMusic.Player.Next:Paint(w,h)
            draw.RoundedBox(10, 0, 0, w, h, (self:IsHovered() and not self:GetDisabled()) and Color(0,153,230) or GetSubColor())
        end
        function CloudMusic.Player.Next:Think()
            self:SetDisabled(not IsValid(CloudMusic.CurrentChannel))
        end
        CloudMusic.Player.Mode = vgui.Create("DButton",CloudMusic.Player)
        CloudMusic.Player.Mode:SetPos(winh-44-(winh-149)+94,48)
        CloudMusic.Player.Mode:SetSize(60,20)
        CloudMusic.Player.Mode:SetColor(Color(255,255,255))
        function CloudMusic.Player.Mode:DoClick()
            if currentMode == "ListLoop" then
                currentMode = "SingleLoop"
            elseif currentMode == "SingleLoop" then
                currentMode = "Random"
            elseif currentMode == "Random" then
                currentMode = "List"
            elseif currentMode == "List" then
                currentMode = "ListLoop"
            end
            LocalPlayer():SetPData("CloudMusicMode",currentMode)
        end
        function CloudMusic.Player.Mode:Paint(w,h)
            draw.RoundedBox(10, 0, 0, w, h, (self:IsHovered() and not self:GetDisabled()) and Color(0,153,230) or GetSubColor())
        end
        function CloudMusic.Player.Mode:Think()
            if currentMode == "ListLoop" then
                self:SetText("列表循环")
            elseif currentMode == "SingleLoop" then
                self:SetText("单曲循环")
            elseif currentMode == "Random" then
                self:SetText("随机播放")
            elseif currentMode == "List" then
                self:SetText("列表播放")
            end
        end
        CloudMusic.Player.CopyLink = vgui.Create("DButton",CloudMusic.Player)
        CloudMusic.Player.CopyLink:SetPos(CloudMusic.Player:GetWide()-60,0)
        CloudMusic.Player.CopyLink:SetSize(60,20)
        CloudMusic.Player.CopyLink:SetColor(Color(255,255,255))
        CloudMusic.Player.CopyLink:SetText("复制链接")
        CloudMusic.Player.CopyLink.DoClick = function()
            SetClipboardText("https://music.163.com/song/media/outer/url?id="..CloudMusic.CurrentPlaying.ID..".mp3")
            Derma_Message("已复制到剪贴板", "复制成功", "好的")
        end
        function CloudMusic.Player.CopyLink:Paint(w,h)
            draw.RoundedBox(10, 0, 0, w, h, (self:IsHovered() and not self:GetDisabled()) and Color(0,153,230) or GetSubColor())
        end
        CloudMusic.HUD = vgui.Create("DHTML")
        CloudMusic.HUD:ParentToHUD()
        CloudMusic.HUD:SetHTML([[
                <html>
                    <head>
                        <style>
                            .circle-bar { display:inline-block; font-size:200px; width: 36px; height: 36px; position: relative; background-color: #66CCFF; }
                            .circle-bar-left,.circle-bar-right { width: 36px; height: 36px; background-color: white; }
                            .circle-bar-right { clip:rect(0,auto,auto,18px); }
                            .circle-bar-left { clip:rect(0,18px,auto,0); }
                            .circle-bar * {  position: absolute; top:0; right:0; bottom:0; left:0; margin:auto; }
                            .circle-bar, .circle-bar > * { border-radius: 50%; }
                            .circle-bar > .thumbnail { width:32px; height:32px; position:absolute; top:0px; left:0px; z-index:2; }
                            .song-info { display:inline-block; }
                            .song-info > .artist { font-size:12px; }
                            .lyric > span:first-of-type { font-size:18px; }
                            .lyric > span:last-of-type { font-size:12px; }
                            body { word-break:keep-all; white-space:nowrap; font-family:'Microsoft YaHei',黑体; color:white; transition:all .3s linear; -webkit-transition:all .3s linear; overflow:hidden; }
                            body.hide { opacity:0; -webkit-opacity:0; }
                        </style>
                    </head>
                    <body class="hide">
                        <div class="circle-bar">
                            <div class="circle-bar-left"></div>
                            <div class="circle-bar-right"></div>
                            <img src="" class="thumbnail"/>
                        </div>
                        <div class="song-info">
                            <span class="name"></span><br/>
                            <span class="artist"></span>
                        </div>
                        <br/>
                        <div class="lyric">
                            <span></span>
                            <br/>
                            <span></span>
                        </div>
                        <script>
                        Element.prototype.css = function(property,value){
                            if ( value ) {
                                var index = property.indexOf('-');
                                if( index != -1 ) {
                                    var char = property.charAt(index+1).toUpperCase();
                                    property.replace(/(-*){1}/,char);
                                }
                                this.style[property] = value;
                            }else{
                                return window.getComputedStyle(this).getPropertyValue(property);
                            }
                        }
                        Element.prototype.css3 = function(property,value){
                            if( value ){
                                property = capitalize(property.toLowerCase());
                                this.style['webkit'+property] = value;
                                this.style['Moz'+property] = value;
                                this.style['ms'+property] = value;
                                this.style['O'+property] = value;
                                this.style[property.toLowerCase()] = value;
                            }else{
                                return window.getComputedStyle(this).getPropertyValue(
                                        ('webkit'+property)||('Moz'+property)||('ms'+property)||('O'+property)||property);
                            }
                            function capitalize(word){
                                return word.charAt(0).toUpperCase() + word.slice(1);
                            }
                        }
                        var circleBar    = document.getElementsByClassName('circle-bar')[0];
                        var color        = circleBar.css('background-color');
                        var left_circle  = circleBar.getElementsByClassName('circle-bar-left')[0];
                        var right_circle = circleBar.getElementsByClassName('circle-bar-right')[0];
                        var right_circle_ori = right_circle.css('background-color');
                        function setPercent(percent) {
                            if( percent <= 50 ) {
                                var rotate = 'rotate('+(percent*3.6)+'deg)';
                                right_circle.css3('transform',rotate);
                                right_circle.css ('background-color',right_circle_ori);
                                left_circle.css3('transform','rotate(0deg)');
                            } else {
                                var rotate = 'rotate('+((percent-50)*3.6)+'deg)';
                                right_circle.css ('background-color',color);
                                right_circle.css3('transform','rotate(0deg)');
                                left_circle.css3 ('transform',rotate);
                            }
                        }
                        function setThumbnail(src) {
                            setLrc("","");
                            setPercent(0);
                            document.getElementsByClassName("thumbnail")[0].src = src;
                        }
                        function setSongname(name) {
                            setLrc("","");
                            setPercent(0);
                            document.getElementsByClassName("name")[0].innerText = name;
                        }
                        function setArtist(artist) {
                            setLrc("","");
                            setPercent(0);
                            document.getElementsByClassName("artist")[0].innerText = artist;
                        }
                        function setLrc(first,second) {
                            document.getElementsByClassName("lyric")[0].children[0].innerText = first;
                            document.getElementsByClassName("lyric")[0].children[2].innerText = second;
                        }
                        function setMainColor(r,g,b) {
                            right_circle_ori = "rgb("+r+","+g+","+b+")";
                            document.getElementsByClassName("circle-bar-left")[0].style.cssText = "background-color:rgb("+r+","+g+","+b+")";
                            document.getElementsByClassName("circle-bar-right")[0].style.cssText = "background-color:rgb("+r+","+g+","+b+")";
                            document.body.style.cssText = "color:rgb("+r+","+g+","+b+");";
                        }
                        function setSubColor(r,g,b) {
                            color = "rgb("+r+","+g+","+b+")";
                            document.getElementsByClassName("circle-bar")[0].style.cssText = "background-color:rgb("+r+","+g+","+b+")";
                        }
                        function show() {
                            setPercent(0);
                            document.body.className = "";
                        }
                        function hide() {
                            setPercent(0);
                            document.body.className = "hide";
                        }
                        </script>
                    </body>
                </html>
            ]])
        function CloudMusic.HUD:OnDocumentReady()
            self.Ready = true
            local main = GetMainColor()
            local sub = GetSubColor()
            self:RunJavascript([[
                setMainColor(]]..main.r..[[,]]..main.g..[[,]]..main.b..[[);
                setSubColor(]]..sub.r..[[,]]..sub.g..[[,]]..sub.b..[[);
            ]])
        end
        function CloudMusic.HUD:Think()
            self:SetSize(ScrW(),ScrH())
            if IsValid(CloudMusic.CurrentChannel) then
                CloudMusic.CurrentChannel:SetVolume(CloudMusic.Volume)
            end
            if not self.Ready then
                return
            end
            if IsValid(CloudMusic.CurrentChannel) then
                if CloudMusic.CurrentChannel:GetState() == GMOD_CHANNEL_PLAYING or CloudMusic.CurrentChannel:GetState() == GMOD_CHANNEL_STALLED then
                    if self.State ~= "SHOW" then
                        self:RunJavascript("show()")
                        self.State = "SHOW"
                    end
                elseif self.State ~= "HIDE" then
                    self:RunJavascript("hide()")
                    self.State = "HIDE"
                end
                self:RunJavascript([[
                    setPercent(]]..(CloudMusic.CurrentChannel:GetTime() / CloudMusic.CurrentChannel:GetLength() * 100)..[[);
                ]])
                if lrc ~= nil and IsValid(CloudMusic.CurrentChannel) and CloudMusic.CurrentChannel:GetState() == GMOD_CHANNEL_PLAYING then
                    local mainLrc = ""
                    local subLrc = ""
                    for i=lrcStartPos,#lrc do
                        local line = lrc[i]
                        if not IsValid(CloudMusic.CurrentChannel) then
                            break
                        end
                        if i == #lrc or lrc[i+1].Time > CloudMusic.CurrentChannel:GetTime()*1000 then
                            mainLrc = line.Value
                            if transLrc == nil and i ~= #lrc then
                                subLrc = lrc[i+1].Value
                            end
                            lrcStartPos = i
                            break
                        end
                    end
                    if transLrc ~= nil then
                        for i=transLrcStartPos,#transLrc do
                            local line = transLrc[i]
                            if not IsValid(CloudMusic.CurrentChannel) then
                                break
                            end
                            if i == #lrc or lrc[i+1].Time > CloudMusic.CurrentChannel:GetTime()*1000 then
                                subLrc = line.Value
                                transLrcStartPos = i
                                break
                            end
                        end
                    end
                    if CloudMusic.HUD.Ready then
                        CloudMusic.HUD:RunJavascript([[
                            setLrc("]]..mainLrc..[[","]]..subLrc..[[");
                        ]])
                    end
                end
            else
                self:RunJavascript("hide()")
                self.State = "HIDE"
            end
        end
        function CloudMusic.HUD:Paint(w,h)
            if IsValid(CloudMusic.CurrentChannel) then
                if LocalPlayer():GetPData("CloudMusicHUDFFT","false") == "true" then
                    local samples = {}
                    local count = CloudMusic.CurrentChannel:FFT(samples,FFT_256)
                    local height = (h*0.7-count*1+1)/count
                    local top = h/2-h*0.7/2
                    for i=1,count do
                        local sample = samples[i]
                        surface.SetDrawColor(GetMainColor())
                        surface.DrawRect(0, top, (w*0.3)*sample, height)
                        top = top + height + 1
                    end
                end
            end
        end
        CloudMusic.Settings = vgui.Create("DPanel",CloudMusic)
        CloudMusic.Settings:SetPos(winw,30)
        CloudMusic.Settings:SetSize(winw,winh-30)
        function CloudMusic.Settings:OnMousePressed(key)
            if key == MOUSE_LEFT then

            end
        end
        function CloudMusic.Settings:Paint(w,h)
            draw.DrawText("设置", "CloudMusicSubTitle", 5, 5, Color(0,0,0))
            draw.DrawText("显示界面内频谱", "CloudMusicText", 25, 30, Color(0,0,0))
            draw.DrawText("显示HUD频谱", "CloudMusicText", 25, 50, Color(0,0,0))
            if LocalPlayer():GetPData("CloudMusicHUDFFT","false") == "true" then draw.DrawText("（可能会导致严重掉帧）", "CloudMusicText", 90, 50, Color(255,0,0)) end
            draw.DrawText("显示歌词", "CloudMusicText", 25, 70, Color(0,0,0))
            draw.DrawText("启用动画", "CloudMusicText", 25, 90, Color(0,0,0))
            draw.DrawText("打开3D外放", "CloudMusicText", 140, 30, Color(0,0,0))
            draw.DrawText("屏蔽他人3D外放", "CloudMusicText", 140, 70, Color(0,0,0))
            draw.DrawText("主色调", "CloudMusicSmallTitle", 5, 112, Color(0,0,0))
            draw.DrawText("副色调", "CloudMusicSmallTitle", 160, 112, Color(0,0,0))
            draw.DrawText("本播放器由Texas制作，感谢淡定WackoD在界面开发遇到一个问题时的提示\n歌词功能使用了自有服务器进行简化处理", "CloudMusicText", w/2, h-64, Color(0,0,0), TEXT_ALIGN_CENTER)
            draw.DrawText("版本 1.2.1", "CloudMusicText", 5, winh-49, Color(0,0,0))
        end
        function CloudMusic.Settings:Think()
            if currentShowingPage == "Main" and (self:GetPos()) < winw then
                if LocalPlayer():GetPData("CloudMusicAnimation","true") == "true" then
                    self:SetPos((self:GetPos())+slideAnimPix,30)
                else
                    self:SetPos(winw,30)
                end
            elseif currentShowingPage == "Settings" and (self:GetPos()) ~= 0 then
                if LocalPlayer():GetPData("CloudMusicAnimation","true") == "true" then
                    self:SetPos((self:GetPos())-slideAnimPix,30)
                    if (self:GetPos()) < 0 then self:SetPos(0,30) end
                else
                    self:SetPos(0,30)
                end
            end
        end
        CloudMusic.Settings.Back = vgui.Create("DButton",CloudMusic.Settings)
        CloudMusic.Settings.Back:SetPos(50,5)
        CloudMusic.Settings.Back:SetSize(30,20)
        CloudMusic.Settings.Back:SetText("返回")
        CloudMusic.Settings.Back:SetColor(Color(255,255,255))
        CloudMusic.Settings.Back.DoClick = function()currentShowingPage = "Main" end
        function CloudMusic.Settings.Back:Paint(w,h)
            draw.RoundedBox(10, 0, 0, w, h, (self:IsHovered() and not self:GetDisabled()) and Color(0,153,230) or GetSubColor())
        end
        CloudMusic.Settings.FFT = vgui.Create("DCheckBox",CloudMusic.Settings)
        CloudMusic.Settings.FFT:SetPos(5,30)
        CloudMusic.Settings.FFT:SetChecked(LocalPlayer():GetPData("CloudMusicFFT","true") == "true")
        function CloudMusic.Settings.FFT:OnChange(val)
            LocalPlayer():SetPData("CloudMusicFFT", val)
        end
        CloudMusic.Settings.HUDFFT = vgui.Create("DCheckBox",CloudMusic.Settings)
        CloudMusic.Settings.HUDFFT:SetPos(5,50)
        CloudMusic.Settings.HUDFFT:SetChecked(LocalPlayer():GetPData("CloudMusicHUDFFT","false") == "true")
        function CloudMusic.Settings.HUDFFT:OnChange(val)
            LocalPlayer():SetPData("CloudMusicHUDFFT", val)
        end
        CloudMusic.Settings.Lyric = vgui.Create("DCheckBox",CloudMusic.Settings)
        CloudMusic.Settings.Lyric:SetPos(5,70)
        CloudMusic.Settings.Lyric:SetChecked(LocalPlayer():GetPData("CloudMusicLyric","true") == "true")
        function CloudMusic.Settings.Lyric:OnChange(val)
            lrc = nil
            transLrc = nil
            CloudMusic.HUD:RunJavascript([[
                setLrc("","");
            ]])
            if val and CloudMusic.CurrentPlaying ~= nil then
                FetchLyric()
            end
            LocalPlayer():SetPData("CloudMusicLyric", val)
        end
        CloudMusic.Settings.Animation = vgui.Create("DCheckBox",CloudMusic.Settings)
        CloudMusic.Settings.Animation:SetPos(5,90)
        CloudMusic.Settings.Animation:SetChecked(LocalPlayer():GetPData("CloudMusicAnimation","true") == "true")
        function CloudMusic.Settings.Animation:OnChange(val)
            LocalPlayer():SetPData("CloudMusicAnimation",val)
        end
        CloudMusic.Settings.A3D = vgui.Create("DCheckBox",CloudMusic.Settings)
        CloudMusic.Settings.A3D:SetPos(120,30)
        if ULib and ULib.ucl.query(LocalPlayer(),"cloudmusic3d") then
            CloudMusic.Settings.A3D:SetChecked(LocalPlayer():GetPData("CloudMusic3D","false") == "true")
        else
            CloudMusic.Settings.A3D:SetChecked(false)
        end
        function CloudMusic.Settings.A3D:OnChange(val)
            if ULib and not ULib.ucl.query(LocalPlayer(),"cloudmusic3d") and val then
                Derma_Message("你没有权限开启外放", "无权限", "好的")
                self:SetChecked(false)
                return
            end
            LocalPlayer():SetPData("CloudMusic3D", val)
            if val then
                SendSyncData()
            else
                net.Start("CloudMusic3DSync")
                net.WriteEntity(LocalPlayer())
                net.WriteBool(false)
                net.WriteInt(-1,32)
                net.WriteFloat(0)
                net.WriteString("")
                net.WriteFloat(0)
                net.SendToServer()
            end
        end
        function CloudMusic.Settings.A3D:Think()
            if ULib and not ULib.ucl.query(LocalPlayer(),"cloudmusic3d") then
                self:SetChecked(false)
                net.Start("CloudMusic3DSync")
                net.WriteEntity(LocalPlayer())
                net.WriteBool(false)
                net.WriteInt(-1,32)
                net.WriteFloat(0)
                net.WriteString("")
                net.WriteFloat(0)
                net.SendToServer()
            end
        end
        CloudMusic.Settings.Bypass3D = vgui.Create("DCheckBox",CloudMusic.Settings)
        CloudMusic.Settings.Bypass3D:SetPos(120,70)
        CloudMusic.Settings.Bypass3D:SetChecked(LocalPlayer():GetPData("CloudMusicBypass3D","false") == "true")
        function CloudMusic.Settings.Bypass3D:OnChange(val)
            LocalPlayer():SetPData("CloudMusicBypass3D", val)
            if val then
                local players = player.GetAll()
                for i=1,#players do
                    local p = players[i]
                    if IsValid(p.MusicChannel) then
                        p.MusicChannel:Stop()
                        p.MusicChannel = nil
                    end
                end
            else
                net.Start("CloudMusicReqSync")
                net.SendToServer()
            end
        end
        CloudMusic.Settings.MainColor = vgui.Create("DColorMixer",CloudMusic.Settings)
        CloudMusic.Settings.MainColor:SetPos(5,130)
        CloudMusic.Settings.MainColor:SetSize(150,200)
        CloudMusic.Settings.MainColor:SetAlphaBar(false)
        CloudMusic.Settings.MainColor:SetColor(GetMainColor())
        function CloudMusic.Settings.MainColor:ValueChanged(col)
            SetMainColor(col.r,col.g,col.b)
        end
        CloudMusic.Settings.SubColor = vgui.Create("DColorMixer",CloudMusic.Settings)
        CloudMusic.Settings.SubColor:SetPos(160,130)
        CloudMusic.Settings.SubColor:SetSize(150,200)
        CloudMusic.Settings.SubColor:SetAlphaBar(false)
        CloudMusic.Settings.SubColor:SetColor(GetSubColor())
        function CloudMusic.Settings.SubColor:ValueChanged(col)
            SetSubColor(col.r,col.g,col.b)
        end
        CloudMusic.Settings.Texas = vgui.Create("DButton",CloudMusic.Settings)
        CloudMusic.Settings.Texas:SetPos(winw/2-67.5,winh-66)
        CloudMusic.Settings.Texas:SetSize(65,20)
        CloudMusic.Settings.Texas:SetColor(Color(255,255,255))
        CloudMusic.Settings.Texas:SetText("联系Texas")
        CloudMusic.Settings.Texas.DoClick = function()
            gui.OpenURL("http://steamcommunity.com/profiles/76561198163912747")
        end
        function CloudMusic.Settings.Texas:Paint(w,h)
            draw.RoundedBox(10, 0, 0, w, h, (self:IsHovered() and not self:GetDisabled()) and Color(0,153,230) or GetSubColor())
        end
        CloudMusic.Settings.WackoD = vgui.Create("DButton",CloudMusic.Settings)
        CloudMusic.Settings.WackoD:SetPos(winw/2+2.5,winh-66)
        CloudMusic.Settings.WackoD:SetSize(100,20)
        CloudMusic.Settings.WackoD:SetColor(Color(255,255,255))
        CloudMusic.Settings.WackoD:SetText("联系淡定WackoD")
        CloudMusic.Settings.WackoD.DoClick = function()
            gui.OpenURL("https://steamcommunity.com/profiles/76561198046405253/")
        end
        function CloudMusic.Settings.WackoD:Paint(w,h)
            draw.RoundedBox(10, 0, 0, w, h, (self:IsHovered() and not self:GetDisabled()) and Color(0,153,230) or GetSubColor())
        end
        CloudMusic.Settings.Exusiai = vgui.Create("DHTML",CloudMusic.Settings)
        CloudMusic.Settings.Exusiai:SetPos(0,0)
        CloudMusic.Settings.Exusiai:SetSize(winw,winh-30)
        CloudMusic.Settings.Exusiai:SetZPos(-1)
        CloudMusic.Settings.Exusiai:SetHTML([[
            <img src="http://penguin-logistics.cn/images/exusiai.png" style="user-select:none;position:absolute;bottom:5px;right:5px;max-height:50%;"/>
        ]])
        CloudMusic.Songs = {}
        CloudMusic:SetAlpha(0)
        CloudMusic:SetVisible(false)
        timer.Create("CloudMusicHUDFFT",1,0,function()
            if IsValid(CloudMusic.CurrentChannel) and LocalPlayer():GetPData("CloudMusicHUDFFT","false") == "true" then
                local samples = {}
                local count = CloudMusic.CurrentChannel:FFT(samples,FFT_256)
                local height = (ScrH()*0.7-count*1+1)/count
                local top = ScrH()/2-ScrH()*0.7/2
                for i=1,count do
                    local sample = samples[i]
                    surface.SetDrawColor(GetMainColor())
                    surface.DrawRect(0, top, (ScrW()*0.3)*sample, height)
                    top = top + height + 1
                end
            end
        end)
        timer.Start("CloudMusicHUDFFT")
        local didPlayerPaused = false
        hook.Add("PreCleanupMap","CloudMusic_PreCleanup",function()
            if IsValid(CloudMusic.CurrentChannel) then
                didPlayerPaused = CloudMusic.CurrentChannel:GetState() == GMOD_CHANNEL_PAUSED
            end
        end)
        hook.Add("PostCleanupMap", "CloudMusic_PostCleanup", function()
            if IsValid(CloudMusic.CurrentChannel) and not didPlayerPaused then
                CloudMusic.CurrentChannel:Play()
            end
        end)
        hook.Add("Think","CloudMusic_Think",function()
            if IsValid(CloudMusic.CurrentChannel) and CloudMusic.CurrentChannel:GetTime() == CloudMusic.CurrentChannel:GetLength() then
                SongEnded()
            end
            local players = player.GetAll()
            for i=1,#players do
                local p = players[i]
                if p ~= LocalPlayer() and IsValid(p.MusicChannel) then
                    p.MusicChannel:SetPos(p:GetPos())
                end
            end
        end)
        net.Receive("ToggleCloudMusic", ToggleCloudMusic)
        net.Receive("CloudMusicKeyDown",function()
            if not IsValid(CloudMusic.CurrentChannel) or not CloudMusic.CurrentPlaying then return end
            if input.IsKeyDown(KEY_LALT) then
                if input.IsKeyDown(KEY_LEFT) then
                    CloudMusic:Prev()
                elseif input.IsKeyDown(KEY_RIGHT) then
                    CloudMusic:Next()
                elseif input.IsKeyDown(KEY_UP) then
                    if CloudMusic.CurrentChannel:GetState() == GMOD_CHANNEL_PLAYING or CloudMusic.CurrentChannel:GetState() == GMOD_CHANNEL_STALLED then
                        CloudMusic.CurrentChannel:Pause()
                    else
                        CloudMusic.CurrentChannel:Play()
                    end
                end
            end
        end)
        net.Receive("CloudMusic3DSync",function(len,ply)
            if LocalPlayer():GetPData("CloudMusicBypass3D","false") == "true" then return end
            local p = net.ReadEntity()
            local valid = net.ReadBool()
            local state = net.ReadInt(32)
            local volume = net.ReadFloat()
            local id = net.ReadString()
            local time = net.ReadFloat()
            if p == LocalPlayer() then return end
            if valid then
                if not IsValid(p.MusicChannel) then
                    Create3DChannel(id,p)
                else
                    if p.MusicChannelID ~= id then
                        p.MusicChannel:Stop()
                        p.MusicChannel = nil
                        Create3DChannel(id,p)
                    else
                        if state == GMOD_CHANNEL_PAUSED then
                            p.MusicChannel:Pause()
                        elseif state == GMOD_CHANNEL_STOPPED then
                            p.MusicChannel:Stop()
                        elseif state == GMOD_CHANNEL_PLAYING or state == GMOD_CHANNEL_STALLED then
                            if p.MusicChannel:GetState() ~= GMOD_CHANNEL_PLAYING and p.MusicChannel:GetState() ~= GMOD_CHANNEL_STALLED then p.MusicChannel:Play() end
                            p.MusicChannel:SetVolume(volume)
                            p.MusicChannel:SetTime(time)
                        end
                    end
                end
            elseif IsValid(p.MusicChannel) then
                p.MusicChannel:Stop()
                p.MusicChannel = nil
            end
        end)
        net.Receive("CloudMusicReqSync", SendSyncData)
    end
    hook.Add("InitPostEntity", "CloudMusic_Init", Init)
    Init()
end
if SERVER then
    local function HookKey()
        print("===========================\n")
        print("    Cloud Music for LUA    \n")
        print("         By  Texas         \n")
        print("===========================")
        util.AddNetworkString("ToggleCloudMusic")
        util.AddNetworkString("CloudMusicKeyDown")
        util.AddNetworkString("CloudMusic3DSync")
        util.AddNetworkString("CloudMusicReqSync")
        if not CloudMusicRegisteredULib and ULib then
            CloudMusicRegisteredULib = true
            ULib.ucl.registerAccess("cloudmusic3d","user","允许玩家使用3D外放功能","网易云音乐")
        end
    end
    hook.Add("InitPostEntity", "CloudMusic_Init", HookKey)
    hook.Add("PlayerButtonDown", "CloudMusic_KeyPress", function(ply,btn)
        if btn == KEY_F8 then
            net.Start("ToggleCloudMusic")
            net.Send(ply)
        else
            net.Start("CloudMusicKeyDown")
            net.Send(ply)
        end
    end)
    hook.Add("PlayerSpawn", "CloudMusic_PlayerSpawn", function()
        net.Start("CloudMusicReqSync")
        net.Broadcast()
    end)
    net.Receive("CloudMusicReqSync", function()
        net.Start("CloudMusicReqSync")
        net.Broadcast()
    end)
    net.Receive("CloudMusic3DSync", function()
        local p = net.ReadEntity()
        local valid = net.ReadBool()
        local state = net.ReadInt(32)
        local volume = net.ReadFloat()
        local id = net.ReadString()
        local time = net.ReadFloat()
        if ULib and not ULib.ucl.query(p,"cloudmusic3d") and valid then return end
        net.Start("CloudMusic3DSync")
        net.WriteEntity(p)
        net.WriteBool(valid)
        net.WriteInt(state, 32)
        net.WriteFloat(volume)
        net.WriteString(id)
        net.WriteFloat(time)
        net.Broadcast()
    end)
    HookKey()
end