-- SavedVariables
LossOfControlAscensionDB = LossOfControlAscensionDB or {
    showRedLines = true,
    showBackground = true,
    abilityTextSize = 18,
    abilityTextOffsetY = 0,
    secondsTextSize = 18,
    secondsTextOffsetY = 0,
    iconSize = 42,

}

local function InitDB()
    if not LossOfControlAscensionDB then
        LossOfControlAscensionDB = {}
    end

    if LossOfControlAscensionDB.showRedLines == nil then
        LossOfControlAscensionDB.showRedLines = true
    end
    if LossOfControlAscensionDB.showBackground == nil then
        LossOfControlAscensionDB.showBackground = true
    end

    if LossOfControlAscensionDB.abilityTextSize == nil then
        LossOfControlAscensionDB.abilityTextSize = 18
    end
    if LossOfControlAscensionDB.abilityTextOffsetY == nil then
        LossOfControlAscensionDB.abilityTextOffsetY = 0
    end
    if LossOfControlAscensionDB.secondsTextSize == nil then
        LossOfControlAscensionDB.secondsTextSize = 20
    end
    if LossOfControlAscensionDB.secondsTextOffsetY == nil then
        LossOfControlAscensionDB.secondsTextOffsetY = 0
    end

    if LossOfControlAscensionDB.iconSize == nil then
        LossOfControlAscensionDB.iconSize = 42
    end

end

-------------------
-- Apply visuals --
-------------------
local function ApplyLoseControlVisuals()
    if not LoseControlFrame then return end

    if LoseControlFrame.blackBg then
        LoseControlFrame.blackBg:SetShown(LossOfControlAscensionDB.showBackground)
    end

    if LoseControlFrame.RedLineTop then
        LoseControlFrame.RedLineTop:SetShown(LossOfControlAscensionDB.showRedLines)
    end

    if LoseControlFrame.RedLineBottom then
        LoseControlFrame.RedLineBottom:SetShown(LossOfControlAscensionDB.showRedLines)
    end
end

local function ApplyLoseControlTextSizes()
    if not LoseControlFrame then return end

    if LoseControlFrame.AbilityName then
        local font, _, flags = LoseControlFrame.AbilityName:GetFont()
        LoseControlFrame.AbilityName:SetFont(font, LossOfControlAscensionDB.abilityTextSize, flags)
    end

    if LoseControlFrame.SecondsText then
        local font, _, flags = LoseControlFrame.SecondsText:GetFont()
        LoseControlFrame.SecondsText:SetFont(font, LossOfControlAscensionDB.secondsTextSize, flags)
    end
end

local function ApplyLoseControlTextOffsets()
    if not LoseControlFrame then return end

    local AbillityDefaultYOffset = 11
    if LoseControlFrame.AbilityName then
        LoseControlFrame.AbilityName:ClearAllPoints()
        LoseControlFrame.AbilityName:SetPoint("LEFT", LoseControlFrame.Icon, "RIGHT", 4, AbillityDefaultYOffset + LossOfControlAscensionDB.abilityTextOffsetY)
    end

    local TimerDefaultYOffset = -12
    if LoseControlFrame.SecondsText then
        LoseControlFrame.SecondsText:ClearAllPoints()
        LoseControlFrame.SecondsText:SetPoint("LEFT", LoseControlFrame.Icon, "RIGHT", 4, TimerDefaultYOffset + LossOfControlAscensionDB.secondsTextOffsetY)
    end
end

local function ApplyLoseControlIconSize()
    if not LoseControlFrame or not LoseControlFrame.Icon then return end

    local size = LossOfControlAscensionDB.iconSize
    LoseControlFrame.Icon:SetSize(size, size)
end

---------------------------------
-- Utilities for Options panel --
---------------------------------
local function CreateSliderValueText(slider)
    local valueText = slider:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
    valueText:SetPoint("TOP", slider, "BOTTOM", 0, -4)
    slider.ValueText = valueText
end

local function CreateCategoryTitle(parent, text, point, relativeFrame, offsetY)
    local title = parent:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    title:SetPoint("TOPLEFT", relativeFrame, "BOTTOMLEFT", 0, offsetY or -16)
    title:SetText(text)
    return title
end

-------------------
-- Options panel --
-------------------
local panel = CreateFrame("Frame", "LoseControlOptionsPanel", InterfaceOptionsFramePanelContainer)
panel.name = "LossOfControl Ascension Extended"

