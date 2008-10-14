
local frame = CreateFrame("ScrollFrame", nil, InterfaceOptionsFramePanelContainer)
frame.name = "tekticles"
frame:Hide()

frame:SetScript("OnShow", function(self)
	local title, subtitle = LibStub("tekKonfig-Heading").new(self, "tekticles", "This panel shows a preview for every major font template provided by Blizzard.")

	local group = LibStub("tekKonfig-Group").new(self)
	group:SetPoint("TOP", subtitle, "BOTTOM", 0, -8)
	group:SetPoint("BOTTOMLEFT", 16, 16)
	group:SetPoint("BOTTOMRIGHT", -16, 16)

	local GAP = 5
	local scroll = CreateFrame("ScrollFrame", nil, group)
	scroll:SetPoint("TOPRIGHT", -GAP, -GAP)
	scroll:SetPoint("BOTTOMLEFT", GAP, GAP)

	local frame = CreateFrame("Frame", nil, scroll)
	scroll:SetScrollChild(frame)
	frame:SetPoint("TOP")
	frame:SetPoint("LEFT")
	frame:SetPoint("RIGHT")
	frame:SetHeight(1000)

	local scrollbar, upbutt, downbutt = LibStub("tekKonfig-Scroll").new(group, 6)
	scrollbar:SetMinMaxValues(0,550)
	scrollbar:SetValue(0)

	local f = scrollbar:GetScript("OnValueChanged")
	scrollbar:SetScript("OnValueChanged", function(self, value, ...)
		scroll:SetVerticalScroll(value)
		frame:SetPoint("TOP", 0, value)
		return f(self, value, ...)
	end)

	local offset = 0
	scroll:UpdateScrollChildRect()
	scroll:EnableMouseWheel(true)
	scroll:SetScript("OnMouseWheel", function(self, val) scrollbar:SetValue(scrollbar:GetValue() - val*50) end)

	local last
	local fonts, needbackground = {
		"GameFontNormal",
		"GameFontHighlight",
		"GameFontDisable",
		"GameFontNormalSmall",
		"GameFontHighlightExtraSmall",
		"GameFontHighlightMedium",
		"GameFontNormalLarge",
		"GameFontNormalHuge",
		"BossEmoteNormalHuge",
		"NumberFontNormal",
		"NumberFontNormalSmall",
		"NumberFontNormalLarge",
		"NumberFontNormalHuge",
		"ChatFontNormal",
		"ChatFontSmall",
		"QuestTitleFont",
		"QuestFont",
		"QuestFontNormalSmall",
		"QuestFontHighlight",
		"ItemTextFontNormal",
		"MailTextFontNormal",
		"SubSpellFont",
		"DialogButtonNormalText",
		"ZoneTextFont",
		"SubZoneTextFont",
		"PVPInfoTextFont",
		"ErrorFont",
		"TextStatusBarText",
		"CombatLogFont",
		"GameTooltipText",
		"GameTooltipTextSmall",
		"GameTooltipHeaderText",
		"WorldMapTextFont",
		"InvoiceTextFontNormal",
		"InvoiceTextFontSmall",
		"CombatTextFont",
		"MovieSubtitleFont",
		"AchievementPointsFont",
		"AchievementPointsFontSmall",
		"AchievementDescriptionFont",
		"AchievementCriteriaFont",
		"AchievementDateFont",
		"ReputationDetailFont",
	}, {
		QuestFont = true,
		QuestFontNormalSmall = true,
		QuestTitleFont = true,
		QuestFontHighlight = true,
		ItemTextFontNormal = true,
		InvoiceTextFontNormal = true,
		InvoiceTextFontSmall = true,
		MailTextFontNormal = true,
		SubSpellFont = true,
	}
	for i,font in pairs(fonts) do
		local fs = frame:CreateFontString(nil, "ARTWORK", font)
		fs:SetPoint("TOP", last or frame, last and "BOTTOM" or "TOP", 0, last and -4 or 0)
		fs:SetText(font)
		if needbackground[font] then
			local tex = frame:CreateTexture(nil, "ARTWORK")
			tex:SetPoint("TOPRIGHT", fs)
			tex:SetPoint("BOTTOMLEFT", fs)
			tex:SetTexture("Interface\\ChatFrame\\ChatFrameBackground")
			tex:SetVertexColor(.8,.8,.8)
		end
		last = fs
	end

	self:SetScript("OnShow", nil)
end)

InterfaceOptions_AddCategory(frame)

LibStub("tekKonfig-AboutPanel").new("tekticles", "tekticles")
