local PANEL = {}
function PANEL:Init()
    self:SetColor(CloudMusic.Settings["ButtonTextColor"])
end
function PANEL:Paint(w,h)
    if self.lastColor == nil or self.color == nil or self._color == nil then
        self.lastColor = CloudMusic.Settings["ButtonColor"]
        self.color = CloudMusic.Settings["ButtonColor"]
        self._color = CloudMusic.Settings["ButtonColor"]
    end
    local newColor = self.color
    if input.IsMouseDown(MOUSE_LEFT) and self:IsHovered() and not self:GetDisabled() then
        newColor = CloudMusic.Settings["ButtonActivateColor"]
    elseif self:IsHovered() and not self:GetDisabled() then
        newColor = CloudMusic.Settings["ButtonHoverColor"]
    else
        newColor = CloudMusic.Settings["ButtonColor"]
    end
    if not CloudMusic.Utils.ColorEqual(self.color,newColor) then
        self.lastColor = self.color
        self.color = newColor
    end
    if not CloudMusic.Utils.ColorEqual(self.color,self._color) then
        if CloudMusic.Settings["Animation"] then
            local r,g,b = CloudMusic.Utils.UnpackColor(self._color)
            local rspd = (self.color.r - self.lastColor.r) / CloudMusic.Settings["AnimationTime"]
            local gspd = (self.color.g - self.lastColor.g) / CloudMusic.Settings["AnimationTime"]
            local bspd = (self.color.b - self.lastColor.b) / CloudMusic.Settings["AnimationTime"]
            self._color = Color(r + rspd * FrameTime(),g + gspd * FrameTime(),b + bspd * FrameTime())
            local r,g,b = CloudMusic.Utils.UnpackColor(self._color)
            local nr,ng,nb = CloudMusic.Utils.UnpackColor(self.color)
            if (rspd > 0 and r > nr) or (rspd < 0 and r < nr) then r = nr end
            if (gspd > 0 and g > ng) or (gspd < 0 and g < ng) then g = ng end
            if (bspd > 0 and b > nb) or (bspd < 0 and b < nb) then b = nb end
            self._color = Color(r,g,b)
        else
            self._color = self.color
        end
    end
    draw.RoundedBox(3, 0, 0, w, h, self._color)
end
vgui.Register("CloudMusicButton", PANEL, "DButton")