-- Title
local title = panel:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
title:SetPoint("TOPLEFT", 16, -16)
title:SetText("LossOfControl Ascension Extended")

-- General Section
local generalTitle = CreateCategoryTitle(panel, "General", "TOPLEFT", title, -24)
-- Red lines checkbox
--[[ local redLinesCheck = CreateFrame("CheckButton", "LoseControlRedLinesCheck", panel, "InterfaceOptionsCheckButtonTemplate")
redLinesCheck:SetPoint("TOPLEFT", generalTitle, "BOTTOMLEFT", 0, -16)
_G["LoseControlRedLinesCheckText"]:SetText("Show Red lines")
redLinesCheck:SetScript("OnClick", function(self)
    LossOfControlAscensionDB.showRedLines = self:GetChecked() == 1
    ApplyLoseControlVisuals()
end) ]]
-- Background checkbox
--[[ local backgroundCheck = CreateFrame("CheckButton", "LoseControlBackgroundCheck", panel, "InterfaceOptionsCheckButtonTemplate")
backgroundCheck:SetPoint("TOPLEFT", redLinesCheck, "BOTTOMLEFT", 0, -8)
_G["LoseControlBackgroundCheckText"]:SetText("Show background")
backgroundCheck:SetScript("OnClick", function(self)
    LossOfControlAscensionDB.showBackground = self:GetChecked() == 1
    ApplyLoseControlVisuals()
end) ]]

-- Abillity Section
local abilityTitle = CreateCategoryTitle(panel, "Ability Text", "TOPLEFT", backgroundCheck, -24)
-- Abillity Size
local abilitySlider = CreateFrame("Slider", "LoseControlAbilityTextSizeSlider", panel, "OptionsSliderTemplate")
abilitySlider:SetPoint("TOPLEFT", abilityTitle, "BOTTOMLEFT", 0, -24)
abilitySlider:SetMinMaxValues(10, 30)
abilitySlider:SetValueStep(1)
_G["LoseControlAbilityTextSizeSliderText"]:SetText("Size")
_G["LoseControlAbilityTextSizeSliderLow"]:SetText("10")
_G["LoseControlAbilityTextSizeSliderHigh"]:SetText("30")
CreateSliderValueText(abilitySlider)
abilitySlider:SetScript("OnValueChanged", function(self, value)
    value = math.floor(value + 0.5)
    LossOfControlAscensionDB.abilityTextSize = value
    self.ValueText:SetFormattedText("%d px", value)
    ApplyLoseControlTextSizes()
end)
-- Ability OffsetY
local abilityOffsetSlider = CreateFrame("Slider", "LoseControlAbilityOffsetSlider", panel, "OptionsSliderTemplate")
abilityOffsetSlider:SetPoint("TOPLEFT", abilityTitle, "BOTTOMLEFT", 180, -24)
abilityOffsetSlider:SetMinMaxValues(-5, 5)
abilityOffsetSlider:SetValueStep(1)
_G["LoseControlAbilityOffsetSliderText"]:SetText("Y offset")
_G["LoseControlAbilityOffsetSliderLow"]:SetText("-5")
_G["LoseControlAbilityOffsetSliderHigh"]:SetText("5")
CreateSliderValueText(abilityOffsetSlider)
abilityOffsetSlider:SetScript("OnValueChanged", function(self, value)
    value = math.floor(value + 0.5)
    LossOfControlAscensionDB.abilityTextOffsetY = value
    self.ValueText:SetFormattedText("%d px", value)
    ApplyLoseControlTextOffsets()
end)


