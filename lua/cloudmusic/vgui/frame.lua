local function GetMsgObjTop(msgs,msg)
    local before = 0
    local foundm = false
    for _,v in ipairs(msgs:GetChildren()) do
        local _,y = v:GetPos()
        if v == msg then foundm = true end
        if not foundm then before = y + v:GetTall() + 10 end
    end
    return before
end
local PANEL = {}
function PANEL:Init()
    self:SetSize(ScrW()*0.8, ScrH()*0.6)
    
    self.m_Close = CloudMusic.UI.CreateVGUI("DButton", self)
    self.m_Close:SetColor(Color(255,255,255))
    self.m_Close:SetText("X")
    self.m_Close:SetSize(26,26)
    self.m_Close:SetPos(self:GetWide()-31,30/2-26/2)
    self.m_Close.BGAlpha = 0
    function self.m_Close:DoClick()self:GetParent():Close()end
    function self.m_Close:Paint(w,h)
        if self:IsHovered() and not self.LastHovered then
            CloudMusic.Utils.LerpChange(self,"BGAlpha",0,255,CloudMusic.Settings["AnimationTime"])
        elseif not self:IsHovered() and self.LastHovered then
            CloudMusic.Utils.LerpChange(self,"BGAlpha",255,0,CloudMusic.Settings["AnimationTime"])
        end
        self.LastHovered = self:IsHovered()
        surface.SetDrawColor(Color(238,0,0,self.BGAlpha))
        draw.NoTexture()
        CloudMusic.Utils.DrawCircle(w/2,h/2,w/2,math.sin(CurTime()) + 25)
    end

    self.m_Body = CloudMusic.UI.CreateVGUI("Panel", self)
    self.m_Body:Dock(FILL)
    self.m_Body:DockMargin(5, 35, 5, 5)

    self.m_Messages = CloudMusic.UI.CreateVGUI("Panel", self.m_Body)
    self.m_Messages:SetSize(300,0)
    self.m_Messages:Dock(RIGHT)
    self.m_Messages:SetMouseInputEnabled(false)
    self.m_Messages:SetKeyboardInputEnabled(false)
    function self.m_Messages:Paint(w, h)
        for _,v in ipairs(self:GetChildren()) do
            if not v.IgnoreLayout then
                if CloudMusic.Settings["Animation"] then
                    v._top = v._top or GetMsgObjTop(self,v)
                    if not v.lastTop then v.lastTop = GetMsgObjTop(self,v) end
                    v.top = v.top == GetMsgObjTop(self,v) and v.top or GetMsgObjTop(self,v)
                    if v.top ~= v.lastTop then
                        CloudMusic.Utils.LerpChange(v,"_top",v._top,v.top,CloudMusic.Settings["AnimationTime"])
                    end
                    v.lastTop = v.top
                    v:SetPos(0,v._top)
                else
                    v:SetPos(0,GetMsgObjTop(self,v))
                end
            end
        end
    end

    self.m_CurrentPage = nil
end
local function InBackBtn(frm)
    local backSize = draw.GetFontHeight("CloudMusicTitle")
    local x,y = frm:LocalCursorPos()
    if x >= 5 and x <= 5 + backSize and y >= 3 and y <= 3 + backSize then return true end
    return false
end
function PANEL:Paint(w,h)
    if self.lastMain == nil then self.lastMain = true end
    self.backDelta = self.backDelta or 0
    self.backCol = self.backCol or 255
    draw.RoundedBoxEx(6, 0, 0, w, 30, CloudMusic.Settings["CloudMusicTitleBarColor"], true, true)
    draw.RoundedBoxEx(6, 0, 30, w, h-30, CloudMusic.Settings["CloudMusicBackgroundColor"], false, false, true, true)
    if self.m_CurrentPage.PageName == "Main" and not self.lastMain then
        if CloudMusic.Settings["Animation"] then
            CloudMusic.Utils.LerpChange(self,"backDelta",1,0,CloudMusic.Settings["AnimationTime"])
        else
            self.backDelta = 0
        end
    elseif self.m_CurrentPage.PageName ~= "Main" and self.lastMain then
        if CloudMusic.Settings["Animation"] then
            CloudMusic.Utils.LerpChange(self,"backDelta",0,1,CloudMusic.Settings["AnimationTime"])
        else
            self.backDelta = 1
        end
    end
    local backSize = draw.GetFontHeight("CloudMusicTitle")
    draw.DrawText(CloudMusic.Languages.GetI18N("name"),"CloudMusicTitle",5 + (backSize + 3) * self.backDelta,3)
    if self.backDelta > 0 then
        if InBackBtn(self) and not self.lastBackBtnHvrd then
            CloudMusic.Utils.LerpChange(self,"backCol",255,200,CloudMusic.Settings["AnimationTime"])
            self:SetCursor("hand")
        elseif not InBackBtn(self) and self.lastBackBtnHvrd then
            CloudMusic.Utils.LerpChange(self,"backCol",200,255,CloudMusic.Settings["AnimationTime"])
            self:SetCursor("none")
        end
        self.lastBackBtnHvrd = InBackBtn(self)
        surface.SetMaterial(CloudMusic.UI.Materials.Back)
        surface.SetDrawColor(self.backCol,self.backCol,self.backCol,255 * self.backDelta)
        surface.DrawTexturedRect(5 - 5 * (1-self.backDelta),3,backSize,backSize)
    else
        self.backCol = 255
    end
    if self.m_CurrentPage.PageName == "Main" then
        self.lastMain = true
    else
        self.lastMain = false
    end
