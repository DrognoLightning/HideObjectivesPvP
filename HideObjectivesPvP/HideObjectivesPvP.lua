local frame = CreateFrame("Frame");
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:RegisterEvent("UPDATE_BATTLEFIELD_STATUS")
frame:RegisterEvent("PLAYER_LEAVING_WORLD")

local function eventHandler(self, event, ...)
  if event == "UPDATE_BATTLEFIELD_STATUS" then
    local status = GetBattlefieldStatus(1)
    if status == "active" then
        ObjectiveTrackerFrame:Hide()
    end
  elseif event == "PLAYER_LEAVING_WORLD" then
    ObjectiveTrackerFrame:Show()
  elseif event == "PLAYER_ENTERING_WORLD" then
    local status = GetBattlefieldStatus(1)
    if status == "none" then
        ObjectiveTrackerFrame:Show()
    end
  end
end

frame:SetScript("OnEvent", eventHandler)