-- Timer Section
local timerTitle = CreateCategoryTitle(panel, "Timer Text", "TOPLEFT", abilitySlider, -36)
-- Timer Size
local secondsSlider = CreateFrame( "Slider", "LoseControlSecondsTextSizeSlider", panel, "OptionsSliderTemplate")
secondsSlider:SetPoint("TOPLEFT", timerTitle, "BOTTOMLEFT", 0, -24)
secondsSlider:SetMinMaxValues(10, 30)
secondsSlider:SetValueStep(1)
_G["LoseControlSecondsTextSizeSliderText"]:SetText("Size")
_G["LoseControlSecondsTextSizeSliderLow"]:SetText("10")
_G["LoseControlSecondsTextSizeSliderHigh"]:SetText("30")
CreateSliderValueText(secondsSlider)
secondsSlider:SetScript("OnValueChanged", function(self, value)
    value = math.floor(value + 0.5)
    LossOfControlAscensionDB.secondsTextSize = value
    self.ValueText:SetFormattedText("%d px", value)
    ApplyLoseControlTextSizes()
end)
-- Timer OffsetY
local secondsOffsetSlider = CreateFrame("Slider", "LoseControlSecondsOffsetSlider", panel, "OptionsSliderTemplate")
secondsOffsetSlider:SetPoint("TOPLEFT", timerTitle, "BOTTOMLEFT", 180, -24)
secondsOffsetSlider:SetMinMaxValues(-5, 5)
secondsOffsetSlider:SetValueStep(1)
_G["LoseControlSecondsOffsetSliderText"]:SetText("Y offset")
_G["LoseControlSecondsOffsetSliderLow"]:SetText("-5")
_G["LoseControlSecondsOffsetSliderHigh"]:SetText("5")
CreateSliderValueText(secondsOffsetSlider)
secondsOffsetSlider:SetScript("OnValueChanged", function(self, value)
    value = math.floor(value + 0.5)
    LossOfControlAscensionDB.secondsTextOffsetY = value
    self.ValueText:SetFormattedText("%d px", value)
    ApplyLoseControlTextOffsets()
end)



-- Icon Section
local iconTitle = CreateCategoryTitle(panel, "Icon", "TOPLEFT", secondsSlider, -36)
-- Icon Size
--[[ local iconSlider = CreateFrame( "Slider", "LoseControlIconSizeSlider", panel, "OptionsSliderTemplate")
iconSlider:SetPoint("TOPLEFT", iconTitle, "BOTTOMLEFT", 0, -24)
iconSlider:SetMinMaxValues(24, 64)
iconSlider:SetValueStep(1)
_G["LoseControlIconSizeSliderText"]:SetText("Size")
_G["LoseControlIconSizeSliderLow"]:SetText("24")
_G["LoseControlIconSizeSliderHigh"]:SetText("64")
CreateSliderValueText(iconSlider)
iconSlider:SetScript("OnValueChanged", function(self, value)
    value = math.floor(value + 0.5)
    LossOfControlAscensionDB.iconSize = value
    self.ValueText:SetFormattedText("%d px", value)
    ApplyLoseControlIconSize()
end) ]]


-- Sync state when panel opens
panel:SetScript("OnShow", function()
    -- redLinesCheck:SetChecked(LossOfControlAscensionDB.showRedLines and true or false)
    -- backgroundCheck:SetChecked(LossOfControlAscensionDB.showBackground and true or false)
    abilitySlider:SetValue(LossOfControlAscensionDB.abilityTextSize)
    abilitySlider.ValueText:SetFormattedText("%d px", LossOfControlAscensionDB.abilityTextSize)
    abilityOffsetSlider:SetValue(LossOfControlAscensionDB.abilityTextOffsetY)
    abilityOffsetSlider.ValueText:SetFormattedText("%d px", LossOfControlAscensionDB.abilityTextOffsetY)
    secondsSlider:SetValue(LossOfControlAscensionDB.secondsTextSize)
    secondsSlider.ValueText:SetFormattedText("%d px", LossOfControlAscensionDB.secondsTextSize)
    secondsOffsetSlider:SetValue(LossOfControlAscensionDB.secondsTextOffsetY)
    secondsOffsetSlider.ValueText:SetFormattedText("%d px", LossOfControlAscensionDB.secondsTextOffsetY)
    -- iconSlider:SetValue(LossOfControlAscensionDB.iconSize)
    -- iconSlider.ValueText:SetFormattedText("%d px", LossOfControlAscensionDB.iconSize)
end)

InterfaceOptions_AddCategory(panel)


--------------------
-- Apply on login --
--------------------
local f = CreateFrame("Frame")
f:RegisterEvent("VARIABLES_LOADED")
f:RegisterEvent("PLAYER_LOGIN")

f:SetScript("OnEvent", function(self, event)
    if event == "VARIABLES_LOADED" then
        InitDB()
    elseif event == "PLAYER_LOGIN" then
        -- ApplyLoseControlVisuals()
        ApplyLoseControlTextSizes()
        ApplyLoseControlTextOffsets()
        -- ApplyLoseControlIconSize()
    end
end)
