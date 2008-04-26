
local function SetFont(obj, font, size, style, r, g, b, sr, sg, sb, sox, soy)
	obj:SetFont(font, size, style)
	if sr and sg and sb then obj:SetShadowColor(sr, sg, sb) end
	if sox and soy then obj:SetShadowOffset(sox, soy) end
	if r and g and b then obj:SetTextColor(r, g, b)
	elseif r then obj:SetAlpha(r) end
end


local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function()
	local NORMAL     = "Interface\\AddOns\\tekticles\\Calibri.ttf"
	local BOLD       = "Interface\\AddOns\\tekticles\\CalibriBold.ttf"
	local BOLDITALIC = "Interface\\AddOns\\tekticles\\CalibriBoldItalic.ttf"
	local ITALIC     = "Interface\\AddOns\\tekticles\\CalibriItalic.ttf"
	local NUMBER     = "Interface\\AddOns\\tekticles\\CalibriBold.ttf"

	UIDROPDOWNMENU_DEFAULT_TEXT_HEIGHT = 12
	CHAT_FONT_HEIGHTS = {7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24}

	UNIT_NAME_FONT     = NORMAL
	NAMEPLATE_FONT     = BOLD
	DAMAGE_TEXT_FONT   = NUMBER
	STANDARD_TEXT_FONT = NORMAL

	SetFont(ChatFontNormal,              NORMAL, 14)
	SetFont(ChatFontSmall,               NORMAL, 12)
	SetFont(CombatTextFont,              NORMAL, 26)
	SetFont(DialogButtonHighlightText,   NORMAL, 17)
	SetFont(DialogButtonNormalText,      NORMAL, 17)
	SetFont(ErrorFont,                   ITALIC, 16, nil, 60)
	SetFont(GameFontBlack,               NORMAL, 13)
	SetFont(GameFontDarkGraySmall,         BOLD, 11, nil, 0.4, 0.4, 0.4)
	SetFont(GameFontDisable,             NORMAL, 13, nil, 0.6, 0.6, 0.6)
	SetFont(GameFontDisableLarge,        NORMAL, 17, nil, 0.6, 0.6, 0.6)
	SetFont(GameFontDisableSmall,          BOLD, 11, nil, 0.6, 0.6, 0.6)
	SetFont(GameFontGreen,               NORMAL, 13)
	SetFont(GameFontGreenLarge,          NORMAL, 17)
	SetFont(GameFontGreenSmall,            BOLD, 11)
	SetFont(GameFontHighlight,           NORMAL, 13)
	SetFont(GameFontHighlightLarge,      NORMAL, 17)
	SetFont(GameFontHighlightSmall,        BOLD, 11)
	SetFont(GameFontHighlightSmallOutline, BOLD, 11, "OUTLINE")
	SetFont(GameFontNormal,              NORMAL, 13)
	SetFont(GameFontNormalHuge,            BOLD, 20)
	SetFont(GameFontNormalLarge,           BOLD, 17)
	SetFont(GameFontNormalSmall,           BOLD, 11)
	SetFont(GameFontRed,                 NORMAL, 13)
	SetFont(GameFontRedLarge,            NORMAL, 17)
	SetFont(GameFontRedSmall,              BOLD, 11)
	SetFont(GameFontWhite,               NORMAL, 13)
	SetFont(GameTooltipHeaderText,         BOLD, 15, "OUTLINE")
	SetFont(GameTooltipText,             NORMAL, 13)
	SetFont(GameTooltipTextSmall,          BOLD, 12)
	SetFont(InvoiceTextFontNormal,       ITALIC, 13, nil, 0.15, 0.09, 0.04)
	SetFont(InvoiceTextFontSmall,        ITALIC, 11, nil, 0.15, 0.09, 0.04)
	SetFont(ItemTextFontNormal,          NORMAL, 16)
	SetFont(MailTextFontNormal,          ITALIC, 15, nil, 0.15, 0.09, 0.04, 0.54, 0.4, 0.1, 1, -1)
	SetFont(NumberFontNormal,            NUMBER, 15, "OUTLINE")
	SetFont(NumberFontNormalHuge,        NUMBER, 30, "THICKOUTLINE", 30)
	SetFont(NumberFontNormalLarge,       NUMBER, 17, "OUTLINE")
	SetFont(NumberFontNormalSmall,       NUMBER, 13, "OUTLINE")
	SetFont(NumberFontNormalSmallGray,   NUMBER, 13, "OUTLINE")
	SetFont(NumberFontNormalYellow,      NUMBER, 15, "OUTLINE")
	SetFont(PVPInfoTextFont,             NORMAL, 22, "THICKOUTLINE")
	SetFont(QuestFont,                   ITALIC, 14, nil, 0.15, 0.09, 0.04)
	SetFont(QuestFontHighlight,          NORMAL, 15)
	SetFont(QuestFontNormalSmall,          BOLD, 13, nil, nil, nil, nil, 0.54, 0.4, 0.1)
	SetFont(QuestTitleFont,                BOLD, 19, nil, nil, nil, nil, 0.54, 0.4, 0.1)
	SetFont(SubSpellFont,                  BOLD, 11)
	SetFont(SubZoneTextFont,         BOLDITALIC, 27, "THICKOUTLINE")
	SetFont(SystemFont,                  NORMAL, 17)
	SetFont(TextStatusBarText,           NUMBER, 13, "OUTLINE")
	SetFont(TextStatusBarTextSmall,      NORMAL, 13)
	SetFont(WorldMapTextFont,        BOLDITALIC, 31, "THICKOUTLINE",  40, nil, nil, 0, 0, 0, 1, -1)
	SetFont(ZoneTextFont,            BOLDITALIC, 31, "THICKOUTLINE", nil, nil, nil, 0, 0, 0, 1, -1)

	for i=1,7 do
		local f = _G["ChatFrame"..i]
		local font, size = f:GetFont()
		f:SetFont(NORMAL, size)
	end
end)


local LSM = LibStub:GetLibrary("LibSharedMedia-3.0", true)
if LSM then
	LSM:Register(LSM.MediaType.FONT, "Calibri", "Interface\\AddOns\\tekticles\\Calibri.ttf")
	LSM:Register(LSM.MediaType.FONT, "Calibri Bold", "Interface\\AddOns\\tekticles\\CalibriBold.ttf")
	LSM:Register(LSM.MediaType.FONT, "Calibri Bold Italic", "Interface\\AddOns\\tekticles\\CalibriBoldItalic.ttf")
	LSM:Register(LSM.MediaType.FONT, "Calibri Italic", "Interface\\AddOns\\tekticles\\CalibriItalic.ttf")
end