end
function PANEL:Think()
    if not input.IsMouseDown(MOUSE_LEFT) and isDragging then
        if IsValid(self.BodyOverlay) and self.BodyOverlay.Remove then
            self.BodyOverlay:Remove()
        end
        isDragging = false
    end
    if isDragging then
        local cx,cy = gui.MouseX(),gui.MouseY()
        local nx,ny = cx-dragStartX,cy-dragStartY
        if nx < 0 then nx = 0 end
        if nx > ScrW()-self:GetWide() then nx = ScrW()-self:GetWide() end
        if ny < 0 then ny = 0 end
        if ny > ScrH()-self:GetTall() then ny = ScrH()-self:GetTall() end
        self:SetPos(nx,ny)
    end
end
function PANEL:OnMousePressed(key)
    local x,y = self:LocalCursorPos()
    if key == MOUSE_LEFT and y <= 30 then
        if InBackBtn(self) then
            self:SwitchPage("Main")
            return
        end
        isDragging = true
        dragStartX = x
        dragStartY = y
        if IsValid(self.BodyOverlay) and self.BodyOverlay.Remove then
            self.BodyOverlay:Remove()
        end
        self.BodyOverlay = vgui.Create("DPanel",self)
        self.BodyOverlay:SetPaintBackground(false)
        self.BodyOverlay:Dock(FILL)
        self.BodyOverlay:SetZPos(2)
    end
end
function PANEL:OnMouseReleased()
    isDragging = false
    if IsValid(self.BodyOverlay) and self.BodyOverlay.Remove then
        self.BodyOverlay:Remove()
    end
end
function PANEL:Show()
    if CloudMusic.Settings["Animation"] then
        self:SetAlpha(0)
        CloudMusic.Utils.LerpCall(function(value)
            self:SetAlpha(value)
        end, self:GetAlpha(), 255, CloudMusic.Settings["AnimationTime"])
    end
    self:SetMouseInputEnabled(true)
    self:SetKeyboardInputEnabled(true)
    self:Center()
    self:MakePopup()
end
function PANEL:Close()
    if CloudMusic.Settings["Animation"] then
        CloudMusic.Utils.LerpCall(function(value)
            self:SetAlpha(value)
        end, self:GetAlpha(), 0, CloudMusic.Settings["AnimationTime"], function()
            self:Remove()
        end)
    else
        self:Remove()
    end
end
function PANEL:AddPage(name)
    local panel = CloudMusic.UI.CreateVGUI("Panel")
    panel:Dock(FILL)
    panel.PageName = name
    panel:SetAlpha(0)
    panel:SetVisible(false)
    self.m_Body:Add(panel)
    if self.m_CurrentPage == nil and name == "Main" then self:SwitchPage(name) end
    return panel
end
function PANEL:SwitchPage(name)
    local page = nil
    for _,v in pairs(self.m_Body:GetChildren()) do
        if v.PageName == name then page = v end 
    end
    if page == nil then return end
    if self.m_CurrentPage then
        if CloudMusic.Settings["Animation"] then
            CloudMusic.Utils.LerpCall(function(value)
                self.m_CurrentPage:SetAlpha(value)
            end, self.m_CurrentPage:GetAlpha(), 0, CloudMusic.Settings["AnimationTime"], function()
                self.m_CurrentPage:SetVisible(false)
                self.m_CurrentPage = page
                self.m_CurrentPage:SetVisible(true)
                CloudMusic.Utils.LerpCall(function(value)
                    page:SetAlpha(value)
                end, 0, 255, CloudMusic.Settings["AnimationTime"])
            end)
        else
            self.m_CurrentPage:SetAlpha(0)
            self.m_CurrentPage = page
            page:SetAlpha(255)
        end
    else
        page:SetVisible(true)
        page:SetAlpha(255)
        self.m_CurrentPage = page
    end
end
function PANEL:ShowMessage(title,text,type,time)
    local msg = CloudMusic.UI.CreateVGUI("CloudMusicMessage", self.m_Messages)
    msg:SetVisible(false)
    msg:SizeToContents()
    msg:SetSize(self.m_Messages:GetWide(),msg:GetTall())
    msg:SetTitle(title or "")
    msg:SetText(text)
    type = type or CM_MSG_INFO
    time = time or 3
    if type == CM_MSG_INFO then
        msg:SetIcon("info")
        msg:SetBackgroundColor(Color(102,204,255))
    elseif type == CM_MSG_SUCCESS then
        msg:SetIcon("success")
        msg:SetBackgroundColor(Color(0,185,0))
    elseif type == CM_MSG_ERR then
        msg:SetIcon("error")
        msg:SetBackgroundColor(Color(238,0,0))
    end
    if time < 1 then time = 1 end
    timer.Simple(time, function()
        if not IsValid(msg) then return end
        if CloudMusic.Settings["Animation"] then
            msg.IgnoreLayout = true
            CloudMusic.Utils.LerpCall(function(value)
                msg:SetAlpha((1-value)*255)
                msg:SetPos(0,GetMsgObjTop(self.m_Messages,msg) - 10 * value)
                self.m_Messages:InvalidateLayout(true)
            end, 0, 1, CloudMusic.Settings["AnimationTime"], function()
                msg:Remove()
            end)
        else
            msg:Remove()
        end
    end)
    self.m_Messages:Paint()
    if CloudMusic.Settings["Animation"] then
        msg.IgnoreLayout = true
        CloudMusic.Utils.LerpCall(function(value)
            msg:SetAlpha(value * 255)
            msg:SetPos((1-value) * self.m_Messages:GetWide(),GetMsgObjTop(self.m_Messages,msg))
            msg:SetVisible(true)
        end, 0, 1, CloudMusic.Settings["AnimationTime"], function()
            msg.IgnoreLayout = false
        end)
    else
        msg:SetVisible(false)
    end
end
vgui.Register("CloudMusicFrame", PANEL, "DPanel")