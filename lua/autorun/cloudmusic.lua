if CLIENT then
    local CLOUDMUSIC_SETTING_FILE_VER = "1.2.0"
    if file.Exists("materials/gwenskin/windows10.png", "GAME") then
        --Windows 10 UI Skin by Spar
        local surface=surface;local Color=Color;SKIN={}SKIN.PrintName="Windows 10"SKIN.Author="Spar"SKIN.DermaVersion=1;SKIN.GwenTexture=Material("gwenskin/windows10.png")SKIN.text_dark=Color(0,0,0,255)SKIN.colTextEntryText=Color(0,0,0,255)SKIN.colTextEntryTextHighlight=Color(0,120,215,255)SKIN.colTextEntryTextCursor=Color(0,0,0,255)SKIN.colTextEntryTextPlaceholder=Color(109,109,109,255)SKIN.tex={}SKIN.tex.Selection=GWEN.CreateTextureBorder(384,32,31,31,4,4,4,4)SKIN.tex.Panels={}SKIN.tex.Panels.Normal=GWEN.CreateTextureBorder(256,0,63,63,16,16,16,16)SKIN.tex.Panels.Bright=GWEN.CreateTextureBorder(256+64,0,63,63,16,16,16,16)SKIN.tex.Panels.Dark=GWEN.CreateTextureBorder(256,64,63,63,16,16,16,16)SKIN.tex.Panels.Highlight=GWEN.CreateTextureBorder(256+64,64,63,63,16,16,16,16)SKIN.tex.Button=GWEN.CreateTextureBorder(480,0,31,31,8,8,8,8)SKIN.tex.Button_Hovered=GWEN.CreateTextureBorder(480,32,31,31,8,8,8,8)SKIN.tex.Button_Dead=GWEN.CreateTextureBorder(480,64,31,31,8,8,8,8)SKIN.tex.Button_Down=GWEN.CreateTextureBorder(480,96,31,31,8,8,8,8)SKIN.tex.Shadow=GWEN.CreateTextureBorder(448,0,31,31,8,8,8,8)SKIN.tex.Tree=GWEN.CreateTextureBorder(256,128,127,127,16,16,16,16)SKIN.tex.Checkbox_Checked=GWEN.CreateTextureNormal(448,32,15,15)SKIN.tex.Checkbox=GWEN.CreateTextureNormal(464,32,15,15)SKIN.tex.CheckboxD_Checked=GWEN.CreateTextureNormal(448,48,15,15)SKIN.tex.CheckboxD=GWEN.CreateTextureNormal(464,48,15,15)SKIN.tex.RadioButton_Checked=GWEN.CreateTextureNormal(448,64,15,15)SKIN.tex.RadioButton=GWEN.CreateTextureNormal(464,64,15,15)SKIN.tex.RadioButtonD_Checked=GWEN.CreateTextureNormal(448,80,15,15)SKIN.tex.RadioButtonD=GWEN.CreateTextureNormal(464,80,15,15)SKIN.tex.TreePlus=GWEN.CreateTextureNormal(448,96,15,15)SKIN.tex.TreeMinus=GWEN.CreateTextureNormal(464,96,15,15)SKIN.tex.TextBox=GWEN.CreateTextureBorder(0,150,127,21,4,4,4,4)SKIN.tex.TextBox_Focus=GWEN.CreateTextureBorder(0,172,127,21,4,4,4,4)SKIN.tex.TextBox_Disabled=GWEN.CreateTextureBorder(0,194,127,21,4,4,4,4)SKIN.tex.MenuBG_Column=GWEN.CreateTextureBorder(128,128,127,63,24,8,8,8)SKIN.tex.MenuBG=GWEN.CreateTextureBorder(128,192,127,63,8,8,8,8)SKIN.tex.MenuBG_Hover=GWEN.CreateTextureBorder(128,256,127,31,8,8,8,8)SKIN.tex.MenuBG_Spacer=GWEN.CreateTextureNormal(128,288,127,3)SKIN.tex.Menu_Strip=GWEN.CreateTextureBorder(0,128,127,21,8,8,8,8)SKIN.tex.Menu_Check=GWEN.CreateTextureNormal(448,112,15,15)SKIN.tex.Tab_Control=GWEN.CreateTextureBorder(0,256,127,127,8,8,8,8)SKIN.tex.TabB_Active=GWEN.CreateTextureBorder(0,416,63,31,8,8,8,8)SKIN.tex.TabB_Inactive=GWEN.CreateTextureBorder(128,416,63,31,8,8,8,8)SKIN.tex.TabT_Active=GWEN.CreateTextureBorder(0,384,63,31,8,8,8,8)SKIN.tex.TabT_Inactive=GWEN.CreateTextureBorder(128,384,63,31,8,8,8,8)SKIN.tex.TabL_Active=GWEN.CreateTextureBorder(64,384,31,63,8,8,8,8)SKIN.tex.TabL_Inactive=GWEN.CreateTextureBorder(64+128,384,31,63,8,8,8,8)SKIN.tex.TabR_Active=GWEN.CreateTextureBorder(96,384,31,63,8,8,8,8)SKIN.tex.TabR_Inactive=GWEN.CreateTextureBorder(96+128,384,31,63,8,8,8,8)SKIN.tex.Tab_Bar=GWEN.CreateTextureBorder(128,352,127,31,4,4,4,4)SKIN.tex.Window={}SKIN.tex.Window.Normal=GWEN.CreateTextureBorder(0,0,127,127,8,24,8,8)SKIN.tex.Window.Inactive=GWEN.CreateTextureBorder(128,0,127,127,8,24,8,8)SKIN.tex.Window.Close=GWEN.CreateTextureNormal(32,448,31,24)SKIN.tex.Window.Close_Hover=GWEN.CreateTextureNormal(64,448,31,24)SKIN.tex.Window.Close_Down=GWEN.CreateTextureNormal(96,448,31,24)SKIN.tex.Window.Maxi=GWEN.CreateTextureNormal(32+96*2,448,31,24)SKIN.tex.Window.Maxi_Hover=GWEN.CreateTextureNormal(64+96*2,448,31,24)SKIN.tex.Window.Maxi_Down=GWEN.CreateTextureNormal(96+96*2,448,31,24)SKIN.tex.Window.Restore=GWEN.CreateTextureNormal(32+96*2,448+32,31,24)SKIN.tex.Window.Restore_Hover=GWEN.CreateTextureNormal(64+96*2,448+32,31,24)SKIN.tex.Window.Restore_Down=GWEN.CreateTextureNormal(96+96*2,448+32,31,24)SKIN.tex.Window.Mini=GWEN.CreateTextureNormal(32+96,448,31,24)SKIN.tex.Window.Mini_Hover=GWEN.CreateTextureNormal(64+96,448,31,24)SKIN.tex.Window.Mini_Down=GWEN.CreateTextureNormal(96+96,448,31,24)SKIN.tex.Scroller={}SKIN.tex.Scroller.TrackV=GWEN.CreateTextureBorder(384,208,15,127,4,4,4,4)SKIN.tex.Scroller.ButtonV_Normal=GWEN.CreateTextureBorder(384+16,208,15,127,4,4,4,4)SKIN.tex.Scroller.ButtonV_Hover=GWEN.CreateTextureBorder(384+32,208,15,127,4,4,4,4)SKIN.tex.Scroller.ButtonV_Down=GWEN.CreateTextureBorder(384+48,208,15,127,4,4,4,4)SKIN.tex.Scroller.ButtonV_Disabled=GWEN.CreateTextureBorder(384+64,208,15,127,4,4,4,4)SKIN.tex.Scroller.TrackH=GWEN.CreateTextureBorder(384,128,127,15,4,4,4,4)SKIN.tex.Scroller.ButtonH_Normal=GWEN.CreateTextureBorder(384,128+16,127,15,4,4,4,4)SKIN.tex.Scroller.ButtonH_Hover=GWEN.CreateTextureBorder(384,128+32,127,15,4,4,4,4)SKIN.tex.Scroller.ButtonH_Down=GWEN.CreateTextureBorder(384,128+48,127,15,4,4,4,4)SKIN.tex.Scroller.ButtonH_Disabled=GWEN.CreateTextureBorder(384,128+64,127,15,4,4,4,4)SKIN.tex.Scroller.LeftButton_Normal=GWEN.CreateTextureBorder(464,208,15,15,2,2,2,2)SKIN.tex.Scroller.LeftButton_Hover=GWEN.CreateTextureBorder(480,208,15,15,2,2,2,2)SKIN.tex.Scroller.LeftButton_Down=GWEN.CreateTextureBorder(464,272,15,15,2,2,2,2)SKIN.tex.Scroller.LeftButton_Disabled=GWEN.CreateTextureBorder(480+48,272,15,15,2,2,2,2)SKIN.tex.Scroller.UpButton_Normal=GWEN.CreateTextureBorder(464,208+16,15,15,2,2,2,2)SKIN.tex.Scroller.UpButton_Hover=GWEN.CreateTextureBorder(480,208+16,15,15,2,2,2,2)SKIN.tex.Scroller.UpButton_Down=GWEN.CreateTextureBorder(464,272+16,15,15,2,2,2,2)SKIN.tex.Scroller.UpButton_Disabled=GWEN.CreateTextureBorder(480+48,272+16,15,15,2,2,2,2)SKIN.tex.Scroller.RightButton_Normal=GWEN.CreateTextureBorder(464,208+32,15,15,2,2,2,2)SKIN.tex.Scroller.RightButton_Hover=GWEN.CreateTextureBorder(480,208+32,15,15,2,2,2,2)SKIN.tex.Scroller.RightButton_Down=GWEN.CreateTextureBorder(464,272+32,15,15,2,2,2,2)SKIN.tex.Scroller.RightButton_Disabled=GWEN.CreateTextureBorder(480+48,272+32,15,15,2,2,2,2)SKIN.tex.Scroller.DownButton_Normal=GWEN.CreateTextureBorder(464,208+48,15,15,2,2,2,2)SKIN.tex.Scroller.DownButton_Hover=GWEN.CreateTextureBorder(480,208+48,15,15,2,2,2,2)SKIN.tex.Scroller.DownButton_Down=GWEN.CreateTextureBorder(464,272+48,15,15,2,2,2,2)SKIN.tex.Scroller.DownButton_Disabled=GWEN.CreateTextureBorder(480+48,272+48,15,15,2,2,2,2)SKIN.tex.Menu={}SKIN.tex.Menu.RightArrow=GWEN.CreateTextureNormal(464,112,15,15)SKIN.tex.Input={}SKIN.tex.Input.ComboBox={}SKIN.tex.Input.ComboBox.Normal=GWEN.CreateTextureBorder(384,336,127,31,8,8,32,8)SKIN.tex.Input.ComboBox.Hover=GWEN.CreateTextureBorder(384,336+32,127,31,8,8,32,8)SKIN.tex.Input.ComboBox.Down=GWEN.CreateTextureBorder(384,336+64,127,31,8,8,32,8)SKIN.tex.Input.ComboBox.Disabled=GWEN.CreateTextureBorder(384,336+96,127,31,8,8,32,8)SKIN.tex.Input.ComboBox.Button={}SKIN.tex.Input.ComboBox.Button.Normal=GWEN.CreateTextureNormal(496,272,15,15)SKIN.tex.Input.ComboBox.Button.Hover=GWEN.CreateTextureNormal(496,272+16,15,15)SKIN.tex.Input.ComboBox.Button.Down=GWEN.CreateTextureNormal(496,272+32,15,15)SKIN.tex.Input.ComboBox.Button.Disabled=GWEN.CreateTextureNormal(496,272+48,15,15)SKIN.tex.Input.UpDown={}SKIN.tex.Input.UpDown.Up={}SKIN.tex.Input.UpDown.Up.Normal=GWEN.CreateTextureCentered(384,112,7,7)SKIN.tex.Input.UpDown.Up.Hover=GWEN.CreateTextureCentered(384+8,112,7,7)SKIN.tex.Input.UpDown.Up.Down=GWEN.CreateTextureCentered(384+16,112,7,7)SKIN.tex.Input.UpDown.Up.Disabled=GWEN.CreateTextureCentered(384+24,112,7,7)SKIN.tex.Input.UpDown.Down={}SKIN.tex.Input.UpDown.Down.Normal=GWEN.CreateTextureCentered(384,120,7,7)SKIN.tex.Input.UpDown.Down.Hover=GWEN.CreateTextureCentered(384+8,120,7,7)SKIN.tex.Input.UpDown.Down.Down=GWEN.CreateTextureCentered(384+16,120,7,7)SKIN.tex.Input.UpDown.Down.Disabled=GWEN.CreateTextureCentered(384+24,120,7,7)SKIN.tex.Input.Slider={}SKIN.tex.Input.Slider.H={}SKIN.tex.Input.Slider.H.Normal=GWEN.CreateTextureNormal(416,32,15,15)SKIN.tex.Input.Slider.H.Hover=GWEN.CreateTextureNormal(416,32+16,15,15)SKIN.tex.Input.Slider.H.Down=GWEN.CreateTextureNormal(416,32+32,15,15)SKIN.tex.Input.Slider.H.Disabled=GWEN.CreateTextureNormal(416,32+48,15,15)SKIN.tex.Input.Slider.V={}SKIN.tex.Input.Slider.V.Normal=GWEN.CreateTextureNormal(416+16,32,15,15)SKIN.tex.Input.Slider.V.Hover=GWEN.CreateTextureNormal(416+16,32+16,15,15)SKIN.tex.Input.Slider.V.Down=GWEN.CreateTextureNormal(416+16,32+32,15,15)SKIN.tex.Input.Slider.V.Disabled=GWEN.CreateTextureNormal(416+16,32+48,15,15)SKIN.tex.Input.ListBox={}SKIN.tex.Input.ListBox.Background=GWEN.CreateTextureBorder(256,256,63,127,8,8,8,8)SKIN.tex.Input.ListBox.Hovered=GWEN.CreateTextureBorder(320,320,31,31,8,8,8,8)SKIN.tex.Input.ListBox.EvenLine=GWEN.CreateTextureBorder(352,256,31,31,8,8,8,8)SKIN.tex.Input.ListBox.OddLine=GWEN.CreateTextureBorder(352,288,31,31,8,8,8,8)SKIN.tex.Input.ListBox.EvenLineSelected=GWEN.CreateTextureBorder(320,256,31,31,8,8,8,8)SKIN.tex.Input.ListBox.OddLineSelected=GWEN.CreateTextureBorder(320,288,31,31,8,8,8,8)SKIN.tex.ProgressBar={}SKIN.tex.ProgressBar.Back=GWEN.CreateTextureBorder(384,0,31,31,8,8,8,8)SKIN.tex.ProgressBar.Front=GWEN.CreateTextureBorder(384+32,0,31,31,8,8,8,8)SKIN.tex.CategoryList={}SKIN.tex.CategoryList.Outer=GWEN.CreateTextureBorder(256,384,63,63,8,8,8,8)SKIN.tex.CategoryList.Inner=GWEN.CreateTextureBorder(320,384,63,63,8,21,8,8)SKIN.tex.CategoryList.Header=GWEN.CreateTextureBorder(320,352,63,31,8,8,8,8)SKIN.tex.Tooltip=GWEN.CreateTextureBorder(384,64,31,31,8,8,8,8)SKIN.Colours={}SKIN.Colours.Window={}SKIN.Colours.Window.TitleActive=GWEN.TextureColor(4+8*0,508)SKIN.Colours.Window.TitleInactive=GWEN.TextureColor(4+8*1,508)SKIN.Colours.Button={}SKIN.Colours.Button.Normal=GWEN.TextureColor(4+8*2,508)SKIN.Colours.Button.Hover=GWEN.TextureColor(4+8*3,508)SKIN.Colours.Button.Down=GWEN.TextureColor(4+8*2,500)SKIN.Colours.Button.Disabled=GWEN.TextureColor(4+8*3,500)SKIN.Colours.Tab={}SKIN.Colours.Tab.Active={}SKIN.Colours.Tab.Active.Normal=GWEN.TextureColor(4+8*4,508)SKIN.Colours.Tab.Active.Hover=GWEN.TextureColor(4+8*5,508)SKIN.Colours.Tab.Active.Down=GWEN.TextureColor(4+8*4,500)SKIN.Colours.Tab.Active.Disabled=GWEN.TextureColor(4+8*5,500)SKIN.Colours.Tab.Inactive={}SKIN.Colours.Tab.Inactive.Normal=GWEN.TextureColor(4+8*6,508)SKIN.Colours.Tab.Inactive.Hover=GWEN.TextureColor(4+8*7,508)SKIN.Colours.Tab.Inactive.Down=GWEN.TextureColor(4+8*6,500)SKIN.Colours.Tab.Inactive.Disabled=GWEN.TextureColor(4+8*7,500)SKIN.Colours.Label={}SKIN.Colours.Label.Default=GWEN.TextureColor(4+8*8,508)SKIN.Colours.Label.Bright=GWEN.TextureColor(4+8*9,508)SKIN.Colours.Label.Dark=GWEN.TextureColor(4+8*8,500)SKIN.Colours.Label.Highlight=GWEN.TextureColor(4+8*9,500)SKIN.Colours.Tree={}SKIN.Colours.Tree.Lines=GWEN.TextureColor(4+8*10,508)SKIN.Colours.Tree.Normal=GWEN.TextureColor(4+8*11,508)SKIN.Colours.Tree.Hover=GWEN.TextureColor(4+8*10,500)SKIN.Colours.Tree.Selected=GWEN.TextureColor(4+8*11,500)SKIN.Colours.Properties={}SKIN.Colours.Properties.Line_Normal=GWEN.TextureColor(4+8*12,508)SKIN.Colours.Properties.Line_Selected=GWEN.TextureColor(4+8*13,508)SKIN.Colours.Properties.Line_Hover=GWEN.TextureColor(4+8*12,500)SKIN.Colours.Properties.Title=GWEN.TextureColor(4+8*13,500)SKIN.Colours.Properties.Column_Normal=GWEN.TextureColor(4+8*14,508)SKIN.Colours.Properties.Column_Selected=GWEN.TextureColor(4+8*15,508)SKIN.Colours.Properties.Column_Hover=GWEN.TextureColor(4+8*14,500)SKIN.Colours.Properties.Border=GWEN.TextureColor(4+8*15,500)SKIN.Colours.Properties.Label_Normal=GWEN.TextureColor(4+8*16,508)SKIN.Colours.Properties.Label_Selected=GWEN.TextureColor(4+8*17,508)SKIN.Colours.Properties.Label_Hover=GWEN.TextureColor(4+8*16,500)SKIN.Colours.Category={}SKIN.Colours.Category.Header=GWEN.TextureColor(4+8*18,500)SKIN.Colours.Category.Header_Closed=GWEN.TextureColor(4+8*19,500)SKIN.Colours.Category.Line={}SKIN.Colours.Category.Line.Text=GWEN.TextureColor(4+8*20,508)SKIN.Colours.Category.Line.Text_Hover=GWEN.TextureColor(4+8*21,508)SKIN.Colours.Category.Line.Text_Selected=GWEN.TextureColor(4+8*20,500)SKIN.Colours.Category.Line.Button=GWEN.TextureColor(4+8*21,500)SKIN.Colours.Category.Line.Button_Hover=GWEN.TextureColor(4+8*22,508)SKIN.Colours.Category.Line.Button_Selected=GWEN.TextureColor(4+8*23,508)SKIN.Colours.Category.LineAlt={}SKIN.Colours.Category.LineAlt.Text=GWEN.TextureColor(4+8*22,500)SKIN.Colours.Category.LineAlt.Text_Hover=GWEN.TextureColor(4+8*23,500)SKIN.Colours.Category.LineAlt.Text_Selected=GWEN.TextureColor(4+8*24,508)SKIN.Colours.Category.LineAlt.Button=GWEN.TextureColor(4+8*25,508)SKIN.Colours.Category.LineAlt.Button_Hover=GWEN.TextureColor(4+8*24,500)SKIN.Colours.Category.LineAlt.Button_Selected=GWEN.TextureColor(4+8*25,500)SKIN.Colours.TooltipText=GWEN.TextureColor(4+8*26,500)function SKIN:PaintPanel(a,b,c)if not a.m_bBackground then return end;self.tex.Panels.Normal(0,0,b,c,a.m_bgColor)end;function SKIN:PaintShadow(a,b,c)SKIN.tex.Shadow(0,0,b,c)end;function SKIN:PaintFrame(a,b,c)if a.m_bPaintShadow then DisableClipping(true)self.tex.Shadow(-4,-4,b+10,c+10)DisableClipping(false)end;if a:HasHierarchicalFocus()then self.tex.Window.Normal(0,0,b,c)else self.tex.Window.Inactive(0,0,b,c)end end;function SKIN:PaintButton(a,b,c)if not a.m_bBackground then return end;if a.Depressed or a:IsSelected()or a:GetToggle()then return self.tex.Button_Down(0,0,b,c)end;if a:GetDisabled()then return self.tex.Button_Dead(0,0,b,c)end;if a.Hovered then return self.tex.Button_Hovered(0,0,b,c)end;self.tex.Button(0,0,b,c)end;function SKIN:PaintTree(a,b,c)if not a.m_bBackground then return end;self.tex.Tree(0,0,b,c,a.m_bgColor)end;function SKIN:PaintCheckBox(a,b,c)if a:GetChecked()then if a:GetDisabled()then self.tex.CheckboxD_Checked(0,0,b,c)else self.tex.Checkbox_Checked(0,0,b,c)end else if a:GetDisabled()then self.tex.CheckboxD(0,0,b,c)else self.tex.Checkbox(0,0,b,c)end end end;function SKIN:PaintExpandButton(a,b,c)if not a:GetExpanded()then self.tex.TreePlus(0,0,b,c)else self.tex.TreeMinus(0,0,b,c)end end;function SKIN:PaintTextEntry(a,b,c)if a.m_bBackground then if a:GetDisabled()then self.tex.TextBox_Disabled(0,0,b,c)elseif a:HasFocus()then self.tex.TextBox_Focus(0,0,b,c)else self.tex.TextBox(0,0,b,c)end end;if a.GetPlaceholderText and a.GetPlaceholderColor and a:GetPlaceholderText()and a:GetPlaceholderText():Trim()~=""and a:GetPlaceholderColor()and(not a:GetText()or a:GetText()=="")then local d=a:GetText()local e=a:GetPlaceholderText()if e:StartWith("#")then e=e:sub(2)end;e=language.GetPhrase(e)a:SetText(e)a:DrawTextEntryText(a:GetPlaceholderColor(),a:GetHighlightColor(),a:GetCursorColor())a:SetText(d)return end;a:DrawTextEntryText(a:GetTextColor(),a:GetHighlightColor(),a:GetCursorColor())end;function SKIN:PaintMenu(a,b,c)if a:GetDrawColumn()then self.tex.MenuBG_Column(0,0,b,c)else self.tex.MenuBG(0,0,b,c)end end;function SKIN:PaintMenuSpacer(a,b,c)surface.SetDrawColor(Color(0,0,0,100))surface.DrawRect(0,0,b,c)end;function SKIN:PaintMenuOption(a,b,c)if a.m_bBackground and(a.Hovered or a.Highlight)then self.tex.MenuBG_Hover(0,0,b,c)end;if a:GetChecked()then self.tex.Menu_Check(5,c/2-7,15,15)end end;function SKIN:PaintMenuRightArrow(a,b,c)self.tex.Menu.RightArrow(0,0,b,c)end;function SKIN:PaintPropertySheet(a,b,c)local f=a:GetActiveTab()local g=0;if f then g=f:GetTall()-8 end;self.tex.Tab_Control(0,g,b,c-g)end;function SKIN:PaintTab(a,b,c)if a:IsActive()then return self:PaintActiveTab(a,b,c)end;self.tex.TabT_Inactive(0,0,b,c)end;function SKIN:PaintActiveTab(a,b,c)self.tex.TabT_Active(0,0,b,c)end;function SKIN:PaintWindowCloseButton(a,b,c)if not a.m_bBackground then return end;if a:GetDisabled()then return self.tex.Window.Close(0,0,b,c,Color(255,255,255,50))end;if a.Depressed or a:IsSelected()then return self.tex.Window.Close_Down(0,0,b,c)end;if a.Hovered then return self.tex.Window.Close_Hover(0,0,b,c)end;self.tex.Window.Close(0,0,b,c)end;function SKIN:PaintWindowMinimizeButton(a,b,c)if not a.m_bBackground then return end;if a:GetDisabled()then return self.tex.Window.Mini(0,0,b,c,Color(255,255,255,50))end;if a.Depressed or a:IsSelected()then return self.tex.Window.Mini_Down(0,0,b,c)end;if a.Hovered then return self.tex.Window.Mini_Hover(0,0,b,c)end;self.tex.Window.Mini(0,0,b,c)end;function SKIN:PaintWindowMaximizeButton(a,b,c)if not a.m_bBackground then return end;if a:GetDisabled()then return self.tex.Window.Maxi(0,0,b,c,Color(255,255,255,50))end;if a.Depressed or a:IsSelected()then return self.tex.Window.Maxi_Down(0,0,b,c)end;if a.Hovered then return self.tex.Window.Maxi_Hover(0,0,b,c)end;self.tex.Window.Maxi(0,0,b,c)end;function SKIN:PaintVScrollBar(a,b,c)self.tex.Scroller.TrackV(0,0,b,c)end;function SKIN:PaintScrollBarGrip(a,b,c)if a:GetDisabled()then return self.tex.Scroller.ButtonV_Disabled(0,0,b,c)end;if a.Depressed then return self.tex.Scroller.ButtonV_Down(0,0,b,c)end;if a.Hovered then return self.tex.Scroller.ButtonV_Hover(0,0,b,c)end;return self.tex.Scroller.ButtonV_Normal(0,0,b,c)end;function SKIN:PaintButtonDown(a,b,c)if not a.m_bBackground then return end;if a.Depressed or a:IsSelected()then return self.tex.Scroller.DownButton_Down(0,0,b,c)end;if a:GetDisabled()then return self.tex.Scroller.DownButton_Dead(0,0,b,c)end;if a.Hovered then return self.tex.Scroller.DownButton_Hover(0,0,b,c)end;self.tex.Scroller.DownButton_Normal(0,0,b,c)end;function SKIN:PaintButtonUp(a,b,c)if not a.m_bBackground then return end;if a.Depressed or a:IsSelected()then return self.tex.Scroller.UpButton_Down(0,0,b,c)end;if a:GetDisabled()then return self.tex.Scroller.UpButton_Dead(0,0,b,c)end;if a.Hovered then return self.tex.Scroller.UpButton_Hover(0,0,b,c)end;self.tex.Scroller.UpButton_Normal(0,0,b,c)end;function SKIN:PaintButtonLeft(a,b,c)if not a.m_bBackground then return end;if a.Depressed or a:IsSelected()then return self.tex.Scroller.LeftButton_Down(0,0,b,c)end;if a:GetDisabled()then return self.tex.Scroller.LeftButton_Dead(0,0,b,c)end;if a.Hovered then return self.tex.Scroller.LeftButton_Hover(0,0,b,c)end;self.tex.Scroller.LeftButton_Normal(0,0,b,c)end;function SKIN:PaintButtonRight(a,b,c)if not a.m_bBackground then return end;if a.Depressed or a:IsSelected()then return self.tex.Scroller.RightButton_Down(0,0,b,c)end;if a:GetDisabled()then return self.tex.Scroller.RightButton_Dead(0,0,b,c)end;if a.Hovered then return self.tex.Scroller.RightButton_Hover(0,0,b,c)end;self.tex.Scroller.RightButton_Normal(0,0,b,c)end;function SKIN:PaintComboDownArrow(a,b,c)if a.ComboBox:GetDisabled()then return self.tex.Input.ComboBox.Button.Disabled(0,0,b,c)end;if a.ComboBox.Depressed or a.ComboBox:IsMenuOpen()then return self.tex.Input.ComboBox.Button.Down(0,0,b,c)end;if a.ComboBox.Hovered then return self.tex.Input.ComboBox.Button.Hover(0,0,b,c)end;self.tex.Input.ComboBox.Button.Normal(0,0,b,c)end;function SKIN:PaintComboBox(a,b,c)if a:GetDisabled()then return self.tex.Input.ComboBox.Disabled(0,0,b,c)end;if a.Depressed or a:IsMenuOpen()then return self.tex.Input.ComboBox.Down(0,0,b,c)end;if a.Hovered then return self.tex.Input.ComboBox.Hover(0,0,b,c)end;self.tex.Input.ComboBox.Normal(0,0,b,c)end;function SKIN:PaintListBox(a,b,c)self.tex.Input.ListBox.Background(0,0,b,c)end;function SKIN:PaintNumberUp(a,b,c)if a:GetDisabled()then return self.tex.Input.UpDown.Up.Disabled(0,0,b,c)end;if a.Depressed then return self.tex.Input.UpDown.Up.Down(0,0,b,c)end;if a.Hovered then return self.tex.Input.UpDown.Up.Hover(0,0,b,c)end;self.tex.Input.UpDown.Up.Normal(0,0,b,c)end;function SKIN:PaintNumberDown(a,b,c)if a:GetDisabled()then return self.tex.Input.UpDown.Down.Disabled(0,0,b,c)end;if a.Depressed then return self.tex.Input.UpDown.Down.Down(0,0,b,c)end;if a.Hovered then return self.tex.Input.UpDown.Down.Hover(0,0,b,c)end;self.tex.Input.UpDown.Down.Normal(0,0,b,c)end;function SKIN:PaintTreeNode(a,b,c)if not a.m_bDrawLines then return end;surface.SetDrawColor(self.Colours.Tree.Lines)if a.m_bLastChild then surface.DrawRect(9,0,1,7)surface.DrawRect(9,7,9,1)else surface.DrawRect(9,0,1,c)surface.DrawRect(9,7,9,1)end end;function SKIN:PaintTreeNodeButton(a,b,c)if not a.m_bSelected then return end;local b,h=a:GetTextSize()self.tex.Selection(38,0,b+6,c)end;function SKIN:PaintSelection(a,b,c)self.tex.Selection(0,0,b,c)end;function SKIN:PaintSliderKnob(a,b,c)if a:GetDisabled()then return self.tex.Input.Slider.H.Disabled(0,0,b,c)end;if a.Depressed then return self.tex.Input.Slider.H.Down(0,0,b,c)end;if a.Hovered then return self.tex.Input.Slider.H.Hover(0,0,b,c)end;self.tex.Input.Slider.H.Normal(0,0,b,c)end;local function i(j,k,b,c,l)if not l then return end;local m=b/l;for n=0,l do surface.DrawRect(j+n*m,k+4,1,5)end end;function SKIN:PaintNumSlider(a,b,c)surface.SetDrawColor(Color(0,0,0,100))surface.DrawRect(8,c/2-1,b-15,1)i(8,c/2-1,b-16,1,a.m_iNotches)end;function SKIN:PaintProgress(a,b,c)self.tex.ProgressBar.Back(0,0,b,c)self.tex.ProgressBar.Front(0,0,b*a:GetFraction(),c)end;function SKIN:PaintCollapsibleCategory(a,b,c)if c<21 then return self.tex.CategoryList.Header(0,0,b,c)end;self.tex.CategoryList.Inner(0,0,b,63)end;function SKIN:PaintCategoryList(a,b,c)self.tex.CategoryList.Outer(0,0,b,c)end;function SKIN:PaintCategoryButton(a,b,c)if a.AltLine then if a.Depressed or a.m_bSelected then surface.SetDrawColor(self.Colours.Category.LineAlt.Button_Selected)elseif a.Hovered then surface.SetDrawColor(self.Colours.Category.LineAlt.Button_Hover)else surface.SetDrawColor(self.Colours.Category.LineAlt.Button)end else if a.Depressed or a.m_bSelected then surface.SetDrawColor(self.Colours.Category.Line.Button_Selected)elseif a.Hovered then surface.SetDrawColor(self.Colours.Category.Line.Button_Hover)else surface.SetDrawColor(self.Colours.Category.Line.Button)end end;surface.DrawRect(0,0,b,c)end;function SKIN:PaintListViewLine(a,b,c)if a:IsSelected()then self.tex.Input.ListBox.EvenLineSelected(0,0,b,c)elseif a.Hovered then self.tex.Input.ListBox.Hovered(0,0,b,c)elseif a.m_bAlt then self.tex.Input.ListBox.EvenLine(0,0,b,c)end end;function SKIN:PaintListView(a,b,c)if not a.m_bBackground then return end;self.tex.Input.ListBox.Background(0,0,b,c)end;function SKIN:PaintTooltip(a,b,c)self.tex.Tooltip(0,0,b,c)end;function SKIN:PaintMenuBar(a,b,c)self.tex.Menu_Strip(0,0,b,c)end;derma.DefineSkin("CloudMusicDermaSkin","Windows 10 UI used by CloudMusic",SKIN)
    end
    print("===========================\n")
    print("    Cloud Music for LUA    \n")
    print("         By  Texas         \n")
    print("===========================")
    local function Init()
        if CloudMusic and CloudMusic.Remove then
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
            if CloudMusic.HUD and CloudMusic.HUD.Remove then
                CloudMusic.HUD:Remove()
            end
            CloudMusic:Remove()
            CloudMusic = nil
        end
        if not file.Exists("cloudmusic", "DATA") or not file.IsDir("cloudmusic", "DATA") then
            file.CreateDir("cloudmusic")
        end
        local settingFilePath = "cloudmusic/settings."..CLOUDMUSIC_SETTING_FILE_VER..".dat"
        local function GetStringTableKeys(t)
            local keys = {}
            table.foreach(t,function(k,v)
                table.insert(keys,k)
            end)
            return keys
        end
        local settings = {
            ["CloudMusicPlayMode"] = "ListLoop",
            ["CloudMusicAnimation"] = true,
            ["CloudMusic3D"] = false,
            ["CloudMusicLyric"] = true,
            ["CloudMusicBypass3D"] = false,
            ["CloudMusicFFT"] = true,
            ["CloudMusicHUDFFT"] = false,
            ["CloudMusicVolume"] = 1,
            ["CloudMusicVolumeEnchance"] = false,
            ["CloudMusicHUDTextColor"] = Color(255,255,255),
            ["CloudMusicHUDProgressUnplayedColor"] = Color(255,255,255),
            ["CloudMusicHUDProgressPlayedColor"] = Color(102,204,255),
            ["CloudMusicHUDFFTColor"] = Color(255,255,255),
            ["CloudMusicTextColor"] = Color(0,0,0),
            ["CloudMusicButtonTextColor"] = Color(255,255,255),
            ["CloudMusicButtonColor"] = Color(102,204,255),
            ["CloudMusicButtonHoverColor"] = Color(0,153,230),
            ["CloudMusicPlayerFFTColor"] = Color(0,0,0),
            ["CloudMusicBarColor"] = Color(102,204,255),
            ["CloudMusicBackgroundColor"] = Color(255,255,255),
            ["CloudMusicTitleBarColor"] = Color(102,204,255),
            ["CloudMusicTitleBarTextColor"] = Color(255,255,255),
            ["CloudMusicHudPos"] = "top-left",
            ["CloudMusicHUDCustomCSS"] = "",
            ["CloudMusicBlacklistUsers"] = {},
            ["CloudMusicPlaylist"] = {},
            ["CloudMusicUserToken"] = ""
        }
        local function SaveSettings(set)
            local temp = table.Copy(settings)
            temp["version"] = CLOUDMUSIC_SETTING_FILE_VER
            file.Write(settingFilePath, util.TableToJSON(temp))
        end
        local defaultSettings = table.Copy(settings)
        local defaultKeys = GetStringTableKeys(defaultSettings)
        if not file.Exists(settingFilePath, "DATA") then
            SaveSettings()
        else
            local json = util.JSONToTable(file.Read(settingFilePath))
            if not json then
                SaveSettings()
            else
                if json["version"] ~= CLOUDMUSIC_SETTING_FILE_VER then
                    SaveSettings()
                    json = settings
                end
                local jsonKeys = GetStringTableKeys(json)
                for i=1,#jsonKeys do
                    if jsonKeys[i] == "version" then
                        table.remove(json, i)
                    end
                    if not table.HasValue(defaultKeys, jsonKeys[i]) then
                        table.remove(json, i)
                    end
                end
                for i=1,#defaultKeys do
                    if not table.HasValue(jsonKeys, defaultKeys[i]) then
                        json[defaultKeys[i]] = settings[defaultKeys[i]]
                    end
                end
                settings = json
                SaveSettings()
            end
        end
        local function GetSettings(name)
            return settings[name]
        end
        local function SetSettings(name,value)
            settings[name] = value
            SaveSettings()
            return value
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
        local isDragging = false
        local isProgDragging = false
        local isVolDragging = false
        local lrc = nil
        local transLrc = nil
        local currentShowingPage = "Main"
        local currentMode = GetSettings("CloudMusicPlayMode")
        local slideAnimPix = winw/10
        local msg = ""
        local lrcStartPos = 1
        local transLrcStartPos = 1
        local errorCount = 0
        local currentHudPos = GetSettings("CloudMusicHudPos")
        local buffering = false
        local userDetail = {}
        local function TextMessage(str)
            msg = str
            timer.Simple(10, function()msg = "" end)
        end
        local function FetchLyric()
            local currentPlaying = CloudMusic.CurrentPlaying
            lrc = nil
            transLrc = nil
            if not GetSettings("CloudMusicLyric") then return end
            lrcStartPos = 1
            transLrcStartPos = 1
            http.Fetch("http://api.texl.top/netease/lyric/?id="..CloudMusic.CurrentPlaying.ID, function(body)
                local json = util.JSONToTable(body)
                if not json then
                    notification.AddLegacy("无法获取 "..currentPlaying.Name.." 的歌词", NOTIFY_ERROR, 3)
                    return
                end
                if json["code"] ~= 200 then
                    notification.AddLegacy("无法获取 "..currentPlaying.Name.." 的歌词（"..json["msg"].."）", NOTIFY_ERROR, 3)
                    return
                end
                if not json["lyric"] then
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
                for i=1,#CloudMusic.Playlist.Songs do
                    local song = CloudMusic.Playlist.Songs[i]
                    if song.ID == CloudMusic.CurrentPlaying.ID then
                        if i == #CloudMusic.Playlist.Songs then
                            last = true
                        end
                        break
                    end
                end
                if not last then
                    CloudMusic:Next()
                end
            elseif currentMode == "Random" then
                CloudMusic:Play(math.random(1, #CloudMusic.Playlist.Songs))
            elseif currentMode == "SingleLoop" then
                lrcStartPos = 1
                transLrcStartPos = 1
                CloudMusic.CurrentChannel:Play()
            end
        end
        local function SongPlayError()
            notification.AddLegacy("无法播放 "..CloudMusic.CurrentPlaying.Name, NOTIFY_ERROR, 3)
            if errorCount == 5 then
                notification.AddLegacy("由于已经连续5次无法播放，将停止尝试", NOTIFY_GENERIC, 3)
                errorCount = 0
                return
            end
            errorCount = errorCount + 1
            if currentMode == "ListLoop" then
                CloudMusic:Next()
            elseif currentMode == "List" then
                local last = false
                for i=1,#CloudMusic.Playlist.Songs do
                    local song = CloudMusic.Playlist.Songs[i]
                    if song.ID == CloudMusic.CurrentPlaying.ID then
                        if i == #CloudMusic.Playlist.Songs then
                            last = true
                        end
                        break
                    end
                end
                if not last then
                    CloudMusic:Next()
                end
            elseif currentMode == "Random" then
                CloudMusic:Play(math.random(1, #CloudMusic.Playlist.Songs))
            elseif currentMode == "SingleLoop" then
                notification.AddLegacy("由于 "..CloudMusic.CurrentPlaying.Name.." 无法播放，已切到下一首", NOTIFY_GENERIC, 3)
                CloudMusic:Next()
            end
        end
        local function SendSyncData()
            if not GetSettings("CloudMusic3D") then return end
            net.Start("CloudMusic3DSync")
            net.WriteEntity(LocalPlayer())
            net.WriteBool(IsValid(CloudMusic.CurrentChannel))
            net.WriteInt(IsValid(CloudMusic.CurrentChannel) and CloudMusic.CurrentChannel:GetState() or -1,32)
            net.WriteFloat(CloudMusic.Volume)
            net.WriteString(CloudMusic.CurrentPlaying and CloudMusic.CurrentPlaying.ID or "")
            net.WriteFloat(IsValid(CloudMusic.CurrentChannel) and CloudMusic.CurrentChannel:GetTime() or 0)
            net.SendToServer()
        end
        local function TokenRequest(url,callback,fail,method,data)
            if method == nil then method = "GET" end
            local headers = GetSettings("CloudMusicUserToken") == "" and {} or {
                ["Cookie"] = "MUSIC_U="..GetSettings("CloudMusicUserToken")
            }
            if method == "GET" then
                http.Fetch(url,callback,fail,headers)
            elseif method == "POST" then
                http.Post(url,data,callback,fail,headers)
            else
                if type(fail) == "function" then
                    fail()
                end
            end
        end
        local function GetSongURL(id,callback,finally)
            TokenRequest("https://api.texl.top/node/song/url?id="..id,function(body)
                local result = util.JSONToTable(body)
                if result == nil then
                    if type(callback) == "function" then
                        callback("https://music.163.com/song/media/outer/url?id="..id..".mp3")
                    end
                    if type(finally) == "function" then
                        finally()
                    end
                    return
                end
                if type(callback) == "function" then
                    callback(result["data"][1]["url"])
                end
                if type(finally) == "function" then
                    finally()
                end
            end,function()
                if type(callback) == "function" then
                    callback("https://music.163.com/song/media/outer/url?id="..id..".mp3")
                end
                if type(finally) == "function" then
                    finally()
                end
            end)
        end
        local function Create3DChannel(id,ply)
            if not ply.ChannelCreating then
                ply.ChannelCreating = true
                GetSongURL(id,function(url)
                    sound.PlayURL(url,"noblock 3d",function(station)
                        if IsValid(station) then
                            ply.MusicChannel = station
                            ply.MusicChannelID = id
                            net.Start("CloudMusicReqSync")
                            net.SendToServer()
                        end
                    end)
                end,function()
                    ply.ChannelCreating = false
                end)
            end
        end
        local function DisableListHeader(list)
            for _,v in pairs(list.Columns) do
                v.DoClick = function() end
            end
        end
        local function SetUISkin(panel)
            panel:SetSkin("CloudMusicDermaSkin")
            for _,v in pairs(panel:GetChildren()) do
                SetUISkin(v)
            end
        end
        local function SetDMUISkin(panel)
            panel:SetSkin("CloudMusicDermaSkin")
            if panel.SetColor then
                panel:SetColor(Color(0,0,0))
            end
            for _,v in pairs(panel:GetChildren()) do
                SetDMUISkin(v)
            end
        end
        local function ShowOverlay()
            if IsValid(CloudMusic.Overlay) and CloudMusic.Overlay.Remove then
                CloudMusic.Overlay:Remove()
            end
            CloudMusic.Overlay = vgui.Create("DPanel",CloudMusic)
            CloudMusic.Overlay:SetBackgroundColor(Color(0,0,0))
            if GetSettings("CloudMusicAnimation") then
                CloudMusic.Overlay:SetAlpha(1)
            end
            function CloudMusic.Overlay:Think()
                if GetSettings("CloudMusicAnimation") then
                    if not self.IsHiding and self:GetAlpha() < 76.5 then
                        self:SetAlpha(self:GetAlpha()+76.5/10)
                    elseif self.IsHiding then
                        if self:GetAlpha() <= 0 then
                            self:Remove()
                        else
                            self:SetAlpha(self:GetAlpha()-76.5/10)
                        end
                    end
                end
            end
            CloudMusic.Overlay:SetPos(0,0)
            CloudMusic.Overlay:SetSize(winw,winh)
        end
        local function HideOverlay()
            CloudMusic.Overlay.IsHiding = true
        end
        local function InitUserInfo()
            CloudMusic.Login:SetVisible(false)
            CloudMusic.Logout:SetVisible(false)
            CloudMusic.UserInfo:SetVisible(false)
            CloudMusic.ShowRecommend:SetVisible(false)
            CloudMusic.ShowUserPlaylists:SetVisible(false)
            if GetSettings("CloudMusicUserToken") == "" then
                CloudMusic.Login:SetVisible(true)
            else
                TokenRequest("https://api.texl.top/node/login/status",function(body)
                    userDetail = util.JSONToTable(body)
                    if userDetail == nil or userDetail["code"] ~= 200 then
                        notification.AddLegacy("获取网易云用户信息失败", NOTIFY_ERROR, 3)
                        return
                    end
                    userDetail = userDetail["profile"]
                    CloudMusic.Logout:SetVisible(true)
                    CloudMusic.ShowRecommend:SetVisible(true)
                    CloudMusic.ShowUserPlaylists:SetVisible(true)
                    CloudMusic.UserInfo:SetVisible(true)
                    CloudMusic.UserInfo:SetHTML([[
                        <html>
                            <head>
                                <style>
                                    * {
                                        cursor:normal;
                                    }
                                    body {
                                        color:white;
                                        font-family:微软雅黑,黑体;
                                        margin:0;
                                        width:100px;
                                        height:30px;
                                        overflow:hidden;
                                        text-align:right;
                                    }
                                    .user-info {
                                        position:absolute;
                                        height:30px;
                                        top:0;
                                        left:0;
                                        right:30px;
                                        text-align:right;
                                        display:inline-block;
                                    }
                                    .user-info .welcome {
                                        position:absolute;
                                        right:0;
                                        top:-2px;
                                        font-size:10px;
                                    }
                                    .user-info .username {
                                        position:absolute;
                                        bottom:-2px;
                                        right:0;
                                    }
                                    img {
                                        position:absolute;
                                        top:0;
                                        right:0;
                                        width:30px;
                                        height:30px;
                                    }
                                </style>
                            </head>
                            <body>
                                <div class="user-info">
                                    <span class="welcome">欢迎，</span>
                                    <span class="username">]]..userDetail["nickname"]..[[</span>
                                </div>
                                <img src="]]..userDetail["avatarUrl"]..[["
                            </body>
                        </html>
                    ]])
                end,function()
                    notification.AddLegacy("获取网易云用户信息失败", NOTIFY_ERROR, 3)
                    CloudMusic.Login:SetVisible(true)
                end)
            end
        end
        function ToggleCloudMusic()
            if CloudMusic:IsVisible() then
                targetOpacity = 0
                if not GetSettings("CloudMusicAnimation") then
                    CloudMusic:SetAlpha(0)
                    CloudMusic:SetVisible(false)
                end
            else
                --Disabled because of some reason
                --[[if system.GetCountry() ~= "CN" and not CloudMusic.CountryWarnShown then
                    CloudMusic.CountryWarnShown = true
                    SetDMUISkin(Derma_Message("检测到你不是中文系统，你可能不在中国，可能会无法正常使用\nDetected you are not using Chinese system, you might not in China, so Cloud Music Player probably unable to use.", "Cloud Music", "OK"))
                end]]
                CloudMusic.Settings.BlacklistUser:Sync()
                CloudMusic.Playlist:Sync()
                CloudMusic:MakePopup()
                CloudMusic:SetVisible(true)
                targetOpacity = 255
                if GetSettings("CloudMusicAnimation") then
                    CloudMusic:SetAlpha(1)
                else
                    CloudMusic:SetAlpha(255)
                end
            end
        end
        CloudMusic = vgui.Create("DFrame")
        CloudMusic:ShowCloseButton(false)
        CloudMusic:SetTitle("")
        function CloudMusic:Paint(w,h)
            surface.SetDrawColor(GetSettings("CloudMusicBackgroundColor"))
            surface.DrawRect(0, 0, w, h)
            surface.SetDrawColor(GetSettings("CloudMusicTitleBarColor"))
            surface.DrawRect(0, 0, winw, 30)
            draw.DrawText("网易云音乐", "CloudMusicTitle", 5, 3, GetSettings("CloudMusicTitleBarTextColor"))
            if msg ~= "" then draw.DrawText(msg, "CloudMusicText", 110, 13, GetSettings("CloudMusicTitleBarTextColor")) end
        end
        local dragStartX = 0
        local dragStartY = 0
        function CloudMusic:Think()
            if not input.IsMouseDown(MOUSE_LEFT) and (isDragging or isProgDragging or isVolDragging) then
                if IsValid(CloudMusic.BodyOverlay) and CloudMusic.BodyOverlay.Remove then
                    CloudMusic.BodyOverlay:Remove()
                end
                isDragging = false
                isProgDragging = false
                isVolDragging = false
                SendSyncData()
            end
            if GetSettings("CloudMusicAnimation") then
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
            if isDragging then
                local cx,cy = gui.MouseX(),gui.MouseY()
                local nx,ny = cx-dragStartX,cy-dragStartY
                if nx < 0 then nx = 0 end
                if nx > ScrW()-winw then nx = ScrW()-winw end
                if ny < 0 then ny = 0 end
                if ny > ScrH()-winh then ny = ScrH()-winh end
                CloudMusic:SetPos(nx,ny)
            end
        end
        function CloudMusic:OnKeyCodePressed(key)
            if key == KEY_F9 then
                ToggleCloudMusic()
            end
        end
        function CloudMusic:OnMousePressed(key)
            local x,y = self:LocalCursorPos()
            if key == MOUSE_LEFT and y <= 30 then
                isDragging = true
                dragStartX = x
                dragStartY = y
                if IsValid(CloudMusic.BodyOverlay) and CloudMusic.BodyOverlay.Remove then
                    CloudMusic.BodyOverlay:Remove()
                end
                CloudMusic.BodyOverlay = vgui.Create("DPanel",CloudMusic)
                CloudMusic.BodyOverlay:SetPaintBackground(false)
                CloudMusic.BodyOverlay:Dock(FILL)
                CloudMusic.BodyOverlay:SetZPos(2)
            end
        end
        function CloudMusic:OnMouseReleased(key)
            isDragging = false
            if IsValid(CloudMusic.BodyOverlay) and CloudMusic.BodyOverlay.Remove then
                CloudMusic.BodyOverlay:Remove()
            end
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
                self:SetColor(Color(255,255,255))
            else
                self:SetColor(GetSettings("CloudMusicTitleBarTextColor"))
            end
        end
        CloudMusic.Login = vgui.Create("DButton",CloudMusic)
        CloudMusic.Login:SetSize(45,20)
        CloudMusic.Login:SetPos(winw-75,30/2-20/2)
        CloudMusic.Login:SetText("登录")
        function CloudMusic.Login:Paint(w,h)
            draw.RoundedBox(10, 0, 0, w, h, (self:IsHovered() and not self:GetDisabled()) and GetSettings("CloudMusicButtonHoverColor") or GetSettings("CloudMusicButtonColor"))
        end
        function CloudMusic.Login:DoClick()
            ShowOverlay()
            CloudMusic.LoginPrompt = vgui.Create("DPanel",CloudMusic)
            CloudMusic.LoginPrompt:SetZPos(2)
            CloudMusic.LoginPrompt:SetPos(winw/2-300/2,(winh-30)/2-400/2+30)
            CloudMusic.LoginPrompt:SetSize(300,400)
            function CloudMusic.LoginPrompt:Think()
                if self.Mode == "Email" then
                    self.Username:SetPos(10,75)
                    self.Username:SetSize(300-20,20)
                else
                    self.Username:SetPos(35,75)
                    self.Username:SetSize(300-45,20)
                end
            end
            CloudMusic.LoginPrompt.Title = vgui.Create("DLabel",CloudMusic.LoginPrompt)
            CloudMusic.LoginPrompt.Title:SetText("登录网易云帐号")
            CloudMusic.LoginPrompt.Title:SetFont("CloudMusicTitle")
            CloudMusic.LoginPrompt.Title:SetColor(Color(0,0,0))
            CloudMusic.LoginPrompt.Title:SetContentAlignment(5)
            CloudMusic.LoginPrompt.Title:SetPos(0,0)
            CloudMusic.LoginPrompt.Title:SetSize(300,50)
            CloudMusic.LoginPrompt.Mode = "Email"
            CloudMusic.LoginPrompt.ToggleMode = vgui.Create("DButton",CloudMusic.LoginPrompt)
            CloudMusic.LoginPrompt.ToggleMode:SetPos(10,50)
            CloudMusic.LoginPrompt.ToggleMode:SetSize(300-20,20)
            function CloudMusic.LoginPrompt.ToggleMode:Think()
                if CloudMusic.LoginPrompt.Mode == "Email" then
                    self:SetText("使用手机号登录")
                else
                    self:SetText("使用邮箱登录")
                end
            end
            function CloudMusic.LoginPrompt.ToggleMode:DoClick()
                if CloudMusic.LoginPrompt.Mode == "Email" then
                    CloudMusic.LoginPrompt.Mode = "Phone"
                else
                    CloudMusic.LoginPrompt.Mode = "Email"
                end
                CloudMusic.LoginPrompt.Username:SetValue("")
            end
            CloudMusic.LoginPrompt.PhoneAreaNum = vgui.Create("DTextEntry",CloudMusic.LoginPrompt)
            CloudMusic.LoginPrompt.PhoneAreaNum:SetPos(10,75)
            CloudMusic.LoginPrompt.PhoneAreaNum:SetSize(20,20)
            CloudMusic.LoginPrompt.PhoneAreaNum:SetValue(86)
            CloudMusic.LoginPrompt.PhoneAreaNum:SetNumeric(true)
            CloudMusic.LoginPrompt.Username = vgui.Create("DTextEntry",CloudMusic.LoginPrompt)
            CloudMusic.LoginPrompt.Username:SetPos(10,75)
            CloudMusic.LoginPrompt.Username:SetSize(300-20,20)
            function CloudMusic.LoginPrompt.Username:Think()
                if CloudMusic.LoginPrompt.Mode == "Email" then
                    self:SetPlaceholderText("电子邮件")
                else
                    self:SetPlaceholderText("手机号")
                end
            end
            CloudMusic.LoginPrompt.Password = vgui.Create("DTextEntry",CloudMusic.LoginPrompt)
            CloudMusic.LoginPrompt.Password:SetPos(10,100)
            CloudMusic.LoginPrompt.Password:SetSize(300-20,20)
            CloudMusic.LoginPrompt.Password:SetPlaceholderText("密码")
            CloudMusic.LoginPrompt.Login = vgui.Create("DButton",CloudMusic.LoginPrompt)
            CloudMusic.LoginPrompt.Login:SetPos(10,125)
            CloudMusic.LoginPrompt.Login:SetSize(300-20,20)
            CloudMusic.LoginPrompt.Login:SetText("登录")
            function CloudMusic.LoginPrompt.Login:DoClick()
                if CloudMusic.LoginPrompt.Mode == "Email" then
                    TokenRequest("https://api.texl.top/node/login?email="..CloudMusic.LoginPrompt.Username:GetValue():JavascriptSafe().."&password="..CloudMusic.LoginPrompt.Password:GetValue():JavascriptSafe(),function(body)
                        local result = util.JSONToTable(body)
                        if result["code"] ~= 200 then
                            SetDMUISkin(Derma_Message("登录失败\n"..result["msg"], "错误", "好的"))
                            return
                        end
                        SetSettings("CloudMusicUserToken",result["token"])
                        SetDMUISkin(Derma_Message("登录成功！欢迎回来，"..result["profile"]["nickname"], "欢迎", "好的"))
                        InitUserInfo()
                        HideOverlay()
                        CloudMusic.LoginPrompt:Remove()
                    end,function()
                        SetDMUISkin(Derma_Message("登录失败", "错误", "好的"))
                    end)
                else
                    TokenRequest("https://api.texl.top/node/login/cellphone?phone="..CloudMusic.LoginPrompt.Username:GetValue():JavascriptSafe().."&password="..CloudMusic.LoginPrompt.Password:GetValue():JavascriptSafe().."&countrycode="..CloudMusic.LoginPrompt.PhoneAreaNum:GetValue(),function(body)
                        local result = util.JSONToTable(body)
                        if result["code"] ~= 200 then
                            SetDMUISkin(Derma_Message("登录失败\n"..result["msg"], "错误", "好的"))
                            return
                        end
                        SetSettings("CloudMusicUserToken",result["token"])
                        SetDMUISkin(Derma_Message("登录成功！欢迎回来，"..result["profile"]["nickname"], "欢迎", "好的"))
                        InitUserInfo()
                        HideOverlay()
                        CloudMusic.LoginPrompt:Remove()
                    end,function()
                        SetDMUISkin(Derma_Message("登录失败", "错误", "好的"))
                    end)
                end
            end
            CloudMusic.LoginPrompt.Cancel = vgui.Create("DButton",CloudMusic.LoginPrompt)
            CloudMusic.LoginPrompt.Cancel:SetPos(10,400-30)
            CloudMusic.LoginPrompt.Cancel:SetSize(300-20,20)
            CloudMusic.LoginPrompt.Cancel:SetText("取消")
            function CloudMusic.LoginPrompt.Cancel:DoClick()
                CloudMusic.LoginPrompt:Remove()
                HideOverlay()
            end
        end
        CloudMusic.Logout = vgui.Create("DButton",CloudMusic)
        CloudMusic.Logout:SetSize(45,20)
        CloudMusic.Logout:SetPos(winw-75,30/2-20/2)
        CloudMusic.Logout:SetText("注销")
        function CloudMusic.Logout:Paint(w,h)
            draw.RoundedBox(10, 0, 0, w, h, (self:IsHovered() and not self:GetDisabled()) and GetSettings("CloudMusicButtonHoverColor") or GetSettings("CloudMusicButtonColor"))
        end
        function CloudMusic.Logout:DoClick()
            TokenRequest("https://api.texl.top/node/logout",function(body)
                SetSettings("CloudMusicUserToken","")
                InitUserInfo()
                SetDMUISkin(Derma_Message("注销成功","成功","好的"))
            end,function()
                SetDMUISkin(Derma_Message("注销失败","错误","好的"))
            end)
        end
        CloudMusic.UserInfo = vgui.Create("DHTML",CloudMusic)
        CloudMusic.UserInfo:SetPos(winw-80-winw*0.5,0)
        CloudMusic.UserInfo:SetSize(winw*0.5,30)
        CloudMusic.UserInfo:SetMouseInputEnabled(false)
        CloudMusic.Body = vgui.Create("DPanel",CloudMusic)
        CloudMusic.Body:SetPos(0,30)
        CloudMusic.Body:SetSize(winw,winh-30)
        function CloudMusic.Body:Paint(w,h)
            draw.DrawText("Made by Texas ", "CloudMusicText", winw, 0, Color(202,202,202), TEXT_ALIGN_RIGHT)
        end
        function CloudMusic.Body:Think()
            if currentShowingPage == "Settings" and (self:GetPos()) > -winw then
                if GetSettings("CloudMusicAnimation") then
                    self:SetPos((self:GetPos()-slideAnimPix),30)
                else
                    self:SetPos(-winw,30)
                end
            elseif currentShowingPage == "Main" and (self:GetPos()) ~= 0 then
                if GetSettings("CloudMusicAnimation") then
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
        CloudMusic.SettingsButton.DoClick = function()currentShowingPage = "Settings"CloudMusic.Settings.BlacklistUser:Sync()end
        function CloudMusic.SettingsButton:Paint(w,h)
            draw.RoundedBox(10, 0, 0, w, h, (self:IsHovered() and not self:GetDisabled()) and GetSettings("CloudMusicButtonHoverColor") or GetSettings("CloudMusicButtonColor"))
        end
        CloudMusic.SonglistForm = vgui.Create("DPanel",CloudMusic.Body)
        CloudMusic.SonglistForm:SetPos(5,5)
        CloudMusic.SonglistForm:SetSize(102,34)
        CloudMusic.SonglistForm:SetDrawBackground(false)
        function CloudMusic.SonglistForm:Paint(w,h)
            draw.DrawText("歌单ID","CloudMusicText",0,0,Color(0,0,0))
        end
        CloudMusic.SonglistForm.Input = vgui.Create("DTextEntry",CloudMusic.SonglistForm)
        CloudMusic.SonglistForm.Input:SetPos(0,14)
        CloudMusic.SonglistForm.Input:SetNumeric(true)
        CloudMusic.SonglistForm.Fetch = vgui.Create("DButton",CloudMusic.SonglistForm)
        CloudMusic.SonglistForm.Fetch:SetPos(67,14)
        CloudMusic.SonglistForm.Fetch:SetSize(30,20)
        CloudMusic.SonglistForm.Fetch:SetText("获取")
        CloudMusic.SonglistForm.Fetch:SetColor(Color(255,255,255))
        CloudMusic.SonglistForm.Fetch.DoClick = function()
            local success,songlist = xpcall(function()return CloudMusic.SonglistForm.Input:GetInt()end,function()end)
            if not success or not songlist then
                SetDMUISkin(Derma_Message("请输入正确的歌单ID", "错误", "好的"))
                return
            end
            http.Fetch("http://music.163.com/api/playlist/detail?id="..songlist, function(json)
                local obj = util.JSONToTable(json)
                if obj["code"] ~= 200 then
                    SetDMUISkin(Derma_Message("获取歌单失败", "错误", "好的"))
                    return
                end
                CloudMusic.PrevPage:SetVisible(false)
                CloudMusic.NextPage:SetVisible(false)
                CloudMusic.Songlist:Resolve(obj["result"]["tracks"])
            end, function()SetDMUISkin(Derma_Message("获取歌单失败", "错误", "好的")) end)
        end
        function CloudMusic.SonglistForm.Fetch:Paint(w,h)
            draw.RoundedBox(10, 0, 0, w, h, (self:IsHovered() and not self:GetDisabled()) and GetSettings("CloudMusicButtonHoverColor") or GetSettings("CloudMusicButtonColor"))
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
                if not json or json["code"] ~= 200 or json["result"]["songs"] == nil then
                    SetDMUISkin(Derma_Message("搜索失败", "错误", "好的"))
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
                CloudMusic.Songlist:Resolve(json["result"]["songs"])
            end, function()SetDMUISkin(Derma_Message("搜索失败", "错误", "好的")) end)
        end
        function CloudMusic.SearchForm.Search:Paint(w,h)
            draw.RoundedBox(10, 0, 0, w, h, (self:IsHovered() and not self:GetDisabled()) and GetSettings("CloudMusicButtonHoverColor") or GetSettings("CloudMusicButtonColor"))
        end
        CloudMusic.ShowRecommend = vgui.Create("DButton",CloudMusic.Body)
        CloudMusic.ShowRecommend:SetPos(250,19)
        CloudMusic.ShowRecommend:SetSize(60,20)
        CloudMusic.ShowRecommend:SetColor(Color(255,255,255))
        CloudMusic.ShowRecommend:SetText("每日推荐")
        function CloudMusic.ShowRecommend:Paint(w,h)
            draw.RoundedBox(10, 0, 0, w, h, (self:IsHovered() and not self:GetDisabled()) and GetSettings("CloudMusicButtonHoverColor") or GetSettings("CloudMusicButtonColor"))
        end
        function CloudMusic.ShowRecommend:DoClick()
            TokenRequest("https://api.texl.top/node/recommend/songs",function(body)
                local result = util.JSONToTable(body)
                if result["code"] ~= 200 then
                    notification.AddLegacy("无法获取每日推荐", NOTIFY_ERROR, 3)
                    return
                end
                CloudMusic.Songlist:Resolve(result["recommend"])
            end,function()
                notification.AddLegacy("无法获取每日推荐", NOTIFY_ERROR, 3)
            end)
        end
        CloudMusic.ShowUserPlaylists = vgui.Create("DButton",CloudMusic.Body)
        CloudMusic.ShowUserPlaylists:SetPos(315,19)
        CloudMusic.ShowUserPlaylists:SetSize(60,20)
        CloudMusic.ShowUserPlaylists:SetColor(Color(255,255,255))
        CloudMusic.ShowUserPlaylists:SetText("我的歌单")
        function CloudMusic.ShowUserPlaylists:Paint(w,h)
            draw.RoundedBox(10, 0, 0, w, h, (self:IsHovered() and not self:GetDisabled()) and GetSettings("CloudMusicButtonHoverColor") or GetSettings("CloudMusicButtonColor"))
        end
        function CloudMusic.ShowUserPlaylists:DoClick()
            TokenRequest("https://api.texl.top/node/user/playlist?uid="..userDetail["userId"],function(body)
                local result = util.JSONToTable(body)
                if result["code"] ~= 200 then
                    notification.AddLegacy("无法获取用户歌单", NOTIFY_ERROR, 3)
                    return
                end
                CloudMusic.Playlists:Resolve(result["playlist"])
                CloudMusic.Songlist:SetVisible(false)
                CloudMusic.Playlists:SetVisible(true)
            end,function()
                notification.AddLegacy("无法获取用户歌单", NOTIFY_ERROR, 3)
            end)
        end
        CloudMusic.PrevPage = vgui.Create("DButton",CloudMusic.Body)
        CloudMusic.PrevPage:SetPos(winw-405,19)
        CloudMusic.PrevPage:SetSize(45,20)
        CloudMusic.PrevPage:SetColor(Color(255,255,255))
        CloudMusic.PrevPage:SetText("上一页")
        CloudMusic.PrevPage:SetVisible(false)
        function CloudMusic.PrevPage:DoClick()
            if offset == 0 then self:SetDisabled(true) return end
            http.Post("http://music.163.com/api/search/pc", {
                ["s"] = searchWord,
                ["type"] = "1",
                ["limit"] = "100",
                ["offset"] = tostring(offset-100)
            },function(body)
                local json = util.JSONToTable(body)
                if not json or json["code"] ~= 200 or json["result"]["songs"] == nil then
                    SetDMUISkin(Derma_Message("换页失败", "错误", "好的"))
                    return
                end
                CloudMusic.NextPage:SetDisabled(false)
                offset = offset - 100
                if offset == 0 then CloudMusic.PrevPage:SetDisabled(true) end
                CloudMusic.Songlist:Resolve(json["result"]["songs"])
            end, function()SetDMUISkin(Derma_Message("换页失败", "错误", "好的")) end)
        end
        function CloudMusic.PrevPage:Paint(w,h)
            draw.RoundedBox(10, 0, 0, w, h, (self:IsHovered() and not self:GetDisabled()) and GetSettings("CloudMusicButtonHoverColor") or GetSettings("CloudMusicButtonColor"))
        end
        CloudMusic.NextPage = vgui.Create("DButton",CloudMusic.Body)
        CloudMusic.NextPage:SetPos(winw-355,19)
        CloudMusic.NextPage:SetSize(45,20)
        CloudMusic.NextPage:SetColor(Color(255,255,255))
        CloudMusic.NextPage:SetText("下一页")
        CloudMusic.NextPage:SetVisible(false)
        function CloudMusic.NextPage:DoClick()
            if offset+100 > songCount then self:SetDisabled(true) return end
            http.Post("http://music.163.com/api/search/pc", {
                ["s"] = searchWord,
                ["type"] = "1",
                ["limit"] = "100",
                ["offset"] = tostring(offset+100)
            },function(body)
                local json = util.JSONToTable(body)
                if not json or json["code"] ~= 200 or json["result"]["songs"] == nil then
                    SetDMUISkin(Derma_Message("换页失败", "错误", "好的"))
                    return
                end
                CloudMusic.PrevPage:SetDisabled(false)
                offset = offset + 100
                if offset+100 > songCount then CloudMusic.NextPage:SetDisabled(true) end
                CloudMusic.Songlist:Resolve(json["result"]["songs"])
            end, function()SetDMUISkin(Derma_Message("换页失败", "错误", "好的")) end)
        end
        function CloudMusic.NextPage:Paint(w,h)
            draw.RoundedBox(10, 0, 0, w, h, (self:IsHovered() and not self:GetDisabled()) and GetSettings("CloudMusicButtonHoverColor") or GetSettings("CloudMusicButtonColor"))
        end
        CloudMusic.Songlist = vgui.Create("DListView",CloudMusic.Body)
        CloudMusic.Songlist:AddColumn("歌曲名")
        CloudMusic.Songlist:AddColumn("歌手")
        CloudMusic.Songlist:AddColumn("专辑")
        CloudMusic.Songlist:AddColumn("歌曲ID"):SetMaxWidth(100)
        CloudMusic.Songlist:SetSortable(false)
        CloudMusic.Songlist:SetPos(5,44)
        CloudMusic.Songlist:SetSize(winw-315,winh-149)
        DisableListHeader(CloudMusic.Songlist)
        function CloudMusic.Songlist:DoDoubleClick(id, line)
            CloudMusic.Playlist:AddMusic(CloudMusic.Songs[id])
        end
        function CloudMusic.Songlist:OnRowRightClick(lineID, line)
            self:ShowMenu()
        end
        function CloudMusic.Songlist:Resolve(tracks)
            if tracks == nil then SetDMUISkin(Derma_Message("歌单为空", "空歌单", "好的")) end
            CloudMusic.Songs = {}
            if #self:GetLines() ~= 0 then
                for i=1,#self:GetLines() do
                    self:RemoveLine(i)
                end
            end
            for i=1,#tracks do
                local track = tracks[i]
                local artist = ""
                for j=1,#track["artists"] do
                    if j ~= 1 then
                        artist = artist .. ", "
                    end
                    artist = artist .. track["artists"][j]["name"]
                end
                self:AddLine(track["name"],artist,track["album"]["name"],track["id"])
                table.insert(CloudMusic.Songs,{
                    Name = track["name"],
                    Artist = artist,
                    Album = track["album"]["name"],
                    ID = track["id"],
                    Thumbnail = track["album"]["picUrl"]
                })
            end
        end
        function CloudMusic.Songlist:ShowMenu()
            local menu = DermaMenu("")
            menu:AddOption("播放",function()
                CloudMusic:Play(CloudMusic.Songs[self:GetSelectedLine()])
            end):SetIcon("icon16/transmit.png")
            menu:AddOption("添加到播放列表",function()
                CloudMusic.Playlist:AddMusic(CloudMusic.Songs[self:GetSelectedLine()])
            end):SetIcon("icon16/add.png")
            menu:AddOption("复制歌曲ID",function()
                SetClipboardText(CloudMusic.Songs[self:GetSelectedLine()].ID)
                SetDMUISkin(Derma_Message("已复制到剪贴板", "复制成功", "好的"))
            end):SetIcon("icon16/page_copy.png")
            menu:AddOption("复制歌曲URL",function()
                SetClipboardText("https://music.163.com/song/media/outer/url?id="..CloudMusic.Songs[self:GetSelectedLine()].ID)
                SetDMUISkin(Derma_Message("已复制到剪贴板", "复制成功", "好的"))
            end):SetIcon("icon16/page_white_copy.png")
            menu:AddSpacer()
            menu:AddOption("将选中歌曲添加到播放列表",function()
                local selectedCount = #self:GetSelected()
                for _=1,selectedCount do
                    CloudMusic.Playlist:AddMusic(CloudMusic.Songs[self:GetSelectedLine()+_-1])
                end
            end):SetIcon("icon16/application_add.png")
            menu:AddOption("将列表中歌曲全部添加到播放列表",function()
                for _,v in pairs(CloudMusic.Songs) do
                    CloudMusic.Playlist:AddMusic(v)
                end
            end):SetIcon("icon16/book_add.png")
            SetUISkin(menu)
            menu:Open()
        end
        CloudMusic.Playlists = vgui.Create("DListView",CloudMusic.Body)
        CloudMusic.Playlists:AddColumn("歌单名")
        CloudMusic.Playlists:AddColumn("作者")
        CloudMusic.Playlists:AddColumn("歌曲数")
        CloudMusic.Playlists:AddColumn("歌单ID"):SetMaxWidth(100)
        CloudMusic.Playlists:SetSortable(false)
        CloudMusic.Playlists:SetPos(5,44)
        CloudMusic.Playlists:SetSize(winw-315,winh-149)
        DisableListHeader(CloudMusic.Playlists)
        function CloudMusic.Playlists:DoDoubleClick(id, line)
            http.Fetch("http://music.163.com/api/playlist/detail?id="..line:GetColumnText(4), function(json)
                local obj = util.JSONToTable(json)
                if obj["code"] ~= 200 then
                    SetDMUISkin(Derma_Message("获取歌单失败", "错误", "好的"))
                    return
                end
                CloudMusic.PrevPage:SetVisible(false)
                CloudMusic.NextPage:SetVisible(false)
                CloudMusic.Songlist:Resolve(obj["result"]["tracks"])
                CloudMusic.Songlist:SetVisible(true)
                self:SetVisible(false)
            end, function()SetDMUISkin(Derma_Message("获取歌单失败", "错误", "好的")) end)
        end
        function CloudMusic.Playlists:OnRowRightClick(lineID, line)
            self:ShowMenu()
        end
        function CloudMusic.Playlists:Resolve(playlists)
            if #self:GetLines() ~= 0 then
                for i=1,#self:GetLines() do
                    self:RemoveLine(i)
                end
            end
            for _,v in ipairs(playlists) do
                self:AddLine(v["name"],v["creator"]["nickname"],v["trackCount"],v["id"])
            end
        end
        function CloudMusic.Playlists:ShowMenu()
            local menu = DermaMenu("")
            menu:AddOption("打开",function()
                http.Fetch("http://music.163.com/api/playlist/detail?id="..self:GetSelected()[1]:GetColumnText("4"), function(json)
                    local obj = util.JSONToTable(json)
                    if obj["code"] ~= 200 then
                        SetDMUISkin(Derma_Message("获取歌单失败", "错误", "好的"))
                        return
                    end
                    CloudMusic.PrevPage:SetVisible(false)
                    CloudMusic.NextPage:SetVisible(false)
                    CloudMusic.Songlist:Resolve(obj["result"]["tracks"])
                    CloudMusic.Songlist:SetVisible(true)
                    self:SetVisible(false)
                end, function()SetDMUISkin(Derma_Message("获取歌单失败", "错误", "好的")) end)
            end):SetIcon("icon16/transmit.png")
            menu:AddOption("将歌单内歌曲添加到播放列表",function()
                http.Fetch("http://music.163.com/api/playlist/detail?id="..songlist, function(json)
                    local obj = util.JSONToTable(json)
                    if obj["code"] ~= 200 then
                        SetDMUISkin(Derma_Message("获取歌单失败", "错误", "好的"))
                        return
                    end
                    CloudMusic.PrevPage:SetVisible(false)
                    CloudMusic.NextPage:SetVisible(false)
                    for _,v in ipairs(obj["result"]["tracks"]) do
                        local artist = ""
                        for j=1,#track["artists"] do
                            if j ~= 1 then
                                artist = artist .. ", "
                            end
                            artist = artist .. track["artists"][j]["name"]
                        end
                        CloudMusic.Playlist:AddMusic({
                            Name = track["name"],
                            Artist = artist,
                            Album = track["album"]["name"],
                            ID = track["id"],
                            Thumbnail = track["album"]["picUrl"]
                        })
                    end
                end, function()SetDMUISkin(Derma_Message("获取歌单失败", "错误", "好的")) end)
            end):SetIcon("icon16/book_add.png")
            menu:AddOption("复制歌单ID",function()
                SetClipboardText(self:GetSelected()[1]:GetColumnText(4))
                SetDMUISkin(Derma_Message("已复制到剪贴板", "复制成功", "好的"))
            end):SetIcon("icon16/page_copy.png")
            menu:Open()
        end
        CloudMusic.Playlist = vgui.Create("DListView",CloudMusic.Body)
        CloudMusic.Playlist:AddColumn("歌曲名")
        CloudMusic.Playlist:AddColumn("歌手")
        CloudMusic.Playlist:AddColumn("歌曲ID"):SetMaxWidth(100)
        CloudMusic.Playlist:SetSortable(false)
        CloudMusic.Playlist:SetPos(winw-305,44)
        CloudMusic.Playlist:SetSize(300,winh-149)
        DisableListHeader(CloudMusic.Playlist)
        function CloudMusic.Playlist:DoDoubleClick(id, line)
            CloudMusic:Play(id)
        end
        function CloudMusic.Playlist:OnRowRightClick(lineID, line)
            self:ShowMenu()
        end
        function CloudMusic.Playlist:ShowMenu()
            local menu = DermaMenu(self)
            menu:AddOption("播放",function()
                CloudMusic:Play(self:GetSelectedLine())
            end):SetIcon("icon16/transmit.png")
            menu:AddOption("复制歌曲ID",function()
                SetClipboardText(self.Songs[self:GetSelectedLine()].ID)
                SetDMUISkin(Derma_Message("已复制到剪贴板", "复制成功", "好的"))
            end):SetIcon("icon16/page_copy.png")
            menu:AddOption("复制歌曲URL",function()
                SetClipboardText("https://music.163.com/song/media/outer/url?id="..self.Songs[self:GetSelectedLine()].ID)
                SetDMUISkin(Derma_Message("已复制到剪贴板", "复制成功", "好的"))
            end):SetIcon("icon16/page_white_copy.png")
            menu:AddSpacer()
            menu:AddOption("删除选中歌曲",function()
                local selectedCount = #self:GetSelected()
                for _=1,selectedCount do
                    table.remove(self.Songs,self:GetSelectedLine())
                end
                self:Sync()
            end):SetIcon("icon16/page_delete.png")
            menu:AddSpacer()
            menu:AddOption("清空列表",function()
                self.Songs = {}
                self:Sync()
            end):SetIcon("icon16/delete.png")
            SetUISkin(menu)
            menu:Open()
        end
        function CloudMusic.Playlist:Save()
            SetSettings("CloudMusicPlaylist",self.Songs)
        end
        function CloudMusic.Playlist:Sync()
            self:Clear()
            for _,v in ipairs(self.Songs) do
                self:AddLine(v.Name,v.Artist,v.ID)
            end
            self:Save()
        end
        function CloudMusic.Playlist:AddMusic(music)
            for _,v in pairs(self:GetLines()) do
                if v:GetColumnText(3) == music.ID then
                    return
                end
            end
            table.insert(self.Songs, music)
            self:AddLine(music.Name,music.Artist,music.ID)
            self:Save()
            if not IsValid(CloudMusic.CurrentChannel) then
                CloudMusic:Play(#self.Songs)
            end
        end
        CloudMusic.Playlist.Songs = GetSettings("CloudMusicPlaylist")
        if CloudMusic.Playlist.Songs == nil then
            CloudMusic.Playlist.Songs = {}
        end
        CloudMusic.Playlist:Sync()
        function CloudMusic:Play(song)
            if buffering or song == nil then return end
            if type(song) == "number" then
                if #self.Playlist.Songs == 0 then
                    notification.AddLegacy("歌曲列表为空", NOTIFY_GENERIC, 3)
                    return
                end
                if self.Playlist.Songs[song] then
                    self.CurrentPlaying = self.Playlist.Songs[song]
                end
                if not self.CurrentPlaying then
                    self.CurrentPlaying = self.Playlist.Songs[1]
                end
            elseif type(song) == "table" then
                self.CurrentPlaying = song
            end
            self.Player.Thumbnail:SetHTML([[
                <body style="margin:0;">
                    <img src="]]..self.CurrentPlaying.Thumbnail..[[" style="width:100%;height:100%;"/>
                    <script>
                        window.onmousedown = function() {return false;}
                        window.onkeydown = function() {return false;}
                    </script>
                </body>
            ]])
            self.HUD:RunJavascript([[
                setThumbnail("]]..self.CurrentPlaying.Thumbnail..[[");
                setSongname("]]..self.CurrentPlaying.Name:JavascriptSafe()..[[");
                setArtist("]]..self.CurrentPlaying.Artist:JavascriptSafe()..[[");
            ]])
            if IsValid(self.CurrentChannel) then
                self.CurrentChannel:Stop()
                self.CurrentChannel = nil
            end
            local cId = self.CurrentPlaying.ID
            buffering = true
            GetSongURL(cId,function(url)
                sound.PlayURL(url, "noblock", function(station)
                    buffering = false
                    if IsValid(station) then
                        if self.CurrentPlaying.ID == cId and not IsValid(self.CurrentChannel) then
                            station:Play()
                            self.CurrentChannel = station
                            FetchLyric()
                        end
                    else
                        SongPlayError()
                    end
                    SendSyncData()
                end)
            end,function()
                buffering = false
            end)
        end
        function CloudMusic:Next()
            if #self.Playlist.Songs == 0 then return end
            if self.CurrentPlaying then
                local found = false
                for i=1,#self.Playlist.Songs do
                    local song = self.Playlist.Songs[i]
                    if song.ID == self.CurrentPlaying.ID then
                        if i == #self.Playlist.Songs then
                            self:Play(1)
                        else
                            self:Play(i+1)
                        end
                        found = true
                        break
                    end
                end
                if not found then
                    self:Play(1)
                end
            else
                self:Play()
            end
        end
        function CloudMusic:Prev()
            if #self.Playlist.Songs == 0 then return end
            if self.CurrentPlaying then
                local found = false
                for i=1,#self.Playlist.Songs do
                    local song = self.Playlist.Songs[i]
                    if song.ID == self.CurrentPlaying.ID then
                        if i == 1 then
                            self:Play(#self.Playlist.Songs)
                        else
                            self:Play(i-1)
                        end
                        found = true
                        break
                    end
                end
                if not found then
                    self:Play(1)
                end
            else
                self:Play()
            end
        end
        CloudMusic.Player = vgui.Create("DPanel", CloudMusic.Body)
        CloudMusic.Volume = tonumber(GetSettings("CloudMusicVolume")) or 1
        CloudMusic.Player:SetPos(5,49+(winh-149))
        CloudMusic.Player:SetSize(winw-10,winh-44-(winh-149)-40)
        CloudMusic.Player.Thumbnail = vgui.Create("DHTML",CloudMusic.Player)
        CloudMusic.Player.Thumbnail:SetSize(CloudMusic.Player:GetTall(),CloudMusic.Player:GetTall())
        function CloudMusic.Player:Paint(w,h)
            local left = winh-44-(winh-149)-35
            if not CloudMusic.CurrentPlaying then return end
            if IsValid(CloudMusic.CurrentChannel) and GetSettings("CloudMusicFFT") then
                local samples = {}
                local count = CloudMusic.CurrentChannel:FFT(samples,FFT_256)
                local width = ((w-(winh-44-(winh-149)+155)-130)-count*1+1)/count
                local l = winh-44-(winh-149)+155
                for i=1,count do
                    local sample = samples[i]*2
                    surface.SetDrawColor(GetSettings("CloudMusicPlayerFFTColor"))
                    surface.DrawRect(l, h-h*sample, width, h*sample)
                    l = l + width + 1
                end
            end
            draw.DrawText(CloudMusic.CurrentPlaying.Name,"CloudMusicTitle",left,0,Color(0,0,0))
            draw.DrawText(CloudMusic.CurrentPlaying.Artist,"CloudMusicText",left,24,Color(0,0,0))
            if IsValid(CloudMusic.CurrentChannel) then
                local total = string.FormattedTime(CloudMusic.CurrentChannel:GetLength(), "%02i:%02i")
                local current = string.FormattedTime(CloudMusic.CurrentChannel:GetTime(), "%02i:%02i")
                draw.DrawText(current.." / "..total,"CloudMusicText",self:GetWide(),self:GetTall()-40,Color(0,0,0),TEXT_ALIGN_RIGHT)
            end
            local maxwidth = winw-10-left
            draw.RoundedBox(2.5, left, 40, maxwidth, 5, Color(226,226,226))
            if IsValid(CloudMusic.CurrentChannel) then
                draw.RoundedBox(2.5, left, 40, CloudMusic.CurrentChannel:GetTime() / CloudMusic.CurrentChannel:GetLength() * maxwidth, 5, GetSettings("CloudMusicBarColor"))
            end
            draw.DrawText("音量", "CloudMusicText", self:GetWide()-133, self:GetTall()-14, Color(0,0,0))
            draw.RoundedBox(2.5, self:GetWide()-100, self:GetTall()-9.5, 100, 5, Color(226,226,226))
            draw.RoundedBox(2.5, self:GetWide()-100, self:GetTall()-9.5, CloudMusic.Volume*100, 5, GetSettings("CloudMusicBarColor"))
        end
        function CloudMusic.Player:OnMousePressed(key)
            if key == MOUSE_LEFT then
                local x,y = self:LocalCursorPos()
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
                local x,y = self:LocalCursorPos()
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
                local x,y = self:LocalCursorPos()
                local left = x - (self:GetWide()-100)
                local percent = left / 100
                if percent < 0 then
                    percent = 0
                elseif percent > 1 then
                    percent = 1
                end
                CloudMusic.Volume = percent
                SetSettings("CloudMusicVolume",percent)
            end
            if not CloudMusic.CurrentPlaying then
                self.Prev:SetVisible(false)
                self.PlayPause:SetVisible(false)
                self.Next:SetVisible(false)
                self.Mode:SetVisible(false)
                self.CopyLink:SetVisible(false)
                self.VolumeEnchance:SetVisible(false)
            else
                self.Prev:SetVisible(true)
                self.PlayPause:SetVisible(true)
                self.Next:SetVisible(true)
                self.Mode:SetVisible(true)
                self.CopyLink:SetVisible(true)
                if CloudMusic.Volume >= 1 then
                    self.VolumeEnchance:SetVisible(true)
                end
            end
        end
        CloudMusic.Player.Prev = vgui.Create("DButton",CloudMusic.Player)
        CloudMusic.Player.Prev:SetPos(winh-44-(winh-149)-35,48)
        CloudMusic.Player.Prev:SetSize(45,20)
        CloudMusic.Player.Prev:SetColor(Color(255,255,255))
        CloudMusic.Player.Prev:SetText("上一首")
        CloudMusic.Player.Prev.DoClick = CloudMusic.Prev
        function CloudMusic.Player.Prev:Paint(w,h)
            draw.RoundedBox(10, 0, 0, w, h, (self:IsHovered() and not self:GetDisabled()) and GetSettings("CloudMusicButtonHoverColor") or GetSettings("CloudMusicButtonColor"))
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
            draw.RoundedBox(10, 0, 0, w, h, (self:IsHovered() and not self:GetDisabled()) and GetSettings("CloudMusicButtonHoverColor") or GetSettings("CloudMusicButtonColor"))
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
            draw.RoundedBox(10, 0, 0, w, h, (self:IsHovered() and not self:GetDisabled()) and GetSettings("CloudMusicButtonHoverColor") or GetSettings("CloudMusicButtonColor"))
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
            SetSettings("CloudMusicPlayMode",currentMode)
        end
        function CloudMusic.Player.Mode:Paint(w,h)
            draw.RoundedBox(10, 0, 0, w, h, (self:IsHovered() and not self:GetDisabled()) and GetSettings("CloudMusicButtonHoverColor") or GetSettings("CloudMusicButtonColor"))
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
            SetDMUISkin(Derma_Message("已复制到剪贴板", "复制成功", "好的"))
        end
        function CloudMusic.Player.CopyLink:Paint(w,h)
            draw.RoundedBox(10, 0, 0, w, h, (self:IsHovered() and not self:GetDisabled()) and GetSettings("CloudMusicButtonHoverColor") or GetSettings("CloudMusicButtonColor"))
        end
        CloudMusic.Player.VolumeEnchance = vgui.Create("DButton",CloudMusic.Player)
        CloudMusic.Player.VolumeEnchance:SetPos(CloudMusic.Player:GetWide()-155,0)
        CloudMusic.Player.VolumeEnchance:SetSize(90,20)
        CloudMusic.Player.VolumeEnchance:SetColor(Color(255,255,255))
        CloudMusic.Player.VolumeEnchance:SetText("开启音量增强")
        CloudMusic.Player.VolumeEnchance.DoClick = function()
            if not GetSettings("CloudMusicVolumeEnchance") then
                SetSettings("CloudMusicVolumeEnchance",true)
            else
                CloudMusic.Volume = 1
                SetSettings("CloudMusicVolume",1)
                SetSettings("CloudMusicVolumeEnchance",false)
            end
        end
        function CloudMusic.Player.VolumeEnchance:Think()
            self:SetText(GetSettings("CloudMusicVolumeEnchance") and "关闭音量增强" or "开启音量增强")
            if CloudMusic.Volume >= 1 then
                if GetSettings("CloudMusicVolumeEnchance") and CloudMusic.Volume ~= 2 then
                    CloudMusic.Volume = 2
                    SetSettings("CloudMusicVolume",2)
                end
            else
                self:SetVisible(false)
            end
        end
        function CloudMusic.Player.VolumeEnchance:Paint(w,h)
            draw.RoundedBox(10, 0, 0, w, h, (self:IsHovered() and not self:GetDisabled()) and GetSettings("CloudMusicButtonHoverColor") or GetSettings("CloudMusicButtonColor"))
        end
        CloudMusic.HUD = vgui.Create("DHTML")
        CloudMusic.HUD:ParentToHUD()
        CloudMusic.HUD:SetHTML([[
                <html>
                    <head>
                        <style>
                            .hud { position: fixed; }
                            .hud.top-left { top: 5px; left: 5px; }
                            .hud.top-right { top: 5px; right: 5px; text-align: right; }
                            .hud.bottom-left { bottom: 5px; left: 5px; }
                            .hud.bottom-right { bottom: 5px; right: 5px; text-align: right; }
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
                            .hud.bottom-left .lyric, .hud.bottom-right .lyric { position: relative; height: 0; top: -85px; }
                            body { word-break:keep-all; white-space:nowrap; font-family:'Microsoft YaHei',黑体; color:white; transition:all .3s linear; -webkit-transition:all .3s linear; overflow:hidden; }
                            body.hide { opacity:0; -webkit-opacity:0; }
                        </style>
                        <style id="custom"></style>
                    </head>
                    <body class="hide">
                        <div class="hud">
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
                                this.style[property.toLowerCase()] = value;
                            }else{
                                return window.getComputedStyle(this).getPropertyValue(
                                        ('webkit'+property)||property);
                            }
                            function capitalize(word){
                                return word.charAt(0).toUpperCase() + word.slice(1);
                            }
                        }
                        var circleBar = document.getElementsByClassName('circle-bar')[0];
                        var color = circleBar.css('background-color');
                        var left_circle = circleBar.getElementsByClassName('circle-bar-left')[0];
                        var right_circle = circleBar.getElementsByClassName('circle-bar-right')[0];
                        var right_circle_ori = right_circle.css('background-color');
                        function setPercent(percent) {
                            if( percent <= 50 ) {
                                var rotate = 'rotate('+(percent*3.6)+'deg)';
                                right_circle.css3('transform',rotate);
                                right_circle.css('background-color',right_circle_ori);
                                left_circle.css3('transform','rotate(0deg)');
                            } else {
                                var rotate = 'rotate('+((percent-50)*3.6)+'deg)';
                                right_circle.css('background-color',color);
                                right_circle.css3('transform','rotate(0deg)');
                                left_circle.css3('transform',rotate);
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
                            if (first == "") {
                                document.getElementsByClassName("lyric")[0].children[0].innerHTML = "&nbsp;";
                            }
                            document.getElementsByClassName("lyric")[0].children[2].innerText = second;
                            if (second == "") {
                                document.getElementsByClassName("lyric")[0].children[2].innerHTML = "&nbsp;";
                            }
                        }
                        function setTextColor(r,g,b) {
                            document.body.style.cssText = "color:rgb("+r+","+g+","+b+");";
                        }
                        function setUnplayedColor(r,g,b) {
                            right_circle_ori = "rgb("+r+","+g+","+b+")";
                            document.getElementsByClassName("circle-bar-left")[0].style.cssText = "background-color:rgb("+r+","+g+","+b+")";
                            document.getElementsByClassName("circle-bar-right")[0].style.cssText = "background-color:rgb("+r+","+g+","+b+")";
                        }
                        function setPlayedColor(r,g,b) {
                            color = "rgb("+r+","+g+","+b+")";
                            document.getElementsByClassName("circle-bar")[0].style.cssText = "background-color:rgb("+r+","+g+","+b+")";
                        }
                        function setHudPos(pos) {
                            document.getElementsByClassName("hud")[0].className = "hud " + pos;
                        }
                        function setCustomCSS(css) {
                            document.getElementById("custom").innerHTML = css;
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
            local text = GetSettings("CloudMusicHUDTextColor")
            local progressUnplayed = GetSettings("CloudMusicHUDProgressUnplayedColor")
            local progressPlayed = GetSettings("CloudMusicHUDProgressPlayedColor")
            self:RunJavascript([[
                setTextColor(]]..text.r..[[,]]..text.g..[[,]]..text.b..[[);
                setUnplayedColor(]]..progressUnplayed.r..[[,]]..progressUnplayed.g..[[,]]..progressUnplayed.b..[[);
                setPlayedColor(]]..progressPlayed.r..[[,]]..progressPlayed.g..[[,]]..progressPlayed.b..[[)
                setHudPos("]]..currentHudPos..[[");
                setCustomCSS("]]..GetSettings("CloudMusicHUDCustomCSS")..[[");
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
                if CloudMusic.CurrentChannel:GetState() == GMOD_CHANNEL_PLAYING or CloudMusic.CurrentChannel:GetState() == GMOD_CHANNEL_STALLED or CloudMusic.Settings.HUDCustomCSS.Focused then
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
                if lrc and IsValid(CloudMusic.CurrentChannel) and CloudMusic.CurrentChannel:GetState() == GMOD_CHANNEL_PLAYING then
                    local mainLrc = ""
                    local subLrc = ""
                    for i=lrcStartPos,#lrc do
                        local line = lrc[i]
                        if not IsValid(CloudMusic.CurrentChannel) then break end
                        if i == #lrc or lrc[i+1].Time > CloudMusic.CurrentChannel:GetTime()*1000 then
                            if lrc[i].Time < CloudMusic.CurrentChannel:GetTime()*1000 then
                                mainLrc = line.Value
                                if not transLrc and i ~= #lrc then
                                    subLrc = lrc[i+1].Value
                                end
                            else
                                lrcStartPos = 1
                                break
                            end
                            lrcStartPos = i
                            break
                        end
                    end
                    if transLrc and mainLrc ~= "" then
                        for i=transLrcStartPos,#transLrc do
                            local line = transLrc[i]
                            if not IsValid(CloudMusic.CurrentChannel) then break end
                            if i == #transLrc or transLrc[i+1].Time > CloudMusic.CurrentChannel:GetTime()*1000 then
                                if transLrc[i].Time < CloudMusic.CurrentChannel:GetTime()*1000 then
                                    subLrc = line.Value
                                else
                                    transLrcStartPos = 1
                                    break
                                end
                                transLrcStartPos = i
                                break
                            end
                        end
                    end
                    if self.Ready then
                        self:RunJavascript([[
                            setLrc("]]..mainLrc:JavascriptSafe()..[[","]]..subLrc:JavascriptSafe()..[[");
                        ]])
                    end
                end
            else
                self:RunJavascript("hide()")
                self.State = "HIDE"
            end
        end
        function CloudMusic.HUD:Paint(w,h)
            if IsValid(CloudMusic.CurrentChannel) and GetSettings("CloudMusicHUDFFT") then
                local samples = {}
                local count = CloudMusic.CurrentChannel:FFT(samples,FFT_256)
                local height = (h*0.7-count*1+1)/count
                local top = h/2-h*0.7/2
                for i=1,count do
                    local sample = samples[i]
                    surface.SetDrawColor(GetSettings("CloudMusicHUDFFTColor"))
                    surface.DrawRect(0, top, (w*0.3)*sample, height)
                    top = top + height + 1
                end
            end
        end
        CloudMusic.Settings = vgui.Create("DPanel",CloudMusic)
        CloudMusic.Settings:SetPos(winw,30)
        CloudMusic.Settings:SetSize(winw,winh-30)
        function CloudMusic.Settings:Paint(w,h)
            draw.DrawText("设置", "CloudMusicSubTitle", 5, 5, GetSettings("CloudMusicTextColor"))
            draw.DrawText("显示界面内频谱", "CloudMusicText", 25, 30, GetSettings("CloudMusicTextColor"))
            draw.DrawText("显示HUD频谱", "CloudMusicText", 25, 50, GetSettings("CloudMusicTextColor"))
            if GetSettings("CloudMusicHUDFFT") then draw.DrawText("（部分情况可能会导致严重掉帧）", "CloudMusicText", 90, 50, Color(255,0,0)) end
            draw.DrawText("显示歌词", "CloudMusicText", 25, 70, GetSettings("CloudMusicTextColor"))
            draw.DrawText("启用动画", "CloudMusicText", 25, 90, GetSettings("CloudMusicTextColor"))
            draw.DrawText("打开3D外放", "CloudMusicText", 140, 30, GetSettings("CloudMusicTextColor"))
            draw.DrawText("屏蔽他人3D外放", "CloudMusicText", 140, 70, GetSettings("CloudMusicTextColor"))
            draw.DrawText("HUD位置", "CloudMusicText", 295, 32, GetSettings("CloudMusicTextColor"), TEXT_ALIGN_RIGHT)
            draw.DrawText("界面颜色", "CloudMusicSmallTitle", 5, 112, GetSettings("CloudMusicTextColor"))
            draw.DrawText("玩家列表", "CloudMusicSmallTitle", 170, 112, GetSettings("CloudMusicTextColor"))
            draw.DrawText("自定义HUD CSS", "CloudMusicSmallTitle", 375, 112, GetSettings("CloudMusicTextColor"))
            draw.DrawText("本播放器由Texas制作，感谢淡定WackoD在界面开发遇到一个问题时的提示以及开发3D外放时的帮助\n歌词功能使用了Cloudflare Worker进行简化处理", "CloudMusicText", w/2, h-64, GetSettings("CloudMusicTextColor"), TEXT_ALIGN_CENTER)
            draw.DrawText("版本 1.5.0", "CloudMusicText", 5, winh-49, GetSettings("CloudMusicTextColor"))
        end
        function CloudMusic.Settings:Think()
            if currentShowingPage == "Main" and (self:GetPos()) < winw then
                if GetSettings("CloudMusicAnimation") then
                    self:SetPos((self:GetPos())+slideAnimPix,30)
                else
                    self:SetPos(winw,30)
                end
            elseif currentShowingPage == "Settings" and (self:GetPos()) ~= 0 then
                if GetSettings("CloudMusicAnimation") then
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
            draw.RoundedBox(10, 0, 0, w, h, (self:IsHovered() and not self:GetDisabled()) and GetSettings("CloudMusicButtonHoverColor") or GetSettings("CloudMusicButtonColor"))
        end
        CloudMusic.Settings.FFT = vgui.Create("DCheckBox",CloudMusic.Settings)
        CloudMusic.Settings.FFT:SetPos(5,30)
        CloudMusic.Settings.FFT:SetChecked(GetSettings("CloudMusicFFT"))
        function CloudMusic.Settings.FFT:OnChange(val)
            SetSettings("CloudMusicFFT", val)
        end
        CloudMusic.Settings.HUDFFT = vgui.Create("DCheckBox",CloudMusic.Settings)
        CloudMusic.Settings.HUDFFT:SetPos(5,50)
        CloudMusic.Settings.HUDFFT:SetChecked(GetSettings("CloudMusicHUDFFT"))
        function CloudMusic.Settings.HUDFFT:OnChange(val)
            SetSettings("CloudMusicHUDFFT", val)
        end
        CloudMusic.Settings.Lyric = vgui.Create("DCheckBox",CloudMusic.Settings)
        CloudMusic.Settings.Lyric:SetPos(5,70)
        CloudMusic.Settings.Lyric:SetChecked(GetSettings("CloudMusicLyric"))
        function CloudMusic.Settings.Lyric:OnChange(val)
            lrc = nil
            transLrc = nil
            CloudMusic.HUD:RunJavascript([[
                setLrc("","");
            ]])
            if val and CloudMusic.CurrentPlaying then
                FetchLyric()
            end
            SetSettings("CloudMusicLyric", val)
        end
        CloudMusic.Settings.Animation = vgui.Create("DCheckBox",CloudMusic.Settings)
        CloudMusic.Settings.Animation:SetPos(5,90)
        CloudMusic.Settings.Animation:SetChecked(GetSettings("CloudMusicAnimation"))
        function CloudMusic.Settings.Animation:OnChange(val)
            SetSettings("CloudMusicAnimation",val)
        end
        CloudMusic.Settings.A3D = vgui.Create("DCheckBox",CloudMusic.Settings)
        CloudMusic.Settings.A3D:SetPos(120,30)
        if ULib == nil or ULib.ucl.query(LocalPlayer(),"cloudmusic3d") then
            CloudMusic.Settings.A3D:SetChecked(GetSettings("CloudMusic3D"))
        else
            CloudMusic.Settings.A3D:SetChecked(false)
        end
        function CloudMusic.Settings.A3D:OnChange(val)
            if ULib ~= nil and not ULib.ucl.query(LocalPlayer(),"cloudmusic3d") and val then
                SetDMUISkin(Derma_Message("你没有权限开启外放", "无权限", "好的"))
                self:SetChecked(false)
                return
            end
            SetSettings("CloudMusic3D", val)
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
            if ULib ~= nil and not ULib.ucl.query(LocalPlayer(),"cloudmusic3d") and self:GetChecked() then
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
        CloudMusic.Settings.Bypass3D:SetChecked(GetSettings("CloudMusicBypass3D"))
        function CloudMusic.Settings.Bypass3D:OnChange(val)
            SetSettings("CloudMusicBypass3D", val)
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
        CloudMusic.Settings.HudPos = vgui.Create("DButton",CloudMusic.Settings)
        CloudMusic.Settings.HudPos:SetPos(300,30)
        CloudMusic.Settings.HudPos:SetSize(45,20)
        CloudMusic.Settings.HudPos:SetColor(Color(255,255,255))
        function CloudMusic.Settings.HudPos:DoClick()
            if currentHudPos == "top-left" then
                currentHudPos = "top-right"
            elseif currentHudPos == "top-right" then
                currentHudPos = "bottom-left"
            elseif currentHudPos == "bottom-left" then
                currentHudPos = "bottom-right"
            elseif currentHudPos == "bottom-right" then
                currentHudPos = "top-left"
            end
            CloudMusic.HUD:RunJavascript([[setHudPos("]]..currentHudPos..[[");]])
            SetSettings("CloudMusicHudPos",currentHudPos)
        end
        function CloudMusic.Settings.HudPos:Think()
            if currentHudPos == "top-left" then
                self:SetText("左上角")
            elseif currentHudPos == "top-right" then
                self:SetText("右上角")
            elseif currentHudPos == "bottom-left" then
                self:SetText("左下角")
            elseif currentHudPos == "bottom-right" then
                self:SetText("右下角")
            end
        end
        function CloudMusic.Settings.HudPos:Paint(w,h)
            draw.RoundedBox(10, 0, 0, w, h, (self:IsHovered() and not self:GetDisabled()) and GetSettings("CloudMusicButtonHoverColor") or GetSettings("CloudMusicButtonColor"))
        end
        CloudMusic.Settings.BlacklistUser = vgui.Create("DListView",CloudMusic.Settings)
        CloudMusic.Settings.BlacklistUser:AddColumn("状态"):SetMaxWidth(25)
        CloudMusic.Settings.BlacklistUser:AddColumn("玩家名称")
        CloudMusic.Settings.BlacklistUser:AddColumn("SteamID64")
        CloudMusic.Settings.BlacklistUser:SetPos(170,130)
        CloudMusic.Settings.BlacklistUser:SetSize(300,250)
        CloudMusic.Settings.BlacklistUser:SetMultiSelect(false)
        CloudMusic.Settings.BlacklistUser:SetSortable(false)
        DisableListHeader(CloudMusic.Settings.BlacklistUser)
        function CloudMusic.Settings.BlacklistUser:OnRowRightClick(lineID, line)
            self:ShowMenu()
        end
        function CloudMusic.Settings.BlacklistUser:ShowMenu()
            local menu = DermaMenu(self)
            menu:AddOption("加入/移出黑名单",function()
                local selected = self:GetSelected()[1]
                if selected.Blacklisted then
                    for i=1,#self.Users do
                        if self.Users[i].ID == selected:GetColumnText(3) then
                            table.remove(self.Users,i)
                            net.Start("CloudMusicReqSync")
                            net.SendToServer()
                            break
                        end
                    end
                else
                    for _,v in pairs(player.GetAll()) do
                        if IsValid(v.MusicChannel) and v:SteamID64() == selected:GetColumnText(3) then
                            v.MusicChannel:Stop()
                            v.MusicChannel = nil
                            break
                        end
                    end
                    table.insert(self.Users,{
                        Name = selected:GetColumnText(2),
                        ID = selected:GetColumnText(3)
                    })
                end
                self:Sync()
            end):SetIcon("icon16/user_delete.png")
            menu:AddOption("复制玩家名称",function()
                SetClipboardText(self.Users[self:GetSelectedLine()].Name)
                SetDMUISkin(Derma_Message("已复制到剪贴板", "复制成功", "好的"))
            end):SetIcon("icon16/page_copy.png")
            menu:AddOption("复制Steam64ID",function()
                SetClipboardText(self.Users[self:GetSelectedLine()].ID)
                SetDMUISkin(Derma_Message("已复制到剪贴板", "复制成功", "好的"))
            end):SetIcon("icon16/page_white_copy.png")
            menu:AddSpacer()
            menu:AddOption("将所有黑名单玩家移出",function()
                self.Users = {}
                self:Sync()
            end):SetIcon("icon16/delete.png")
            SetUISkin(menu)
            menu:Open()
        end
        function CloudMusic.Settings.BlacklistUser:Save()
            SetSettings("CloudMusicBlacklistUsers",self.Users)
        end
        function CloudMusic.Settings.BlacklistUser:Sync()
            self:Clear()
            for _,v in pairs(player.GetAll()) do
                if IsValid(v) and v ~= LocalPlayer() and not v:IsBot() then
                    local line = self:AddLine("√",v:Nick(),v:SteamID64())
                    local blacklisted = false
                    for _,p in pairs(self.Users) do
                        if p.ID == v:SteamID64() then
                            blacklisted = true
                        end
                    end
                    if blacklisted then
                        line:SetColumnText(1,"×")
                    end
                    line.Blacklisted = blacklisted
                end
            end
            self:Save()
        end
        CloudMusic.Settings.BlacklistUser.Users = GetSettings("CloudMusicBlacklistUsers")
        if CloudMusic.Settings.BlacklistUser.Users == nil then
            CloudMusic.Settings.BlacklistUser.Users = {}
        end
        CloudMusic.Settings.HUDCustomCSS = vgui.Create("DTextEntry",CloudMusic.Settings)
        CloudMusic.Settings.HUDCustomCSS:SetPos(475,130)
        CloudMusic.Settings.HUDCustomCSS:SetSize(400,250)
        CloudMusic.Settings.HUDCustomCSS:SetMultiline(true)
        CloudMusic.Settings.HUDCustomCSS:SetValue(GetSettings("CloudMusicHUDCustomCSS"))
        function CloudMusic.Settings.HUDCustomCSS:OnGetFocus()
            self.Focused = true
        end
        function CloudMusic.Settings.HUDCustomCSS:OnLoseFocus()
            self.Focused = false
        end
        function CloudMusic.Settings.HUDCustomCSS:OnChange()
            local text = self:GetValue()
            SetSettings("CloudMusicHUDCustomCSS",text)
            CloudMusic.HUD:RunJavascript([[
                setCustomCSS("]]..text:JavascriptSafe()..[[");
            ]])
        end
        CloudMusic.Settings.Colors = vgui.Create("DScrollPanel",CloudMusic.Settings)
        CloudMusic.Settings.Colors:SetPos(5,130)
        CloudMusic.Settings.Colors:SetSize(160,250)
        function CloudMusic.Settings.Colors:AddColorOption(name,bindName,callback)
            local title = CloudMusic.Settings.Colors:Add("DLabel")
            title:SetTextColor(GetSettings("CloudMusicTextColor"))
            title:SetFont("CloudMusicText")
            title:SetText(name)
            title:Dock(TOP)
            local mixer = CloudMusic.Settings.Colors:Add("DColorMixer")
            mixer:SetSize(150,200)
            mixer:SetAlphaBar(false)
            mixer:SetColor(GetSettings(bindName))
            mixer:Dock(TOP)
            mixer.BindName = bindName
            if callback ~= nil then
                mixer.Callback = callback
                if type(callback) == "function" then
                    callback(GetSettings(bindName))
                end
            end
            function mixer:ValueChanged(col)
                SetSettings(bindName,col)
                if self.Callback ~= nil and type(self.Callback) == "function" then
                    self.Callback(col)
                end
            end
            return mixer,title
        end
        CloudMusic.Settings.Colors.Reset = CloudMusic.Settings.Colors:Add("DButton")
        CloudMusic.Settings.Colors.Reset:SetSize(45,20)
        CloudMusic.Settings.Colors.Reset:SetColor(Color(255,255,255))
        CloudMusic.Settings.Colors.Reset:SetText("重置所有颜色")
        CloudMusic.Settings.Colors.Reset:Dock(TOP)
        function CloudMusic.Settings.Colors.Reset:DoClick()
            for _,v in pairs(CloudMusic.Settings.Colors:GetCanvas():GetChildren()) do
                if v:GetName() == "DColorMixer" then
                    SetSettings(v.BindName,defaultSettings[v.BindName])
                    if v.Callback ~= nil and type(v.Callback) == "function" then
                        v.Callback(defaultSettings[v.BindName])
                    end
                end
            end
        end
        function CloudMusic.Settings.Colors.Reset:Paint(w,h)
            draw.RoundedBox(10, 0, 0, w, h, (self:IsHovered() and not self:GetDisabled()) and GetSettings("CloudMusicButtonHoverColor") or GetSettings("CloudMusicButtonColor"))
        end
        CloudMusic.Settings.Colors:AddColorOption("文字颜色","CloudMusicTextColor",function(col)
            for _,v in pairs(CloudMusic.Settings.Colors:GetCanvas():GetChildren()) do
                if v:GetName() == "DLabel" then v:SetTextColor(col) end
            end
        end)
        CloudMusic.Settings.Colors:AddColorOption("背景颜色","CloudMusicBackgroundColor")
        CloudMusic.Settings.Colors:AddColorOption("标题栏文字颜色","CloudMusicTitleBarTextColor")
        CloudMusic.Settings.Colors:AddColorOption("标题栏颜色","CloudMusicTitleBarColor")
        CloudMusic.Settings.Colors:AddColorOption("按钮颜色","CloudMusicButtonColor")
        CloudMusic.Settings.Colors:AddColorOption("按钮悬浮颜色","CloudMusicButtonHoverColor")
        CloudMusic.Settings.Colors:AddColorOption("按钮文字颜色","CloudMusicButtonTextColor",function(col)
            local iter = {}
            function iter:Run(panel)
                if panel:GetName() == "DButton" then
                    panel:SetColor(col)
                end
                for _,v in pairs(panel:GetChildren()) do
                    if v:GetName() ~= "DListView" then
                        self:Run(v)
                    end
                end
            end
            iter:Run(CloudMusic)
        end)
        CloudMusic.Settings.Colors:AddColorOption("播放器内频谱颜色","CloudMusicPlayerFFTColor")
        CloudMusic.Settings.Colors:AddColorOption("进度条颜色","CloudMusicBarColor")
        CloudMusic.Settings.Colors:AddColorOption("HUD文字颜色","CloudMusicHUDTextColor",function()
            local text = GetSettings("CloudMusicHUDTextColor")
            CloudMusic.HUD:RunJavascript([[
                setTextColor(]]..text.r..[[,]]..text.g..[[,]]..text.b..[[);
            ]])
        end)
        CloudMusic.Settings.Colors:AddColorOption("HUD已播放进度条颜色","CloudMusicHUDProgressPlayedColor",function()
            local progressPlayed = GetSettings("CloudMusicHUDProgressPlayedColor")
            CloudMusic.HUD:RunJavascript([[
                setPlayedColor(]]..progressPlayed.r..[[,]]..progressPlayed.g..[[,]]..progressPlayed.b..[[)
            ]])
        end)
        CloudMusic.Settings.Colors:AddColorOption("HUD未播放进度条颜色","CloudMusicHUDProgressUnplayedColor",function()
            local progressUnplayed = GetSettings("CloudMusicHUDProgressUnplayedColor")
            CloudMusic.HUD:RunJavascript([[
                setUnplayedColor(]]..progressUnplayed.r..[[,]]..progressUnplayed.g..[[,]]..progressUnplayed.b..[[);
            ]])
        end)
        CloudMusic.Settings.Colors:AddColorOption("HUD频谱颜色","CloudMusicHUDFFTColor")
        CloudMusic.Settings.Texas = vgui.Create("DButton",CloudMusic.Settings)
        CloudMusic.Settings.Texas:SetPos(winw/2-67.5,winh-66)
        CloudMusic.Settings.Texas:SetSize(65,20)
        CloudMusic.Settings.Texas:SetColor(Color(255,255,255))
        CloudMusic.Settings.Texas:SetText("联系Texas")
        CloudMusic.Settings.Texas.DoClick = function()
            gui.OpenURL("http://steamcommunity.com/profiles/76561198163912747")
        end
        function CloudMusic.Settings.Texas:Paint(w,h)
            draw.RoundedBox(10, 0, 0, w, h, (self:IsHovered() and not self:GetDisabled()) and GetSettings("CloudMusicButtonHoverColor") or GetSettings("CloudMusicButtonColor"))
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
            draw.RoundedBox(10, 0, 0, w, h, (self:IsHovered() and not self:GetDisabled()) and GetSettings("CloudMusicButtonHoverColor") or GetSettings("CloudMusicButtonColor"))
        end
        CloudMusic.Settings.Exusiai = vgui.Create("DHTML",CloudMusic.Settings)
        CloudMusic.Settings.Exusiai:SetPos(0,0)
        CloudMusic.Settings.Exusiai:SetSize(winw,winh-30)
        CloudMusic.Settings.Exusiai:SetZPos(-1)
        CloudMusic.Settings.Exusiai:SetHTML([[
            <body style="user-select:none;pointer-events:none;">
                <img src="http://penguin-logistics.cn/images/exusiai.png" style="position:absolute;bottom:5px;right:5px;max-height:50%;"/>
                <script>
                    window.onmousedown = function() {return false;}
                    window.onkeydown = function() {return false;}
                </script>
            </body>
        ]])
        if file.Exists("materials/gwenskin/windows10.png", "GAME") then
            SetUISkin(CloudMusic)
        end
        CloudMusic.Songs = {}
        CloudMusic.Playlists:SetVisible(false)
        CloudMusic:SetAlpha(0)
        CloudMusic:SetVisible(false)
        InitUserInfo()
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
            if GetSettings("CloudMusicBypass3D") then return end
            local p = net.ReadEntity()
            local valid = net.ReadBool()
            local state = net.ReadInt(32)
            local volume = net.ReadFloat()
            local id = net.ReadString()
            local time = net.ReadFloat()
            if p == LocalPlayer() then return end
            for _,v in pairs(CloudMusic.Settings.BlacklistUser.Users) do
                if v.ID == p:SteamID64() then
                    return
                end
            end
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
        CloudMusicInitOnce = true
    end
    hook.Add("InitPostEntity", "CloudMusic_Init", Init)
    concommand.Add("cloudmusic", function()
        ToggleCloudMusic()
    end, nil, "打开网易云播放器")
    concommand.Add("cloudmusic_reinit",function()
        Init()
    end, nil, "重新初始化网易云播放器")
    if CloudMusicInitOnce then
        Init()
    end
end
if SERVER then
    print("===========================\n")
    print("    Cloud Music for LUA    \n")
    print("         By  Texas         \n")
    print("===========================")
    local function HookKey()
        util.AddNetworkString("ToggleCloudMusic")
        util.AddNetworkString("CloudMusicKeyDown")
        util.AddNetworkString("CloudMusic3DSync")
        util.AddNetworkString("CloudMusicReqSync")
        if not CloudMusicRegisteredULib and ULib ~= nil then
            CloudMusicRegisteredULib = true
            ULib.ucl.registerAccess("cloudmusic3d","user","允许玩家使用3D外放功能","网易云音乐")
        end
    end
    hook.Add("InitPostEntity", "CloudMusic_Init", HookKey)
    hook.Add("PlayerButtonDown", "CloudMusic_KeyPress", function(ply,btn)
        if btn == KEY_F9 then
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
    hook.Add("PlayerSay","CloudMusic_PlayerSay",function(ply,text,team,dead)
        if string.lower(text) == "!cloudmusic" or string.lower(text) == "!cm" then
            net.Start("ToggleCloudMusic")
            net.Send(ply)
            return ""
        end
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
        if ULib ~= nil and not ULib.ucl.query(p,"cloudmusic3d") and valid then return end
        net.Start("CloudMusic3DSync")
        net.WriteEntity(p)
        net.WriteBool(valid)
        net.WriteInt(state, 32)
        net.WriteFloat(volume)
        net.WriteString(id)
        net.WriteFloat(time)
        net.Broadcast()
    end)
    if file.Exists("materials/gwenskin/windows10.png", "GAME") then
        resource.AddSingleFile("materials/gwenskin/windows10.png")
    else
        resource.AddWorkshop(1800442580)
    end
    HookKey()
end