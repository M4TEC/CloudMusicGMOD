local PANEL = {}
function PANEL:Init()
    self:DockPadding(5, 5, 5, 5)

    self.m_Icon = CloudMusic.UI.CreateVGUI("CloudMusicImage", self)
    self.m_Icon:SetVisible(false)
    self.m_Icon:Dock(LEFT)
    self.m_Icon:DockMargin(0, 0, 5, 0)
    self.m_Icon:SetResponseLayout(false)
    
    self.m_Body = CloudMusic.UI.CreateVGUI("Panel", self)
    self.m_Body:Dock(FILL)
    function self.m_Body.SizeToContents()
        local bytxt = 10
        bytxt = bytxt + self.m_Title:GetTall()
        bytxt = bytxt + self.m_Text:GetTall()
        print(bytxt)
        self.m_Body:SetSize(0,bytxt)
    end

    self.m_Title = CloudMusic.UI.CreateVGUI("DLabel", self.m_Body)
    self.m_Title:SetColor(Color(255,255,255))
    self.m_Title:SetFont("CloudMusicSmallTitle")
    self.m_Title:Dock(TOP)

    self.m_Text = CloudMusic.UI.CreateVGUI("DLabel", self.m_Body)
    self.m_Text:SetColor(Color(255,255,255))
    self.m_Text:SetFont("CloudMusicDermaFont")
    self.m_Text:Dock(BOTTOM)
    self.m_Text:SetWrap(true)
    self.m_Text:SetAutoStretchVertical(true)
    function self.m_Text:PerformLayout(w, h)
        self:GetParent():GetParent():SizeToContents()
    end

    self.m_Background = Color(102,204,255)
end
function PANEL:SetIcon(name)
    self.m_Icon:SetVisible(true)
    self.m_Icon:SetSize(32,32)
    self.m_Icon:SetImage(CloudMusic.Utils.GetAssetUrl("cloudmusic/"..name..".png"))
    self:SizeToContents()
end
function PANEL:SetTitle(text)
    self.m_Title:SetText(text)
    self.m_Title:SizeToContents()
    self:SizeToContents()
end
function PANEL:SetText(text)
    self.m_Text:SetText(text)
    self:SizeToContents()
end
function PANEL:SetBackgroundColor(col)
    self.m_Background = col
end
function PANEL:Paint(w,h)
    draw.RoundedBox(6, 0, 0, w, h, ColorAlpha(self.m_Background, self:GetAlpha()))
end
function PANEL:SizeToContents()
    local tall = 10
    if self.m_Icon:IsVisible() then
        tall = tall + 32
    end
    local bytxt = 10
    bytxt = bytxt + self.m_Title:GetTall()
    bytxt = bytxt + self.m_Text:GetTall()
    self:SetSize(self:GetWide(),math.max(tall,bytxt))
end
vgui.Register("CloudMusicMessage", PANEL, "Panel")