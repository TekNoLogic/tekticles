local function SetFont(obj, font, size, style, r, g, b, sr, sg, sb, sox, soy)
	obj:SetFont(font, size, style)
	if sr and sg and sb then obj:SetShadowColor(sr, sg, sb) end
	if sox and soy then obj:SetShadowOffset(sox, soy) end
	if r and g and b then obj:SetTextColor(r, g, b)
	elseif r then obj:SetAlpha(r) end
end


local name, addon = ...
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, arg1, ...)
  if arg1 ~= name then return end


  do  --  Default options
    if tekticles_options            == nil then tekticles_options            = {}                                                    end
    if tekticles_options.normal     == nil then tekticles_options.normal     = 'Interface\\AddOns\\tekticles\\Calibri.ttf'           end
    if tekticles_options.bold       == nil then tekticles_options.bold       = 'Interface\\AddOns\\tekticles\\CalibriBold.ttf'       end
    if tekticles_options.bolditalic == nil then tekticles_options.bolditalic = 'Interface\\AddOns\\tekticles\\CalibriBoldItalic.ttf' end
    if tekticles_options.italic     == nil then tekticles_options.italic     = 'Interface\\AddOns\\tekticles\\CalibriItalic.ttf'     end
    if tekticles_options.number     == nil then tekticles_options.number     = 'Interface\\AddOns\\tekticles\\CalibriBold.ttf'       end

    -- Override things; I hate bold and italics!
    -- TODO - implement an options panel.
    --   (Steal code from TidyBar)
    --tekticles_options.normal     = 'Interface\\AddOns\\tekticles\\Calibri.ttf'
    --tekticles_options.bold       = 'Interface\\AddOns\\tekticles\\Calibri.ttf'
    --tekticles_options.bolditalic = 'Interface\\AddOns\\tekticles\\Calibri.ttf'
    --tekticles_options.italic     = 'Interface\\AddOns\\tekticles\\Calibri.ttf'
    -- This is my preference because 
    tekticles_options.number     = 'Interface\\AddOns\\tekticles\\Calibri.ttf'
  end


	UIDROPDOWNMENU_DEFAULT_TEXT_HEIGHT = 12
	CHAT_FONT_HEIGHTS = {10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24}

	UNIT_NAME_FONT           = tekticles_options.normal
	DAMAGE_TEXT_FONT         = tekticles_options.number
	STANDARD_TEXT_FONT       = tekticles_options.normal
	NAMEPLATE_FONT           = tekticles_options.normal
	NAMEPLATE_SPELLCAST_FONT = tekticles_options.normal

	do  -- Base fonts
    SetFont(AchievementFont_Small,              tekticles_options.bold, 12)
    SetFont(FriendsFont_Large,                  tekticles_options.normal, 15, nil, nil, nil, nil, 0, 0, 0, 1, -1)
    SetFont(FriendsFont_Normal,                 tekticles_options.normal, 13, nil, nil, nil, nil, 0, 0, 0, 1, -1)
    SetFont(FriendsFont_Small,                  tekticles_options.normal, 11, nil, nil, nil, nil, 0, 0, 0, 1, -1)
    SetFont(FriendsFont_UserText,               tekticles_options.number, 12, nil, nil, nil, nil, 0, 0, 0, 1, -1)
    SetFont(GameTooltipHeader,                  tekticles_options.bold, 15, "OUTLINE")
    SetFont(GameFont_Gigantic,                  tekticles_options.bold, 32, nil, nil, nil, nil, 0, 0, 0, 1, -1)
    SetFont(GameNormalNumberFont,               tekticles_options.bold, 11)
    SetFont(InvoiceFont_Med,                    tekticles_options.italic, 13, nil, 0.15, 0.09, 0.04)
    SetFont(InvoiceFont_Small,                  tekticles_options.italic, 11, nil, 0.15, 0.09, 0.04)
    SetFont(MailFont_Large,                     tekticles_options.italic, 15, nil, 0.15, 0.09, 0.04, 0.54, 0.4, 0.1, 1, -1)
    SetFont(NumberFont_OutlineThick_Mono_Small, tekticles_options.number, 13, "OUTLINE")
    SetFont(NumberFont_Outline_Huge,            tekticles_options.number, 30, "THICKOUTLINE", 30)
    SetFont(NumberFont_Outline_Large,           tekticles_options.number, 17, "OUTLINE")
    SetFont(NumberFont_Outline_Med,             tekticles_options.number, 15, "OUTLINE")
    SetFont(NumberFont_Shadow_Med,              tekticles_options.normal, 14)
    SetFont(NumberFont_Shadow_Small,            tekticles_options.normal, 12)
    SetFont(QuestFont_Shadow_Small,             tekticles_options.normal, 16)
    SetFont(QuestFont_Large,                    tekticles_options.normal, 16)
    SetFont(QuestFont_Huge,                     tekticles_options.bold, 19, nil, nil, nil, nil, 0.54, 0.4, 0.1)
    SetFont(QuestFont_Shadow_Huge,              tekticles_options.bold, 19, nil, nil, nil, nil, 0.54, 0.4, 0.1)
    SetFont(QuestFont_Super_Huge,               tekticles_options.bold, 24)
    SetFont(ReputationDetailFont,               tekticles_options.bold, 12, nil, nil, nil, nil, 0, 0, 0, 1, -1)
    SetFont(SpellFont_Small,                    tekticles_options.bold, 11)
    SetFont(SystemFont_InverseShadow_Small,     tekticles_options.bold, 11)
    SetFont(SystemFont_Large,                   tekticles_options.normal, 17)
    SetFont(SystemFont_Med1,                    tekticles_options.normal, 13)
    SetFont(SystemFont_Med2,                    tekticles_options.italic, 14, nil, 0.15, 0.09, 0.04)
    SetFont(SystemFont_Med3,                    tekticles_options.normal, 15)
    SetFont(SystemFont_OutlineThick_Huge2,      tekticles_options.normal, 22, "THICKOUTLINE")
    SetFont(SystemFont_OutlineThick_Huge4,      tekticles_options.bolditalic, 27, "THICKOUTLINE")
    SetFont(SystemFont_OutlineThick_WTF,        tekticles_options.bolditalic, 31, "THICKOUTLINE", nil, nil, nil, 0, 0, 0, 1, -1)
    SetFont(SystemFont_Outline_Small,           tekticles_options.number, 13, "OUTLINE")
    SetFont(SystemFont_Shadow_Huge1,            tekticles_options.bold, 20)
    SetFont(SystemFont_Shadow_Huge3,            tekticles_options.bold, 25)
    SetFont(SystemFont_Shadow_Large,            tekticles_options.normal, 17)
    SetFont(SystemFont_Shadow_Med1,             tekticles_options.normal, 13)
    SetFont(SystemFont_Shadow_Med2,             tekticles_options.normal, 14)
    SetFont(SystemFont_Shadow_Med3,             tekticles_options.normal, 15)
    -- This was causing problems and commenting it out seems to work just fine.
    --SetFont(SystemFont_Shadow_Outline_Huge2,    tekticles_options.normal, 22, "OUTLINE")
    SetFont(SystemFont_Shadow_Small,            tekticles_options.bold, 11)
    SetFont(SystemFont_Small,                   tekticles_options.normal, 12)
    SetFont(SystemFont_Tiny,                    tekticles_options.normal, 11)
    SetFont(Tooltip_Med,                        tekticles_options.normal, 13)
    SetFont(Tooltip_Small,                      tekticles_options.bold, 12)
    SetFont(WhiteNormalNumberFont,              tekticles_options.bold, 11)
  end

	do  -- Derived fonts
    SetFont(BossEmoteNormalHuge,  tekticles_options.bolditalic, 27, "THICKOUTLINE")
    SetFont(CombatTextFont,       tekticles_options.normal,     26)
    SetFont(ErrorFont,            tekticles_options.italic,     16, nil,             60)
    SetFont(QuestFontNormalSmall, tekticles_options.bold,       13, nil,            nil, nil, nil, 0.54, 0.4, 0.1)
    SetFont(WorldMapTextFont,     tekticles_options.bolditalic, 31, "THICKOUTLINE",  40, nil, nil, 0,      0,   0, 1, -1)
  end


  do  -- legion nameplates
    SetFont(GameFontWhite,                      tekticles_options.normal, 13)
    SetFont(GameFontWhiteTiny,                  tekticles_options.normal, 11)
    SetFont(SystemFont_NamePlate,        tekticles_options.normal, 12, "OUTLINE")
    SetFont(SystemFont_LargeNamePlate,   tekticles_options.normal, 16, "OUTLINE")
    SetFont(SystemFont_NamePlateCastBar, tekticles_options.number, 14, "OUTLINE")
  end


	for i=1,7 do
		local f = _G["ChatFrame"..i]
		local font, size = f:GetFont()
		f:SetFont(tekticles_options.normal, size)
	end

	-- I have no idea why the channel list is getting fucked up
	-- but re-setting the font obj seems to fix it
  -- See issue #18
  -- https://github.com/TekNoLogic/tekticles/issues/18
	--for i=1,GetNumDisplayChannels() do
		--local f = _G["ChannelButton"..i.."Text"]
		--f:SetFontObject(GameFontNormalSmallLeft)
		---- function f:SetFont(...) error("Attempt to set font on ChannelButton"..i) end
	--end

	for _,butt in pairs(PaperDollTitlesPane.buttons) do butt.text:SetFontObject(GameFontHighlightSmallLeft) end
end)


local LSM = LibStub and LibStub:GetLibrary("LibSharedMedia-3.0", true)
if LSM then
	LSM:Register(LSM.MediaType.FONT, "Calibri", "Interface\\AddOns\\tekticles\\Calibri.ttf")
	LSM:Register(LSM.MediaType.FONT, "Calibri Bold", "Interface\\AddOns\\tekticles\\CalibriBold.ttf")
	LSM:Register(LSM.MediaType.FONT, "Calibri Bold Italic", "Interface\\AddOns\\tekticles\\CalibriBoldItalic.ttf")
	LSM:Register(LSM.MediaType.FONT, "Calibri Italic", "Interface\\AddOns\\tekticles\\CalibriItalic.ttf")
end
