local PANEL = {}
function PANEL:Init()
    self:SetSize(ScrW()*0.8, ScrH()*0.6)
    
    self.m_Close = CreateVGUI("DButton", self)
    self.m_Close:SetColor(Color(255,255,255))
    self.m_Close:SetText("X")
    self.m_Close:SetSize(26,26)
    self.m_Close:SetPos(self:GetWide()-31,30/2-26/2)
    self.m_Close.BGAlpha = 0
    function self.m_Close:DoClick()self:GetParent():Close()end
    function self.m_Close:Paint(w,h)
        --[[if self:IsHovered() ~= self.LastHovered then
            LerpCall(function(value)
                self.BGAlpha = value
            end, self:IsHovered() and 0 or 255, self:IsHovered() and 255 or 0, Settings["AnimationTime"])
            self.LastHovered = self:IsHovered()
        end]] -- Something wrong with fade out
        if self:IsHovered() then
            surface.SetDrawColor(Color(238,0,0))
            draw.NoTexture()
            DrawCircle(w/2,h/2,w/2,math.sin(CurTime()) + 25)
        end
    end

    self.m_Body = CreateVGUI("Panel", self)
    self.m_Body:Dock(FILL)
    self.m_Body:DockMargin(5, 35, 5, 5)

    self.m_CurrentPage = nil
end
function PANEL:Paint(w,h)
    draw.RoundedBoxEx(6, 0, 0, w, 30, Settings["CloudMusicTitleBarColor"], true, true)
    draw.RoundedBoxEx(6, 0, 30, w, h-30, Settings["CloudMusicBackgroundColor"], false, false, true, true)
    draw.DrawText(GetI18N("name"),"CloudMusicTitle",5,3)
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
    if Settings["Animation"] then
        self:SetAlpha(0)
        LerpCall(function(value)
            self:SetAlpha(value)
        end, self:GetAlpha(), 255, Settings["AnimationTime"])
    end
    self:SetMouseInputEnabled(true)
    self:SetKeyboardInputEnabled(true)
    self:Center()
    self:MakePopup()
end
function PANEL:Close()
    if Settings["Animation"] then
        LerpCall(function(value)
            self:SetAlpha(value)
        end, self:GetAlpha(), 0, Settings["AnimationTime"], function()
            self:Remove()
        end)
    else
        self:Remove()
    end
end
function PANEL:AddPage(name)
    local panel = CreateVGUI("Panel")
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
        print(v.PageName)
        if v.PageName == name then page = v end 
    end
    if page == nil then return end
    if self.m_CurrentPage then
        LerpCall(function(value)
            self.m_CurrentPage:SetAlpha(value)
        end, self.m_CurrentPage:GetAlpha(), 0, Settings["AnimationTime"], function()
            self.m_CurrentPage:SetVisible(false)
            self.m_CurrentPage = page
            self.m_CurrentPage:SetVisible(true)
            LerpCall(function(value)
                page:SetAlpha(value)
            end, 0, 255, Settings["AnimationTime"])
        end)
    else
        page:SetVisible(true)
        page:SetAlpha(255)
        self.m_CurrentPage = page
    end
end
vgui.Register("CloudMusicFrame", PANEL, "DPanel")