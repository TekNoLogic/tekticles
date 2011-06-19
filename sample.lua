
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
		"CombatTextFont",
		"MovieSubtitleFont",
		"AchievementPointsFont",
		"AchievementPointsFontSmall",
		"AchievementDescriptionFont",
		"AchievementCriteriaFont",
		"AchievementDateFont",
		"ReputationDetailFont",
		"QuestTitleFont",
		"QuestFont",
		"QuestFontNormalSmall",
		"QuestFontHighlight",
		"ItemTextFontNormal",
		"MailTextFontNormal",
		"SubSpellFont",
		"InvoiceTextFontNormal",
		"InvoiceTextFontSmall",
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
		if i == 1 then
			fs:SetPoint("TOPLEFT", frame, "TOPLEFT", 5, -5)
		elseif i == 21 then
			fs:SetPoint("TOPLEFT", frame, "TOP", 5, -5)
		else
			fs:SetPoint("TOPLEFT", last, "BOTTOMLEFT", 0, -4)
		end
		fs:SetText(font)
		if needbackground[font] then
			local tex = frame:CreateTexture(nil, "ARTWORK")
			tex:SetPoint("TOPLEFT", fs, -2, 2)
			tex:SetPoint("BOTTOM", fs, 0, -2)
			tex:SetWidth(150)
			tex:SetTexture("Interface\\ChatFrame\\ChatFrameBackground")
			tex:SetVertexColor(.8,.8,.8)
		end
		last = fs
	end

	self:SetScript("OnShow", nil)
end)

InterfaceOptions_AddCategory(frame)

LibStub("tekKonfig-AboutPanel").new("tekticles", "tekticles")
