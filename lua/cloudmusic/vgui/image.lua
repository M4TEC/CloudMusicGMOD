local PANEL = {}
AccessorFunc(PANEL,"m_AutoSizing","AutoSizing",FORCE_BOOL)
AccessorFunc(PANEL,"m_ResponseLayout","ResponseLayout",FORCE_BOOL)
function PANEL:Init()
    self.m_HTML = vgui.Create("DHTML", self)
    self.m_HTML:Dock(FILL)

    local minst = self

    function self.m_HTML:OnDocumentReady()
        self:AddFunction("img", "realSize", function(width,height)
            minst.m_RealWide = width
            minst.m_RealTall = height
            if minst:GetAutoSizing() then
                minst:SizeToContents()
            end
        end)
    end

    self:SetAutoSizing(false)
    self:SetResponseLayout(true)
end
function PANEL:Paint()end
function PANEL:SetImage(url,width,height)
    width = width or self:GetWide()
    height = height or self:GetTall()
    self.m_Image = url
    self.m_ImageWide = width
    self.m_ImageHeight = height

    self.m_HTML:SetHTML([[
        <img src="]]..url..[[" style="position:fixed;top:0;left:0;width:]]..width..[[px;height:]]..height..[[px;" onload="window.rptitv = setInterval(function() {if (window.img != undefined && img.realSize != undefined) {img.realSize(this.naturalWidth,this.naturalHeight);clearInterval(rptitv);}},10);"/>
    ]])
end
function PANEL:SizeToContents()
    self:SetSize(math.min(self:GetRealWide(),self:GetMaxWide()),math.min(self:GetRealTall(),self:GetMaxTall()))
end
function PANEL:GetRealWide()
    return self.m_RealWide or self:GetWide()
end
function PANEL:GetRealTall()
    return self.m_RealTall or self:GetTall()
end
function PANEL:SetMaxTall(tall)
    self.m_MaxTall = tall or nil
end
function PANEL:GetMaxTall()
    return self.m_MaxTall or self:GetTall()
end
function PANEL:SetMaxWide(wide)
    self.m_MaxWide = wide or nil
end
function PANEL:GetMaxWide()
    return self.m_MaxWide or self:GetWide()
end
function PANEL:PerformLayout(width,height)
    if self.m_Image and self.m_ResponseLayout then
        if self.m_ImageWide ~= width or self.m_ImageHeight ~= height then
            self:SetImage(self.m_Image,width,height)
        end
    end
end
vgui.Register("CloudMusicImage", PANEL, "DPanel")