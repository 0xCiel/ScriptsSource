local player = game:GetService("Players").LocalPlayer
local vim = game:GetService("VirtualInputManager")

local repo = "https://raw.githubusercontent.com/0xCiel/Obsidian/main/"
local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()
local Options = Library.Options
local Toggles = Library.Toggles
local Window = Library:CreateWindow({
    Title = "CIEL",
    Footer = "discord.gg/cielbasement",
    Icon = 17693908010,
    NotifySide = "Right",
    ShowCustomCursor = false,
    IconSize = UDim2.fromOffset(50, 50),
})

local Tabs = {
    Main = Window:AddTab("Main", "code"),
    ["UI Settings"] = Window:AddTab("UI Settings", "settings"),
}

local LeftGroupBox = Tabs.Main:AddLeftGroupbox("Main", "user")
LeftGroupBox:AddToggle("AutoSolver", {
    Text = "Auto",
    Default = false,
    Tooltip = "Auto",
    Callback = function(v)
        if v then
            local running = false
            local did = false
            local last = 0

            local ui = player.PlayerGui.GameUI.Container.GameSpace.DefaultUI.GameContainer.DesktopContainer.InfoFrameContainer.InfoFrame
            local box = ui.TextFrame
            local title = ui.Title

            local function solve()
                if not box then return false end

                local list = {}
                local ok = pcall(function()
                    for _, f in ipairs(box:GetChildren()) do
                        if f:IsA("Frame") and f.Name == "LetterFrame" and f.Visible then
                            local l = f:FindFirstChild("Letter"):FindFirstChildWhichIsA("TextLabel")
                            if l and l.Text ~= "" then
                                table.insert(list, { x = f.AbsolutePosition.X, c = l.Text:upper() })
                            end
                        end
                    end
                end)
                if not ok or #list == 0 then return false end

                table.sort(list, function(a, b) return a.x < b.x end)

                local s = {}
                for _, d in ipairs(list) do
                    s[#s + 1] = d.c
                end
                local key = table.concat(s)

                local pool = {}

                local ok1, r1 = pcall(function()
                    return request({ Url = "https://raw.githubusercontent.com/first20hours/google-10000-english/master/20k.txt", Method = "GET" })
                end)
                if ok1 and r1 then
                    for _, w in ipairs(string.split(r1.Body, "\n")) do
                        if w:upper():find(key, 1, true) then
                            pool[#pool + 1] = w
                        end
                    end
                end

                local ok2, r2 = pcall(function()
                    return request({ Url = "https://raw.githubusercontent.com/dolph/dictionary/master/enable1.txt", Method = "GET" })
                end)
                if ok2 and r2 then
                    for _, w in ipairs(string.split(r2.Body, "\n")) do
                        if w:upper():find(key, 1, true) then
                            pool[#pool + 1] = w
                        end
                    end
                end

                if #pool == 0 then return false end

                local word = pool[math.random(#pool)]

                return pcall(function()
                    for i = 1, #word do
                        local c = word:sub(i, i):upper()
                        local k = Enum.KeyCode[c]
                        if k then
                            vim:SendKeyEvent(true, k, false, game)
                            task.wait(math.random(Library.Options.MinTypeDelay.Value, Library.Options.MaxTypeDelay.Value) / 1000)
                            vim:SendKeyEvent(false, k, false, game)
                            task.wait(math.random(Library.Options.MinTypeDelay.Value, Library.Options.MaxTypeDelay.Value) / 1000)
                        end
                    end
                    task.wait(.1)
                    vim:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                    task.wait(.05)
                    vim:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
                end)
            end

            local function start()
                if running then return end
                running = true

                local text = "Quick! Type an English word containing:"
                local con

                local function check()
                    if not title then did = false return end

                    if not did and title.Text:find(text, 1, true) then
                        did = true
                        last = tick()
                        task.wait(.1)

                        if not solve() then
                            did = false
                        end
                    end
                end

                con = title:GetPropertyChangedSignal("Text"):Connect(check)

                task.spawn(function()
                    while running and Library.Toggles.AutoSolver.Value do
                        if not title.Text:find(text, 1, true) then
                            did = false
                        elseif did and tick() - last > Library.Options.RetryCooldown.Value then
                            did = false
                        end
                        task.wait(.5)
                    end
                    if con then con:Disconnect() end
                end)
            end

            start()
        end
    end
})



LeftGroupBox:AddSlider("MinTypeDelay", {
    Text = "Min Type Delay",
    Default = 10,
    Min = 1,
    Max = 500,
    Rounding = 1,
    Suffix = "ms",
})

LeftGroupBox:AddSlider("MaxTypeDelay", {
    Text = "Max Type Delay",
    Default = 50,
    Min = 1,
    Max = 500,
    Rounding = 1,
    Suffix = "ms",
})

LeftGroupBox:AddSlider("RetryCooldown", {
    Text = "Retry Cooldown",
    Default = 1,
    Min = 0.1,
    Max = 10,
    Rounding = 1,
    Suffix = "s",
})


-- UI Settings
local MenuGroup = Tabs["UI Settings"]:AddLeftGroupbox("Menu", "wrench")

MenuGroup:AddToggle("KeybindMenuOpen", {
	Default = Library.KeybindFrame.Visible,
	Text = "Open Keybind Menu",
	Callback = function(value)
		Library.KeybindFrame.Visible = value
	end,
})
MenuGroup:AddToggle("ShowCustomCursor", {
	Text = "Custom Cursor",
	Default = false,
	Callback = function(Value)
		Library.ShowCustomCursor = Value
	end,
})
MenuGroup:AddDropdown("NotificationSide", {
	Values = { "Left", "Right" },
	Default = "Right",

	Text = "Notification Side",

	Callback = function(Value)
		Library:SetNotifySide(Value)
	end,
})
MenuGroup:AddDropdown("DPIDropdown", {
	Values = { "50%", "75%", "100%", "125%", "150%", "175%", "200%" },
	Default = "100%",

	Text = "DPI Scale",

	Callback = function(Value)
		Value = Value:gsub("%%", "")
		local DPI = tonumber(Value)

		Library:SetDPIScale(DPI)
	end,
})
MenuGroup:AddDivider()
MenuGroup:AddLabel("Menu bind")
	:AddKeyPicker("MenuKeybind", { Default = "End", NoUI = true, Text = "Menu keybind" })
MenuGroup:AddButton("Unload", function()
    Library:Unload()
end)
Library.ToggleKeybind = Options.MenuKeybind
MenuGroup:AddToggle("KeybindPanel", {
    Text = "Keybinds Menu",
    Default = true,
    Callback = function(Value)
        Library.KeybindFrame.Visible = Value
    end
})
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
ThemeManager:SetFolder("SexHub")
SaveManager:SetFolder("SexHub/specific-game")
SaveManager:BuildConfigSection(Tabs["UI Settings"])
ThemeManager:ApplyToTab(Tabs["UI Settings"])
SaveManager:LoadAutoloadConfig()
Library:OnUnload(function()
    print("Unloaded!")
    Library.Unloaded = true
end)
Library:Notify("Fully Loaded!", 5)
