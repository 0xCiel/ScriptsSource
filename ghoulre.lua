--[[
Ignore all the shit ass codes, just didn't bother taking it seriously and I was kind of a newgen with roblox scripting

The Auto Parry Animations isn't mine, I just stole it from some hub i forgot

I removed Player ESP and Morphs out of respect to the original creators of it

Feel free to use this shitty source on your project or anything else
]]


repeat
    wait()
until game:IsLoaded()
print("Game Loaded")
repeat
    task.wait()
until game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
print("Character loaded")
local repo = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/'
local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()
local Window =
    Library:CreateWindow(
    {
        Title = "Sex Ghoul://RE | discord.gg/cielbasement | Open source",
        Center = true,
        AutoShow = true,
        TabPadding = 8
    }
)
local Tabs = {
    PlayerTab = Window:AddTab("Players"),
    WorldTab = Window:AddTab("World"),
    VisualTab = Window:AddTab("Visual"),
    MiscTab = Window:AddTab("Miscs"),
    ["UI Settings"] = Window:AddTab("UI Settings")
}
local PlayersGroup = Tabs.PlayerTab:AddLeftGroupbox("< Local Player >")
local AutoParryGroup = Tabs.PlayerTab:AddRightGroupbox("< Auto Parry >")
local CameraGroup = Tabs.PlayerTab:AddRightGroupbox("< Camera >")
local WorldGroup = Tabs.WorldTab:AddLeftGroupbox("< Main >")
local ESPGroup = Tabs.VisualTab:AddLeftGroupbox("< ESP >")
local VisualMiscGroup = Tabs.VisualTab:AddRightGroupbox("< Miscs >")
local MiscGroup = Tabs.MiscTab:AddLeftGroupbox("< Main >")

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local VIM = game:GetService("VirtualInputManager")
local Lighting = game:GetService("Lighting")
local http = game:GetService("HttpService")
local Camera = workspace.CurrentCamera
local GuiService = game:GetService("GuiService")
local TeleportService = game:GetService("TeleportService")

local MainVariables = {
    noanims = false,
    flying = false,
    noclip = false,
    flyingSpeed = 100,
    speedhack = false,
    speedhackWalkSpeed = 100,
    infJump = false,
    infjumpheight = 50,
    VoidMob = false,
    AutoLoot = false,
    Autoparry = false,
    AutoParryAdjustToPing = false,
    autorollcancel = false,
    ModNotifer = false,
    kickifmod = false,
    killaurahp = 100,
    killauraifcreds = false,
    autofarmplayers = false,
    fullbright = false,
    Brightness = 0,
    spectateplayers = false,
    autoloot = false,
    autofragment = false,
    fpsunlocker = false,
    aimbotEnabled = false,
    aimbotPlayers = false,
    aimbotMobs = false,
    aimbotVisible = false,
    aimbotFOV = 45,
    aimbotMode = "Toggle",
    aimbotActive = false,
    showFov = false,
    aimbotXOffset = 0,
    aimbotYOffset = 0,
    bringmobs = false,
    bringmobsrange = 1000,
    bringmobsdistance = 50,
    fovchanger = false,
    CameraFOV = 70,
    bypassSpeed = false,
    autogrip = false,
    autoequip = false,
    autocrit = false,
    autoswing = false,
    autouppercut = false,
    autoperfectroll = false,
}

local autoParryConfig = {
    ["rbxassetid://73909511758220"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://77200481731064"] = {
        Delay = 350,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://81343624564970"] = {
        Delay = 180,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://90222174246856"] = {
        Delay = 350,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://120591268956676"] = {
        Delay = 180,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://72026342966670"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://123559289828864"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://109153497237538"] = {
        Delay = 250,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://73200908069196"] = {
        Delay = 180,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 1,
        RepeatDelay = 200
    },
    ["rbxassetid://140176432457093"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://77165655925697"] = {
        Delay = 350,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://136182618554502"] = {
        Delay = 180,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://129436447203162"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://123196114390104"] = {
        Delay = 350,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://120703912197833"] = {
        Delay = 180,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://111637306541526"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://79780873512551"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://91417655657970"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://124496925241237"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://97888761442444"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://130254051363204"] = {
        Delay = 350,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://110920960051584"] = {
        Delay = 200,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0,
        Hold = true
    },
    ["rbxassetid://133676778221315"] = {
        Delay = 500,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://111882127396652"] = {
        Delay = 250,
        Parryable = true,
        MultiHit = false,
        Range = 40,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://79981588130961"] = {
        Delay = 350,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://138044545828371"] = {
        Delay = 300,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://112387369480518"] = {
        Delay = 220,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://120459951639400"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://121050000257819"] = {
        Delay = 120,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://116301245600177"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://78213991536260"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://88929119667129"] = {
        Delay = 250,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0,
        Hold = true
    },
    ["rbxassetid://124170657036313"] = {
        Delay = 600,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://82184472713821"] = {
        Delay = 2000,
        Parryable = true,
        MultiHit = false,
        Range = 40,
        RepeatCount = 0,
        RepeatDelay = 0,
        Hold = true
    },
    ["rbxassetid://96875568331308"] = {
        Delay = 250,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://103629114814061"] = {
        Delay = 250,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://122371661060085"] = {
        Delay = 250,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://136330405034599"] = {
        Delay = 250,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://84687276916489"] = {
        Delay = 250,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://124861357738478"] = {
        Delay = 250,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://113483328429065"] = {
        Delay = 390,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://96240580568749"] = {
        Delay = 250,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 1,
        RepeatDelay = 200
    },
    ["rbxassetid://78297239425049"] = {
        Delay = 250,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://134047638406873"] = {
        Delay = 250,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://106306160427852"] = {
        Delay = 250,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://110738231926426"] = {
        Delay = 250,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://107500740429380"] = {
        Delay = 550,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://113373203557133"] = {
        Delay = 300,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://109285759428857"] = {
        Delay = 520,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://97485727762508"] = {
        Delay = 520,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://135835813606350"] = {
        Delay = 350,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://103561209301954"] = {
        Delay = 350,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://139400282938724"] = {
        Delay = 350,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://98357517858626"] = {
        Delay = 600,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://84286984142876"] = {
        Delay = 300,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://102453919149515"] = {
        Delay = 550,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://126923665753961"] = {
        Delay = 300,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://87070202310860"] = {
        Delay = 650,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://130405818992714"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://98283641519215"] = {
        Delay = 670,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://92937790229658"] = {
        Delay = 550,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://101521677894258"] = {
        Delay = 500,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://127566287157805"] = {
        Delay = 400,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://98960600377850"] = {
        Delay = 600,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://128625727833366"] = {
        Delay = 450,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://87764692704657"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://125123147660993"] = {
        Delay = 140,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://139753135160439"] = {
        Delay = 240,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://105184330766070"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://95223978004602"] = {
        Delay = 350,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://107868355016077"] = {
        Delay = 1840,
        Parryable = true,
        MultiHit = false,
        Range = 40,
        RepeatCount = 0,
        RepeatDelay = 0,
        Hold = true
    },
    ["rbxassetid://95150289594302"] = {
        Delay = 270,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://119570344423009"] = {
        Delay = 130,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://73760371893091"] = {
        Delay = 130,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://137309504999398"] = {
        Delay = 120,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://80560734051179"] = {
        Delay = 110,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://124747961486333"] = {
        Delay = 250,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://96651052503322"] = {
        Delay = 0,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://136225630152817"] = {
        Delay = 190,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://140472353306379"] = {
        Delay = 630,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0,
        Hold = true
    },
    ["rbxassetid://126485913058460"] = {
        Delay = 450,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0,
        Hold = true,
        RepeatParryAmount = 5,
        RepeatParryDelay = 600
    },
    ["rbxassetid://87277155207058"] = {
        Delay = 110,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://135309318514442"] = {
        Delay = 300,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://96389761265228"] = {
        Delay = 330,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://127462812873675"] = {
        Delay = 30,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://107752838734051"] = {
        Delay = 800,
        Parryable = true,
        MultiHit = false,
        Range = 35,
        RepeatCount = 0,
        RepeatDelay = 0,
        Hold = true,
        RepeatParryAmount = 1,
        RepeatParryDelay = 1000
    },
    ["rbxassetid://134903538230160"] = {
        Delay = 300,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0,
        RepeatParryAmount = 1,
        RepeatParryDelay = 300
    },
    ["rbxassetid://103430086615689"] = {
        Delay = 250,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://133200348314646"] = {
        Delay = 250,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://137072596301637"] = {
        Delay = 250,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://104346885061572"] = {
        Delay = 170,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://135552671823399"] = {
        Delay = 0,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://90460084897725"] = {
        Delay = 400,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0,
        RepeatParryAmount = 1,
        RepeatParryDelay = 400
    },
    ["rbxassetid://109184942183064"] = {
        Delay = 430,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://83022911727660"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://81458429848274"] = {
        Delay = 0,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://131051682278134"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://109123230222277"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://89588139226485"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://137684196851746"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://87735609876920"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://131385671108953"] = {
        Delay = 350,
        Parryable = true,
        MultiHit = false,
        Range = 40,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://132546734612246"] = {
        Delay = 200,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0,
        Hold = true
    },
    ["rbxassetid://98385414593823"] = {
        Delay = 170,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://102642995643169"] = {
        Delay = 350,
        Parryable = true,
        MultiHit = false,
        Range = 40,
        RepeatCount = 0,
        RepeatDelay = 0,
        RepeatParryAmount = 1,
        RepeatParryDelay = 400
    },
    ["rbxassetid://125810707684008"] = {
        Delay = 300,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://124926828571060"] = {
        Delay = 600,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://119850347232500"] = {
        Delay = 600,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://91554414015826"] = {
        Delay = 400,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://103463736964630"] = {
        Delay = 500,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://95010299561530"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://98771209216846"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://134132208906469"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://110368664835385"] = {
        Delay = 230,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://114986752830080"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://131161290739036"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://106519942311504"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://139299396702735"] = {
        Delay = 230,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://126141375680416"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://122661360698160"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://135750505225960"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://123392788492194"] = {
        Delay = 230,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://104337999454796"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://77317789467088"] = {
        Delay = 200,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://107364098903611"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://110164563494809"] = {
        Delay = 230,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://125084555032360"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://97110277579383"] = {
        Delay = 230,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://106731070269238"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://75078726065204"] = {
        Delay = 450,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://130277667485774"] = {
        Delay = 0,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://115413666205678"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://129495651539604"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://101523256677778"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://128839194087258"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://76467866872093"] = {
        Delay = 180,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://78887381717473"] = {
        Delay = 410,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://130687440100798"] = {
        Delay = 240,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://110240097445732"] = {
        Delay = 170,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://118233181584094"] = {
        Delay = 220,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://78854925472750"] = {
        Delay = 200,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://125985327613003"] = {
        Delay = -50,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://83183690291105"] = {
        Delay = 200,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://139358065129445"] = {
        Delay = 200,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://128101625557631"] = {
        Delay = 200,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://137780787423425"] = {
        Delay = 330,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://134809434589356"] = {
        Delay = 450,
        Parryable = true,
        MultiHit = false,
        Range = 35,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://105589945317363"] = {
        Delay = 860,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://115126886859402"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://116238600074144"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://77659049501128"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://82130174183873"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://134101600310736"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://125001482194702"] = {
        Delay = 250,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://130077418131222"] = {
        Delay = 350,
        Parryable = true,
        MultiHit = false,
        Range = 45,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://78047711237192"] = {
        Delay = 400,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://76927396984144"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://124343869615532"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://94205575550862"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://124184099417502"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://102683625069547"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://132904283786634"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://76639298017828"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://91532107165998"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://134872805405567"] = {
        Delay = 300,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://129368863744217"] = {
        Delay = 300,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0,
        RepeatParryAmount = 1,
        RepeatParryDelay = 400
    },
    ["rbxassetid://110583793495632"] = {
        Delay = 50,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://106867803794428"] = {
        Delay = 220,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://100434572913975"] = {
        Delay = 220,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://134071135239015"] = {
        Delay = 220,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://90521401898889"] = {
        Delay = 220,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://108307424389592"] = {
        Delay = 220,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://130560592953206"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://99915059516084"] = {
        Delay = 300,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://101613783270135"] = {
        Delay = 200,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 1,
        RepeatDelay = 200
    },
    ["rbxassetid://72678012629652"] = {
        Delay = 220,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://97870196303383"] = {
        Delay = 1150,
        Parryable = true,
        MultiHit = false,
        Range = 35,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://99762577752557"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://126074016457313"] = {
        Delay = 250,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://88694211921073"] = {
        Delay = 250,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://131297557817293"] = {
        Delay = 250,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://103255608932910"] = {
        Delay = 250,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://117434170736698"] = {
        Delay = 250,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://122675079330408"] = {
        Delay = 600,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://75362717367704"] = {
        Delay = 350,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://91066171406248"] = {
        Delay = 350,
        Parryable = true,
        MultiHit = false,
        Range = 35,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://125273732099482"] = {
        Delay = 220,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://119065419146950"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://136761323860583"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://127813492491875"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://134741686910618"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://103983986351361"] = {
        Delay = 280,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://98178166706006"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://135205073126877"] = {
        Delay = 250,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://107287988363428"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://76272752426300"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://82068830027727"] = {
        Delay = 250,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://87492498431491"] = {
        Delay = 280,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://104802848622022"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://92214982692498"] = {
        Delay = 250,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://114579951667352"] = {
        Delay = 280,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://77780360064182"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://109500654652931"] = {
        Delay = 250,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://122049582999621"] = {
        Delay = 280,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://102372557046570"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://90597596100338"] = {
        Delay = 250,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://128106238874291"] = {
        Delay = 300,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://102546483231226"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://120830339429568"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://79913467941771"] = {
        Delay = 400,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0,
        Hold = true
    },
    ["rbxassetid://99511332362280"] = {
        Delay = 730,
        Parryable = true,
        MultiHit = false,
        Range = 45,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://118816187211996"] = {
        Delay = 220,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://122454882730691"] = {
        Delay = 220,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://102535173492586"] = {
        Delay = 220,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://86370715406171"] = {
        Delay = 220,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://94300503125812"] = {
        Delay = 220,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://100558480169185"] = {
        Delay = 200,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://131740708909971"] = {
        Delay = 400,
        Parryable = true,
        MultiHit = false,
        Range = 36,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://108197299905495"] = {
        Delay = 220,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://114558724693893"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://72464788731730"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://74422320699083"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://98582715122328"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://105442988085026"] = {
        Delay = 300,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0,
        RepeatParryAmount = 1,
        RepeatParryDelay = 400,
        Hold = true
    },
    ["rbxassetid://80201031269662"] = {
        Delay = 500,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://111909089248577"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://99963342174936"] = {
        Delay = 190,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 2,
        RepeatDelay = 200
    },
    ["rbxassetid://123123044774364"] = {
        Delay = 120,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://108458212372937"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://134488256445396"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://78797347094985"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://92415288342537"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://93902031289683"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://129441247864879"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://97138435604112"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://106461888875800"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://86232832931002"] = {
        Delay = 200,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://86086892466510"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://119912107937230"] = {
        Delay = 370,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://102288540818350"] = {
        Delay = 300,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://131696285162463"] = {
        Delay = 400,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://89816763320681"] = {
        Delay = 600,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0,
        Hold = true
    },
    ["rbxassetid://101714150006632"] = {
        Delay = 300,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://93419864791125"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://120819611310918"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://88509112744612"] = {
        Delay = 760,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://136400690344027"] = {
        Delay = 0,
        Parryable = true,
        MultiHit = false,
        Range = 20,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://121109139209671"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 1,
        RepeatDelay = 200
    },
    ["rbxassetid://120354402053029"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://108012620140199"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://131074884814797"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://87004016130630"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://131725694254635"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://125049330153289"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://71491979500146"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://116706902543424"] = {
        Delay = 430,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://123728918222864"] = {
        Delay = 300,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://124766932801835"] = {
        Delay = 0,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0,
        Hold = true
    },
    ["rbxassetid://87087952781021"] = {
        Delay = 550,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://90448243904946"] = {
        Delay = 600,
        Parryable = true,
        MultiHit = false,
        Range = 45,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://106535138040115"] = {
        Delay = 500,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0,
        Hold = true
    },
    ["rbxassetid://125415359989914"] = {
        Delay = 660,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://124819625937751"] = {
        Delay = 200,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0,
        Hold = true
    },
    ["rbxassetid://76399640175696"] = {
        Delay = 300,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://138228123826571"] = {
        Delay = 250,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://114126220009836"] = {
        Delay = 210,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://115882469124985"] = {
        Delay = 210,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://120664443221590"] = {
        Delay = 210,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://108646132311038"] = {
        Delay = 210,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://105107078372382"] = {
        Delay = 350,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://113848079779223"] = {
        Delay = 140,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://70738136253672"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://94049296655188"] = {
        Delay = 1300,
        Parryable = true,
        MultiHit = false,
        Range = 35,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://138484499722859"] = {
        Delay = 300,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://115340718314209"] = {
        Delay = 300,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://129618429137267"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://114773679703806"] = {
        Delay = 250,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://86208887161745"] = {
        Delay = 250,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://125756826659861"] = {
        Delay = 250,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://102242322759462"] = {
        Delay = 250,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://118696475800411"] = {
        Delay = 250,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://135872625391687"] = {
        Delay = 300,
        Parryable = true,
        MultiHit = false,
        Range = 40,
        RepeatCount = 0,
        RepeatDelay = 0,
        Hold = true,
        RepeatParryAmount = 1,
        RepeatParryDelay = 300
    },
    ["rbxassetid://124960892283230"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://74706986010083"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://126930390220804"] = {
        Delay = 200,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://134473609101433"] = {
        Delay = 300,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0,
        RepeatParryAmount = 1,
        RepeatParryDelay = 400
    },
    ["rbxassetid://127376055093534"] = {
        Delay = 600,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://75082454798619"] = {
        Delay = 250,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://75375865302458"] = {
        Delay = 600,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://123818970722547"] = {
        Delay = 300,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0,
        RepeatParryAmount = 1,
        RepeatParryDelay = 300
    },
    ["rbxassetid://138545708561292"] = {
        Delay = 230,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://111230499786651"] = {
        Delay = 170,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://135652259836955"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://135900749451957"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://81633765878584"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://108984564775659"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://74877124260548"] = {
        Delay = 250,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://106257688932263"] = {
        Delay = 650,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://112467136433884"] = {
        Delay = 150,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://116952479079386"] = {
        Delay = 630,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 6,
        RepeatDelay = 200,
        Hold = true
    },
    ["rbxassetid://99157378634706"] = {
        Delay = 180,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    ["rbxassetid://136449717558100"] = {
        Delay = 140,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    --TAKIZAWA1

    --CRIT
    ["rbxassetid://135207502419237"] = {
        Delay = 400,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    --Dance
    ["rbxassetid://120259747831957"] = {
        Delay = 1800,
        Parryable = true,
        MultiHit = false,
        Range = 30,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    --Blitz
    ["rbxassetid://136641282446354"] = {
        Delay = 1200,
        Parryable = false,
        MultiHit = false,
        Range = 50,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    --Blitz Feint
    ["rbxassetid://80342660237834"] = {
        Delay = 750,
        Parryable = true,
        MultiHit = false,
        Range = 50,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    --sadistic dance
    ["rbxassetid://123704785794118"] = {
        Delay = 500,
        Parryable = true,
        MultiHit = true,
        Range = 50,
        RepeatCount = 3,
        RepeatDelay = 300
    },
    --Swing1
    ["rbxassetid://73319481678482"] = {
        Delay = 600,
        Parryable = true,
        MultiHit = false,
        Range = 50,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    --Swing2
    ["rbxassetid://107934946852201"] = {
        Delay = 550,
        Parryable = true,
        MultiHit = false,
        Range = 50,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    --Swing3
    ["rbxassetid://135898238795346"] = {
        Delay = 500,
        Parryable = true,
        MultiHit = false,
        Range = 50,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    --Swing4
    ["rbxassetid://120741003942852"] = {
        Delay = 500,
        Parryable = true,
        MultiHit = false,
        Range = 50,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    --Swing5
    ["rbxassetid://73480352291165"] = {
        Delay = 500,
        Parryable = true,
        MultiHit = false,
        Range = 50,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    --TakizawaStage1
    --Areal Cancel
    ["rbxassetid://139086739426590"] = {
        Delay = 750,
        Parryable = true,
        MultiHit = false,
        Range = 50,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    --Silent Impact
    ["rbxassetid://128650604729435"] = {
        Delay = 500,
        Parryable = true,
        MultiHit = false,
        Range = 50,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    --takizawa stage2
    --Arerial crit
    ["rbxassetid://82900331340803"] = {
        Delay = 700,
        Parryable = false,
        MultiHit = false,
        Range = 50,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    --maruadi 3
    ["rbxassetid://72662379371809"] = {
        Delay = 500,
        Parryable = false,
        MultiHit = false,
        Range = 50,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    --newcPart2
    ["rbxassetid://76680580465447"] = {
        Delay = 500,
        Parryable = true,
        MultiHit = false,
        Range = 50,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    -- ETO V2
    --clawing pounce
    ["rbxassetid://72798299659280"] = {
        Delay = 700,
        Parryable = false,
        MultiHit = false,
        Range = 50,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    --clawing pounce cast
    ["rbxassetid://118924333638893"] = {
        Delay = 1000,
        Parryable = false,
        MultiHit = false,
        Range = 50,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    --crit 2
    ["rbxassetid://83691818071163"] = {
        Delay = 700,
        Parryable = false,
        MultiHit = true,
        Range = 50,
        RepeatCount = 2,
        RepeatDelay = 200
    },
    --swing1
    ["rbxassetid://82528260253305"] = {
        Delay = 650,
        Parryable = true,
        MultiHit = false,
        Range = 50,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    --swing2
    ["rbxassetid://102445468244138"] = {
        Delay = 650,
        Parryable = true,
        MultiHit = false,
        Range = 50,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    --swing3
    ["rbxassetid://139919975605872"] = {
        Delay = 600,
        Parryable = true,
        MultiHit = false,
        Range = 50,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    --swing4
    ["rbxassetid://123543445163800"] = {
        Delay = 700,
        Parryable = true,
        MultiHit = false,
        Range = 50,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    --swing5
    ["rbxassetid://75292643761800"] = {
        Delay = 250,
        Parryable = true,
        MultiHit = false,
        Range = 50,
        RepeatCount = 2,
        RepeatDelay = 100
    },
    --ambus
    ["rbxassetid://83497963716622"] = {
        Delay = 500,
        Parryable = true,
        MultiHit = true,
        Range = 50,
        RepeatCount = 10,
        RepeatDelay = 100
    },
    --frenzyv2
    --swing1
    ["rbxassetid://90569570699828"] = {
        Delay = 750,
        Parryable = true,
        MultiHit = false,
        Range = 50,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    --swing2
    ["rbxassetid://86176364287625"] = {
        Delay = 600,
        Parryable = true,
        MultiHit = false,
        Range = 50,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    --swing3
    ["rbxassetid://104648794624547"] = {
        Delay = 750,
        Parryable = true,
        MultiHit = false,
        Range = 50,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    --swing4
    ["rbxassetid://125608535553115"] = {
        Delay = 700,
        Parryable = true,
        MultiHit = false,
        Range = 50,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    --swing5
    ["rbxassetid://131653409763212"] = {
        Delay = 500,
        Parryable = true,
        MultiHit = false,
        Range = 50,
        RepeatCount = 0,
        RepeatDelay = 0
    },

    --beaked v2
    --crit
    ["rbxassetid://131442938695981"] = {
        Delay = 900,
        Parryable = true,
        MultiHit = false,
        Range = 50,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    --slam
    ["rbxassetid://123727511642989"] = {
        Delay = 600,
        Parryable = true,
        MultiHit = false,
        Range = 50,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    --slamfeint
    ["rbxassetid://110619255719303"] = {
        Delay = 1000,
        Parryable = false,
        MultiHit = false,
        Range = 50,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    --shield slam
    ["rbxassetid://83748907427260"] = {
        Delay = 700,
        Parryable = true,
        MultiHit = false,
        Range = 50,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    --shield throw
    ["rbxassetid://94946484791547"] = {
        Delay = 600,
        Parryable = true,
        MultiHit = false,
        Range = 100,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    --shield slamm2
    ["rbxassetid://77368757687748"] = {
        Delay = 200,
        Parryable = false,
        MultiHit = false,
        Range = 100,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    --swing1
    ["rbxassetid://104722560930205"] = {
        Delay = 600,
        Parryable = true,
        MultiHit = false,
        Range = 100,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    --swing2
    ["rbxassetid://101138797487568"] = {
        Delay = 650,
        Parryable = true,
        MultiHit = false,
        Range = 100,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    --swing3
    ["rbxassetid://108769432958516"] = {
        Delay = 550,
        Parryable = true,
        MultiHit = false,
        Range = 100,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    --swing4
    ["rbxassetid://85467164225058"] = {
        Delay = 700,
        Parryable = true,
        MultiHit = false,
        Range = 100,
        RepeatCount = 0,
        RepeatDelay = 0
    },
    --swing5
    ["rbxassetid://121339998382547"] = {
        Delay = 730,
        Parryable = true,
        MultiHit = false,
        Range = 100,
        RepeatCount = 0,
        RepeatDelay = 0
    },
}

--Main Functions
local function coords(x, y, z) --yes I know there's better way to do this but I just followed a format I did on my runeslayer script
    local args = {
        [1] = {
            [1] = {
                ["Module"] = "Dash"
            },
            [2] = "\5"
        }
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Bridgenet2Main"):WaitForChild("dataRemoteEvent"):FireServer(
        unpack(args)
    )
    game.Players.LocalPlayer.Character.PrimaryPart.CFrame = CFrame.new(x, y, z)
end
local function serverhop()
    local ServersUrl = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
    local Server, Next = nil, nil

    local function ListServers(cursor)
        local Raw = game:HttpGet(ServersUrl .. ((cursor and "&cursor=" .. cursor) or ""))
        return http:JSONDecode(Raw)
    end

    repeat
        local Servers = ListServers(Next)
        Server = Servers.data[math.random(1, (#Servers.data / 3))]
        Next = Servers.nextPageCursor

        if Server and Server.playing < Server.maxPlayers and Server.id ~= game.JobId then
            TeleportService:TeleportToPlaceInstance(game.PlaceId, Server.id, game.Players.LocalPlayer)
            return
        end
    until not Next
    warn("No suitable server found, retrying...")
    serverhop()
end

local function Teleport(targetCFrame, speed)
    local character = game.Players.LocalPlayer.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then
        return
    end

    local hrp = character.HumanoidRootPart
    local startCFrame = hrp.CFrame
    local startTime = tick()
    local distance = (startCFrame.Position - targetCFrame.Position).Magnitude
    local duration = distance / speed
    hrp.AssemblyLinearVelocity = Vector3.new()
    hrp.AssemblyAngularVelocity = Vector3.new()

    local connection
    connection =
        game:GetService("RunService").RenderStepped:Connect(
        function()
            local elapsed = tick() - startTime
            if elapsed >= duration then
                hrp.AssemblyLinearVelocity = Vector3.new()
                hrp.AssemblyAngularVelocity = Vector3.new()
                hrp.CFrame = targetCFrame
                connection:Disconnect()
            else
                local alpha = elapsed / duration
                local newCFrame = startCFrame:Lerp(targetCFrame, alpha)
                hrp.AssemblyLinearVelocity = Vector3.new()
                hrp.AssemblyAngularVelocity = Vector3.new()
                hrp.CFrame = newCFrame
            end
        end
    )
end

--another bullshits
local speedhackvelocity
local humanoidRoot
local coordinate
local humanoid
local characterAddedConnection
local function addBV()
    local character = game.Players.LocalPlayer.Character
    if not speedhackvelocity or not speedhackvelocity.Parent then
        speedhackvelocity = Instance.new("BodyVelocity")
        speedhackvelocity.Velocity = Vector3.new(0, 0, 0)
        speedhackvelocity.MaxForce = Vector3.new(math.huge, 0, math.huge)
        speedhackvelocity.Parent = character:FindFirstChild("Torso")
    end
end
local function getUnitDirection()
    local direction = Vector3.new(0, 0, 0)
    local cameraCFrame = workspace.CurrentCamera.CFrame
    local lookVector = Vector3.new(cameraCFrame.LookVector.X, 0, cameraCFrame.LookVector.Z).Unit
    local rightVector = Vector3.new(cameraCFrame.RightVector.X, 0, cameraCFrame.RightVector.Z).Unit

    if UIS:IsKeyDown(Enum.KeyCode.W) then
        direction = direction + lookVector
    end
    if UIS:IsKeyDown(Enum.KeyCode.S) then
        direction = direction - lookVector
    end
    if UIS:IsKeyDown(Enum.KeyCode.A) then
        direction = direction - rightVector
    end
    if UIS:IsKeyDown(Enum.KeyCode.D) then
        direction = direction + rightVector
    end
    if UIS:IsKeyDown(Enum.KeyCode.Space) then
        direction = direction + Vector3.new(0, 1, 0)
    end
    if UIS:IsKeyDown(Enum.KeyCode.LeftControl) then
        direction = direction - Vector3.new(0, 1, 0)
    end
    return direction.Magnitude > 0 and direction.Unit or Vector3.new(0, 0, 0)
end
local function flyLoop(deltaTime)
    if MainVariables.flying and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        humanoidRoot = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.PlatformStand = true
        end
        if not coordinate then
            coordinate = humanoidRoot.CFrame
        end
        local direction = getUnitDirection()
        if direction.Magnitude > 0 then
            local offset = direction * MainVariables.flyingSpeed * deltaTime
            coordinate = coordinate + offset
        end
        local cameraLookVector = workspace.CurrentCamera.CFrame.LookVector
        local horizontalLook = Vector3.new(cameraLookVector.X, 0, cameraLookVector.Z).Unit
        if horizontalLook.Magnitude > 0 then
            coordinate = CFrame.new(coordinate.Position, coordinate.Position + horizontalLook)
        end
        humanoidRoot.AssemblyLinearVelocity = Vector3.new()
        humanoidRoot.CFrame = coordinate
    else
        if humanoidRoot and humanoid then
            humanoid.PlatformStand = false
        end
    end
end
local function toggleFlying(state)
    MainVariables.flying = state
    if MainVariables.flying then
        RunService:BindToRenderStep("Fly", Enum.RenderPriority.Input.Value, flyLoop)
    else
        RunService:UnbindFromRenderStep("Fly")
        coordinate = nil
    end
end
local function speedhackloop(delta)
    if MainVariables.flying then
        return
    end

    local character = game.Players.LocalPlayer.Character
    if MainVariables.speedhack and character and character:FindFirstChild("HumanoidRootPart") then
        addBV()
        local humanoid = character:FindFirstChild("Humanoid")
        if humanoid then
            local moveDir = humanoid.MoveDirection
            if moveDir and moveDir.Magnitude > 0 then
                speedhackvelocity.Velocity =
                    moveDir * ((MainVariables.speedhackWalkSpeed + humanoid.WalkSpeed) / 2)
            else
                speedhackvelocity.Velocity = Vector3.new(0, 0, 0)
            end
        end
    elseif speedhackvelocity then
        speedhackvelocity:Destroy()
        speedhackvelocity = nil
    end
end

local function infJump(toggle)
    if not toggle then
        return
    end
    repeat
        local hrp = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if hrp and UIS:IsKeyDown(Enum.KeyCode.Space) then
            hrp.Velocity = Vector3.new(hrp.Velocity.X, MainVariables.infjumpheight, hrp.Velocity.Z)
        end
        task.wait(.1)
    until not MainVariables.infJump or not toggle
end
local function toggleSpeedhack(state)
    MainVariables.speedhack = state
    if MainVariables.speedhack then
        RunService:BindToRenderStep(
            "Speedhack",
            Enum.RenderPriority.Input.Value + (MainVariables.flying and 1 or 0),
            speedhackloop
        )
    else
        RunService:UnbindFromRenderStep("Speedhack")
        if speedhackvelocity then
            speedhackvelocity:Destroy()
            speedhackvelocity = nil
        end
    end
end

PlayersGroup:AddToggle(
    "Fly",
    {
        Text = "Fly",
        Default = false,
        Tooltip = "Fly",
        Callback = function(Value)
            toggleFlying(Value)
        end
    }
):AddKeyPicker(
    "FlyKeybind",
    {
        Default = "Y",
        SyncToggleState = true,
        Mode = "Toggle",
        Text = "Fly Keybind",
        NoUI = false,
        Callback = function(Value)
        end
    }
)

PlayersGroup:AddSlider(
    "FlySpeed",
    {
        Text = "Fly Speed",
        Default = 100,
        Min = 0,
        Max = 1000,
        Rounding = 0,
        Compact = true,
        Callback = function(Value)
            MainVariables.flyingSpeed = Value
        end
    }
)
PlayersGroup:AddToggle(
    "Speedhack",
    {
        Text = "Speedhack",
        Default = false,
        Tooltip = "Speedhack",
        Callback = function(Value)
            toggleSpeedhack(Value)
            local player = game.Players.LocalPlayer
            if Value then
                if not characterAddedConnection then
                    characterAddedConnection = player.CharacterAdded:Connect(function(character)
                        if speedhackvelocity then
                            speedhackvelocity:Destroy()
                            speedhackvelocity = nil
                        end
                        if MainVariables.speedhack then
                            toggleSpeedhack(false)
                            toggleSpeedhack(true)
                        end
                    end)
                end
            else
                if characterAddedConnection then
                    characterAddedConnection:Disconnect()
                    characterAddedConnection = nil
                end
            end
        end
    }
):AddKeyPicker(
    "SpeedhackKeybind",
    {
        Default = "N",
        SyncToggleState = true,
        Mode = "Toggle",
        Text = "Speedhack Keybind",
        NoUI = false,
        Callback = function(Value)
        end
    }
)
PlayersGroup:AddSlider(
    "Speedhack Speed",
    {
        Text = "Speedhack Speed",
        Default = 100,
        Min = 0,
        Max = 1000,
        Rounding = 0,
        Compact = true,
        Callback = function(Value)
            MainVariables.speedhackWalkSpeed = Value
        end
    }
)
PlayersGroup:AddToggle(
    "Infinite Jump",
    {
        Text = "Infinite Jump",
        Default = false,
        Tooltip = "Infinite Jump",
        Callback = function(Value)
            MainVariables.infJump = Value
            if MainVariables.infJump then
                infJump(true)
            end
        end
    }
):AddKeyPicker(
    "InfiniteJumpKeybind",
    {
        Default = "H",
        SyncToggleState = true,
        Mode = "Toggle",
        Text = "Infinite Jump Keybind",
        NoUI = false,
        Callback = function(Value)
        end
    }
)
PlayersGroup:AddSlider(
    "InfiniteJump Height",
    {
        Text = "InfiniteJump Height",
        Default = 50,
        Min = 0,
        Max = 1000,
        Rounding = 0,
        Compact = true,
        Callback = function(Value)
            MainVariables.infjumpheight = Value
        end
    }
)
local noclipConnection
PlayersGroup:AddToggle(
    "Noclip",
    {
        Text = "Noclip",
        Default = false,
        Tooltip = "noclip",
        Callback = function(Value)
            MainVariables.noclip = Value
            if noclipConnection then
                noclipConnection:Disconnect()
                noclipConnection = nil
            end

            if Value then
                if LocalPlayer.Character then
                    local head = LocalPlayer.Character:FindFirstChild("Head")
                    local torso = LocalPlayer.Character:FindFirstChild("Torso")

                    if head then
                        head.CanCollide = false
                    end
                    if torso then
                        torso.CanCollide = false
                    end
                end
                noclipConnection =
                    game:GetService("RunService").RenderStepped:Connect(
                    function()
                        if MainVariables.noclip and LocalPlayer.Character then
                            local head = LocalPlayer.Character:FindFirstChild("Head")
                            local torso = LocalPlayer.Character:FindFirstChild("Torso")

                            if head then
                                head.CanCollide = false
                            end
                            if torso then
                                torso.CanCollide = false
                            end
                        end
                    end
                )
            else
                if LocalPlayer.Character then
                    local head = LocalPlayer.Character:FindFirstChild("Head")
                    local torso = LocalPlayer.Character:FindFirstChild("Torso")

                    if head then
                        head.CanCollide = true
                    end
                    if torso then
                        torso.CanCollide = true
                    end
                end
            end
        end
    }
):AddKeyPicker(
    "NoclipKeybind",
    {
        Default = "",
        SyncToggleState = true,
        Mode = "Toggle",
        Text = "Noclip Keybind",
        NoUI = false
    }
)
PlayersGroup:AddToggle(
    "Bypass Anti-Speed",
    {
        Text = "Bypass Anti-Speed",
        Default = false,
        Tooltip = "Bypass Anti-Speed",
        Callback = function(Value)
            MainVariables.bypassSpeed = Value
            if MainVariables.bypassSpeed then
                while MainVariables.bypassSpeed and task.wait() do
                    local args = {
                        [1] = {
                            [1] = {
                                ["Module"] = "Dash"
                            },
                            [2] = "\5"
                        }
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("Bridgenet2Main"):WaitForChild("dataRemoteEvent"):FireServer(
                        unpack(args)
                    )
                end
            end
        end
    }
)

PlayersGroup:AddToggle(
    "AutoM1",
    {
        Text = "Auto M1",
        Default = false,
        Tooltip = "Auto M1",
        Callback = function(Value)
            MainVariables.autoswing = Value
           if MainVariables.autoswing then
            repeat
                local args = {
                    [1] = {
                        [1] = {
                            ["Module"] = "M1";
                        };
                        [2] = "";
                    };
                }
                
                game:GetService("ReplicatedStorage"):WaitForChild("Bridgenet2Main", 9e9):WaitForChild("dataRemoteEvent", 9e9):FireServer(unpack(args))
                task.wait(.1)
            until not MainVariables.autoswing
           end
        end
    }
):AddKeyPicker(
    "AutoM1Keybind",
    {
        Default = "",
        SyncToggleState = true,
        Mode = "Toggle",
        Text = "Auto M1 Keybind",
        NoUI = false,
        Callback = function(Value)
        end
    }
)
PlayersGroup:AddToggle(
    "AutoCrit",
    {
        Text = "Auto Critical",
        Default = false,
        Tooltip = "Auto Critical",
        Callback = function(Value)
            MainVariables.autocrit = Value
           if MainVariables.autocrit then
            repeat
                local args = {
                    [1] = {
                        [1] = {
                            ["Module"] = "M2";
                        };
                        [2] = "";
                    };
                }
                
                game:GetService("ReplicatedStorage"):WaitForChild("Bridgenet2Main", 9e9):WaitForChild("dataRemoteEvent", 9e9):FireServer(unpack(args))
                task.wait()
            until not MainVariables.autocrit
           end
        end
    }
):AddKeyPicker(
    "autocritKeybind",
    {
        Default = "",
        SyncToggleState = true,
        Mode = "Toggle",
        Text = "Auto Crit Keybind",
        NoUI = false,
        Callback = function(Value)
        end
    }
)
PlayersGroup:AddToggle(
    "AutoUppercut",
    {
        Text = "Auto Uppercut",
        Default = false,
        Tooltip = "Auto Uppercut",
        Callback = function(Value)
            MainVariables.autouppercut = Value
           if MainVariables.autouppercut then
            repeat
                    local args = {
                        [1] = {
                            [1] = {
                                ["Module"] = "Uppercut";
                            };
                            [2] = "";
                        };
                    }
                    
                    game:GetService("ReplicatedStorage"):WaitForChild("Bridgenet2Main", 9e9):WaitForChild("dataRemoteEvent", 9e9):FireServer(unpack(args))
                    task.wait(.1)
            until not MainVariables.autouppercut
           end
        end
    }
):AddKeyPicker(
    "AutoUppercutKeybind",
    {
        Default = "",
        SyncToggleState = true,
        Mode = "Toggle",
        Text = "Auto Uppercut Keybind",
        NoUI = false,
        Callback = function(Value)
        end
    }
)
local autoPerfectRollConnection
PlayersGroup:AddToggle(
    "autoPerfectRoll",
    {
        Text = "Auto Perfect Roll",
        Default = false,
        Tooltip = "Auto Uppercut",
        Callback = function(Value)
            MainVariables.autoperfectroll = Value
            if autoPerfectRollConnection then
                autoPerfectRollConnection:Disconnect()
                autoPerfectRollConnection = nil
            end
           if MainVariables.autoperfectroll then
            autoPerfectRollConnection = UIS.InputBegan:Connect(function(key)
                if key.KeyCode == Enum.KeyCode.Q then
                    task.wait(Options.AutoPerfectRollDelay.Value)
                    mouse2click()
                end
            end)
           end
        end
    }
):AddKeyPicker(
    "AutoPerfectRollKeybind",
    {
        Default = "",
        SyncToggleState = true,
        Mode = "Toggle",
        Text = "Auto Perfect Roll Keybind",
        NoUI = false,
        Callback = function(Value)
        end
    }
)
PlayersGroup:AddSlider(
    "AutoPerfectRollDelay",
    {
        Text = "Auto Perfect Roll Delay",
        Default = 0,
        Min = 0,
        Max = 1,
        Rounding = 1,
        Compact = true,
        Callback = function(Value)
        end
    }
)
PlayersGroup:AddToggle(
    "Auto Fragment",
    {
        Text = "Auto Fragment",
        Default = false,
        Tooltip = "Auto Fragment",
        Callback = function(Value)
            MainVariables.autofragment = Value
            if MainVariables.autofragment then
                task.spawn(
                    function()
                        repeat
                            for _, v in ipairs(LocalPlayer.Backpack:GetChildren()) do
                                if string.find(v.Name, "Fragment") then
                                    v.Parent = LocalPlayer.Character
                                    VIM:SendMouseButtonEvent(0, 0, 0, true, game, 0)
                                    VIM:SendMouseButtonEvent(0, 0, 0, false, game, 0)
                                    task.wait()
                                    v.Parent = LocalPlayer.Backpack
                                end
                            end
                            task.wait()
                        until not MainVariables.autofragment
                    end
                )
            end
        end
    }
):AddKeyPicker(
    "AutoFragmentKeybind",
    {
        Default = "",
        SyncToggleState = true,
        Mode = "Toggle",
        Text = "Auto Fragment Keybind",
        NoUI = false,
        Callback = function(Value)
        end
    }
)
game:GetService("Players").LocalPlayer.PlayerGui.ChildAdded:Connect(
    function(v)
        if v.Name == "BagGui" and MainVariables.AutoLoot then
            local itemframe = v.Frame.ItemsFrame
            for i, v in pairs(itemframe:GetChildren()) do
                if v:IsA("TextButton") then
                    GuiService.SelectedObject = v
                    task.wait(0.1)
                    VIM:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                    task.wait(0)
                    VIM:SendKeyEvent(false, Enum.KeyCode.Return, false, game)

                    v.Active = false
                    v.AutoButtonColor = false
                    v.BackgroundColor3 = Color3.fromRGB(128, 128, 128)
                    GuiService.SelectedObject = nil
                end
            end
        end
    end
)
PlayersGroup:AddToggle(
    "AutoLoot",
    {
        Text = "Auto Loot",
        Default = false,
        Tooltip = "Auto Loot items ",
        Callback = function(Value)
            MainVariables.AutoLoot = Value
            if Value then
                for i, v in pairs(
                    game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("BagGui").Frame.ItemsFrame:GetChildren(

                    )
                ) do
                    if v:IsA("TextButton") then
                        GuiService.SelectedObject = v
                        task.wait(0.1)
                        VIM:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                        task.wait(0.1)
                        VIM:SendKeyEvent(false, Enum.KeyCode.Return, false, game)

                        v.Active = false
                        v.AutoButtonColor = false
                        v.BackgroundColor3 = Color3.fromRGB(128, 128, 128)
                        GuiService.SelectedObject = nil
                    end
                end
            end
        end
    }
):AddKeyPicker(
    "AutoLootKeybind",
    {
        Default = "",
        SyncToggleState = true,
        Mode = "Toggle",
        Text = "Auto Loot Keybind",
        NoUI = false,
        Callback = function(Value)
        end
    }
)

local noAnimsLoop
local charAddedConnection
local forcedTracks = {}
local originalTracks = {}
PlayersGroup:AddToggle(
    "No Anims",
    {
        Text = "No Anims",
        Default = false,
        Tooltip = "Freezes character animations",
        Callback = function(Value)
            MainVariables.noanims = Value
            if noAnimsLoop then
                task.cancel(noAnimsLoop)
                noAnimsLoop = nil
            end
            if charAddedConnection then
                charAddedConnection:Disconnect()
                charAddedConnection = nil
            end
            if not MainVariables.noanims then
                for _, track in pairs(forcedTracks) do
                    pcall(
                        function()
                            track:Stop()
                            track:Destroy()
                        end
                    )
                end
                forcedTracks = {}
                for _, track in pairs(originalTracks) do
                    pcall(
                        function()
                            track:Play()
                        end
                    )
                end
                originalTracks = {}
                return
            end
            local function forceAnimations(char)
                local humanoid = char:FindFirstChildOfClass("Humanoid") or char:WaitForChild("Humanoid", 2)
                if not humanoid then
                    return
                end

                local animator = humanoid:FindFirstChildOfClass("Animator") or humanoid:WaitForChild("Animator", 2)
                if not animator then
                    return
                end
                local anim = Instance.new("Animation")
                anim.AnimationId = "http://www.roblox.com/asset/?id=109212722752"

                noAnimsLoop =
                    task.spawn(
                    function()
                        while MainVariables.noanims and humanoid and humanoid.Parent do
                            local existingTrack = nil
                            for _, track in pairs(animator:GetPlayingAnimationTracks()) do
                                if track.Animation.AnimationId ~= anim.AnimationId then
                                    if not table.find(originalTracks, track) then
                                        table.insert(originalTracks, track)
                                    end
                                    pcall(
                                        function()
                                            track:Stop()
                                            task.defer(track.Destroy, track)
                                        end
                                    )
                                else
                                    existingTrack = track
                                end
                            end
                            if not existingTrack then
                                local track = animator:LoadAnimation(anim)
                                table.insert(forcedTracks, track)
                                track.Priority = Enum.AnimationPriority.Core
                                track:AdjustSpeed(0)
                                track:Play()
                            end

                            task.wait(0.1)
                        end
                    end
                )
            end
            if LocalPlayer.Character then
                forceAnimations(LocalPlayer.Character)
            end
            charAddedConnection = LocalPlayer.CharacterAdded:Connect(forceAnimations)
        end
    }
):AddKeyPicker(
    "NoAnimsKeybind",
    {
        Default = "",
        SyncToggleState = true,
        Mode = "Toggle",
        Text = "No Anims Keybind",
        NoUI = false
    }
)

PlayersGroup:AddToggle(
    "Auto Grip",
    {
        Text = "Auto Grip",
        Default = false,
        Tooltip = "Auto Grip",
        Callback = function(Value)
            MainVariables.autogrip = Value
            if MainVariables.autogrip then
                task.spawn(function()
                    while MainVariables.autogrip and task.wait() do
                        local closestEnemy = nil
                        local shortestDistance = math.huge

                        for _, v in ipairs(workspace.Entities:GetChildren()) do
                            if v ~= Character and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
                                local hum = v.Humanoid
                                local hrp = v.HumanoidRootPart
                                local distance = (hrp.Position - Character.PrimaryPart.Position).Magnitude

                                if distance <= 5 and hum.Health <= 2.5 then
                                    if distance < shortestDistance then
                                        shortestDistance = distance
                                        closestEnemy = v
                                    end
                                end
                            end
                        end

                        if closestEnemy then
                            local args = {
                                [1] = {
                                    [1] = {
                                        ["Module"] = "Grip"
                                    },
                                    [2] = "\5"
                                }
                            }
                            game:GetService("ReplicatedStorage"):WaitForChild("Bridgenet2Main"):WaitForChild("dataRemoteEvent"):FireServer(unpack(args))

                            repeat
                                task.wait(0)
                                local enemyHRP = closestEnemy:FindFirstChild("HumanoidRootPart")
                                if not enemyHRP then break end
                                local distance = (enemyHRP.Position - Character.PrimaryPart.Position).Magnitude
                                if distance > 6 then
                                    break 
                                end
                            until not closestEnemy.Parent or closestEnemy:FindFirstChild("Humanoid").Health <= 0
                        end
                    end
                end)
            end
        end
    }
)
PlayersGroup:AddToggle(
    "Auto Equip",
    {
        Text = "Auto Equip",
        Default = false,
        Tooltip = "Auto Equip",
        Callback = function(Value)
            MainVariables.autoequip = Value
            if MainVariables.autoequip then
                while MainVariables.autoequip and task.wait(.1) do
                    if not Character:GetAttribute("CombatMode") then
                        local args = {
                            [1] = {
                                [1] = {
                                    ["Module"] = "Toggle";
                                    ["IsHolding"] = true;
                                };
                                [2] = "";
                            };
                        }
                        
                        game:GetService("ReplicatedStorage"):WaitForChild("Bridgenet2Main", 9e9):WaitForChild("dataRemoteEvent", 9e9):FireServer(unpack(args))
                    end
                end
            end
        end
    }
)


PlayersGroup:AddButton(
    {
        Text = "Kill Yourself",
        Func = function()
            game.Players.LocalPlayer.Character:FindFirstChild("Humanoid"):TakeDamage(math.huge)
        end,
        Tooltip = "Commit Suicide"
    }
)
local connections = {}
local function getPing()
    local success, ping =
        pcall(
        function()
            return math.floor(Players.LocalPlayer:GetNetworkPing() * 1000) 
        end
    )
    return success and ping or 0
end

local function getFPS()
    local success, fps =
        pcall(
        function()
            return math.floor((1 / RunService.RenderStepped:Wait()) * 1000)
        end
    )
    return success and fps or 0
end

local function calculateParryDelay(configDelay, shouldAdjust)
    if not shouldAdjust then
        return configDelay
    end
    local ping = getPing()
    local fps = getFPS()
    local totalDelay = (ping / 2) + (fps / 2)
    local adjustedDelay = configDelay - totalDelay
    return math.max(50, adjustedDelay)
end

local function isInRange(character, target, range)
    if not range then
        return true
    end

    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    local enemyRootPart = target:FindFirstChild("HumanoidRootPart")

    if humanoidRootPart and enemyRootPart then
        local distance = (humanoidRootPart.Position - enemyRootPart.Position).Magnitude
        return distance <= range
    end

    return false
end
local function executeParrySequence(config)
    local function singleParry()
        VIM:SendKeyEvent(true, Enum.KeyCode.F, false, game)
        if config.Hold then
            task.wait(0.1)
        end
        VIM:SendKeyEvent(false, Enum.KeyCode.F, false, game)
    end
    if config.RepeatCount and config.RepeatCount > 0 then
        for i = 1, config.RepeatCount do
            pcall(singleParry)
            if i < config.RepeatCount and config.RepeatDelay then
                task.wait(config.RepeatDelay / 1000)
            end
        end
    else
        pcall(singleParry)
    end
    if config.RepeatParryAmount and config.RepeatParryAmount > 0 then
        task.wait(config.RepeatParryDelay / 1000)
        for i = 1, config.RepeatParryAmount do
            pcall(singleParry)
            if i < config.RepeatParryAmount then
                task.wait(config.RepeatDelay or 100 / 1000)
            end
        end
    end
end

local function setupParry(target)
    if not MainVariables.Autoparry then
        return
    end
    if target == game.Players.LocalPlayer.Character then
        return
    end

    local humanoid = target:FindFirstChildOfClass("Humanoid")
    if not humanoid then
        return
    end

    local connection =
        humanoid.AnimationPlayed:Connect(
        function(track)
            if not MainVariables.Autoparry then
                return
            end

            local animation = track.Animation
            if not animation then
                return
            end

            local config = autoParryConfig[animation.AnimationId]
            if not config then
                return
            end
            local character = Players.LocalPlayer.Character
            if character and not isInRange(character, target, config.Range) then
                return
            end

            local delay = calculateParryDelay(config.Delay or 0, MainVariables.AutoParryAdjustToPing)
            if delay > 0 then
                task.wait(delay / 1000)
            end
            executeParrySequence(config)
            if not config.Parryable then
                VIM:SendKeyEvent(true, Enum.KeyCode.Q, false, game)
                VIM:SendKeyEvent(false, Enum.KeyCode.Q, false, game)
                if MainVariables.autorollcancel then
                    task.wait(.1)
                    mouse2click()
                end
                return
            end
        end
    )

    table.insert(connections, connection)
end

local function refreshParry()
    for _, connection in ipairs(connections) do
        pcall(connection.Disconnect, connection)
    end
    connections = {}

    if not MainVariables.Autoparry then
        return
    end

    local aliveFolder = workspace:FindFirstChild("Entities")
    if not aliveFolder then
        return
    end
    for _, entity in pairs(aliveFolder:GetChildren()) do
        task.spawn(setupParry, entity)
    end
    aliveFolder.ChildAdded:Connect(
        function(entity)
            task.spawn(setupParry, entity)
        end
    )
end

AutoParryGroup:AddToggle(
    "Auto Parry",
    {
        Text = "Auto Parry",
        Default = false,
        Tooltip = "Automatically parry enemy attacks",
        Callback = function(Value)
            MainVariables.Autoparry = Value
            if MainVariables.Autoparry then
                refreshParry()
            else
                for _, connection in ipairs(connections) do
                    pcall(
                        function()
                            connection:Disconnect()
                        end
                    )
                end
                connections = {}
            end
        end
    }
):AddKeyPicker(
    "AutoParryKeybind",
    {
        Default = "",
        SyncToggleState = true,
        Mode = "Toggle",
        Text = "Auto Parry Keybind",
        NoUI = false,
        Callback = function(Value)
        end
    }
)

AutoParryGroup:AddToggle(
    "AdjustToPing",
    {
        Text = "Adjust to Ping",
        Default = false,
        Tooltip = "Adjust parry timing based on your ping",
        Callback = function(Value)
            MainVariables.AutoParryAdjustToPing = Value
        end
    }
)
AutoParryGroup:AddToggle(
    "Auto Roll Cancel",
    {
        Text = "Auto Roll Cancel",
        Default = false,
        Tooltip = "Auto Roll Cancel",
        Callback = function(Value)
            MainVariables.autorollcancel = Value
        end
    }
)

local function GetTargets()
    local targets = {}
    for _, v in ipairs(workspace.Entities:GetChildren()) do
        if v ~= Character then
            local isPlayer = Players:FindFirstChild(v.Name) ~= nil
            if (MainVariables.aimbotPlayers and isPlayer) or (MainVariables.aimbotMobs and not isPlayer) then
                table.insert(targets, v)
            end
        end
    end
    return targets
end

local function IsVisible(part)
    local ray = Ray.new(Camera.CFrame.Position, (part.Position - Camera.CFrame.Position).Unit * 1000)
    local hit = workspace:FindPartOnRayWithIgnoreList(ray, {Character, Camera})
    return hit and hit:IsDescendantOf(part.Parent)
end

local function GetNearestTarget()
    local nearest, dist = nil, math.huge
    for _, v in ipairs(GetTargets()) do
        local root = v:FindFirstChild("HumanoidRootPart") or v:FindFirstChild("Head")
        if root then
            local screenPos = Camera:WorldToViewportPoint(root.Position)
            local angle =
                math.deg(math.acos(Camera.CFrame.LookVector:Dot((root.Position - Camera.CFrame.Position).Unit)))
            if angle <= MainVariables.aimbotFOV / 2 and (not MainVariables.aimbotVisible or IsVisible(root)) then
                local mousePos = Vector2.new(UIS:GetMouseLocation().X, UIS:GetMouseLocation().Y)
                local screenPos2D = Vector2.new(screenPos.X, screenPos.Y)
                local distance = (mousePos - screenPos2D).Magnitude
                if distance < dist then
                    nearest, dist = root, distance
                end
            end
        end
    end
    return nearest
end

local aimbotConnection = nil
CameraGroup:AddToggle(
    "Aimbot",
    {
        Text = "Aimbot",
        Default = false,
        Tooltip = "Aimbot",
        Callback = function(Value)
            MainVariables.aimbotEnabled = Value
            if not MainVariables.aimbotEnabled then
                MainVariables.aimbotActive = false
            end
            if aimbotConnection then
                aimbotConnection:Disconnect()
                aimbotConnection = nil
            end
            if MainVariables.aimbotEnabled then
                aimbotConnection =
                    game:GetService("RunService").RenderStepped:Connect(
                    function()
                        if MainVariables.aimbotActive then
                            local target = GetNearestTarget()
                            if target then
                                local targetPosition = target.Position
                                if MainVariables.aimbotXOffset ~= 0 or MainVariables.aimbotYOffset ~= 0 then
                                    local screenPoint = Camera:WorldToViewportPoint(targetPosition)
                                    local offsetScreenPoint =
                                        Vector2.new(
                                        screenPoint.X + MainVariables.aimbotXOffset,
                                        screenPoint.Y + MainVariables.aimbotYOffset
                                    )
                                    local ray = Camera:ViewportPointToRay(offsetScreenPoint.X, offsetScreenPoint.Y)
                                    targetPosition = ray.Origin + ray.Direction * 100
                                end

                                Camera.CFrame = CFrame.new(Camera.CFrame.Position, targetPosition)
                            end
                        end
                    end
                )
            end
        end
    }
)
CameraGroup:AddLabel("Aimbot Keybind"):AddKeyPicker(
    "AimbotKeybind",
    {
        Default = "MB2",
        SyncToggleState = false,
        Mode = "Hold",
        Text = "Aimbot Keybind",
        NoUI = true,
        Callback = function(Value)
            MainVariables.aimbotActive = Value
        end
    }
)
CameraGroup:AddToggle(
    "Aimbot Players",
    {
        Text = "Target Players",
        Default = false,
        Tooltip = "Target other players",
        Callback = function(Value)
            MainVariables.aimbotPlayers = Value
        end
    }
)

CameraGroup:AddToggle(
    "Aimbot Mobs",
    {
        Text = "Target Mobs",
        Default = false,
        Tooltip = "Target Mobs",
        Callback = function(Value)
            MainVariables.aimbotMobs = Value
        end
    }
)

CameraGroup:AddToggle(
    "Visible Only",
    {
        Text = "Visible Only",
        Default = false,
        Tooltip = "Only target visible enemies",
        Callback = function(Value)
            MainVariables.aimbotVisible = Value
        end
    }
)

CameraGroup:AddSlider(
    "Aimbot X Offset",
    {
        Text = "Aimbot X Offset",
        Default = 0,
        Min = -300,
        Max = 300,
        Rounding = 0,
        Compact = true,
        Callback = function(Value)
            MainVariables.aimbotXOffset = Value
        end
    }
)
CameraGroup:AddSlider(
    "Aimbot Y Offset",
    {
        Text = "Aimbot Y Offset",
        Default = 0,
        Min = -300,
        Max = 300,
        Rounding = 0,
        Compact = true,
        Callback = function(Value)
            MainVariables.aimbotYOffset = Value
        end
    }
)
local FovCircle
local function GetFovScale()
    return (math.tan(math.rad(1)) * (Camera.ViewportSize.Y / 2))
end

CameraGroup:AddToggle(
    "Show FOV",
    {
        Text = "Show FOV",
        Default = false,
        Tooltip = "Show FOV",
        Callback = function(Value)
            MainVariables.showFov = Value
            if Value then
                if not FovCircle then
                    FovCircle = Drawing.new("Circle")
                    FovCircle.Thickness = 1
                    FovCircle.NumSides = 100
                    FovCircle.Filled = false
                    FovCircle.Color = Color3.fromRGB(255, 255, 255)
                    FovCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
                end
                FovCircle.Visible = true
            elseif FovCircle then
                FovCircle.Visible = false
            end
        end
    }
)

CameraGroup:AddSlider(
    "Aimbot FOV",
    {
        Text = "Aimbot FOV",
        Default = 45,
        Min = 1,
        Max = 120,
        Rounding = 0,
        Compact = true,
        Callback = function(Value)
            MainVariables.aimbotFOV = Value
            if MainVariables.showFov and FovCircle then
                FovCircle.Radius = Value * GetFovScale()
            end
        end
    }
)
local function UpdateFovCircle()
    if FovCircle then
        FovCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
        FovCircle.Radius = MainVariables.aimbotFOV * GetFovScale()
    end
end
Camera:GetPropertyChangedSignal("ViewportSize"):Connect(UpdateFovCircle)
Camera:GetPropertyChangedSignal("FieldOfView"):Connect(UpdateFovCircle)

CameraGroup:AddToggle(
    "FOV Changer",
    {
        Text = "FOV Changer",
        Default = false,
        Tooltip = "Fov Changer",
        Callback = function(Value)
            MainVariables.fovchanger = Value
            if not MainVariables.fovchanger then
                Camera.FieldOfView = 70
            else
                Camera.FieldOfView = MainVariables.CameraFOV
            end
        end
    }
)
CameraGroup:AddSlider(
    "FOV",
    {
        Text = "Field of View",
        Default = 70,
        Min = 0,
        Max = 120,
        Rounding = 0,
        Compact = true,
        Callback = function(Value)
            if MainVariables.fovchanger then
                Camera.FieldOfView = Value
            end
        end
    }
)
-- ESP MAIN
local ESPConfig = {
    PlayerESP = false,
    mobESP = false,
    npcESP = false,
    ESPObjects = {},
    NPCESPOBjects = {},
    PlayerEspObjects = {},
    ActiveMobs = {},
    ActiveNPCs = {},
    ActivePlayers = {},
    fontSize = 14,
    espDistance = 1000,
    MobESPColor = Color3.new(1, 1, 1), 
    NpcESPColor = Color3.new(0, 1, 0), 
    PlayerESPColor = Color3.new(1, 1, 1)
}

local function NewQuad(thickness, color)
    local quad = Drawing.new("Quad")
    quad.Visible = false
    quad.PointA = Vector2.new(0, 0)
    quad.PointB = Vector2.new(0, 0)
    quad.PointC = Vector2.new(0, 0)
    quad.PointD = Vector2.new(0, 0)
    quad.Color = color
    quad.Filled = false
    quad.Thickness = thickness
    quad.Transparency = 1
    return quad
end

local function NewLine(thickness, color)
    local line = Drawing.new("Line")
    line.Visible = false
    line.From = Vector2.new(0, 0)
    line.To = Vector2.new(0, 0)
    line.Color = color
    line.Thickness = thickness
    line.Transparency = 1
    return line
end
local function NewText(color)
    local text = Drawing.new("Text")
    text.Visible = false
    text.Center = true
    text.Outline = true
    text.Color = color
    text.Size = ESPConfig.fontSize
    return text
end

local function RemoveESP(obj, espTable, activeTable)
    if activeTable[obj] then
        local data = activeTable[obj]
        if data.espText then
            data.espText:Remove()
        end
        activeTable[obj] = nil
    end
end
local function RemoveMobESP(mob)
    if ESPConfig.ActiveMobs[mob] then
        local data = ESPConfig.ActiveMobs[mob]
        if data.espText then
            data.espText:Remove()
        end
        if data.highlight then
            data.highlight:Destroy()
        end
        ESPConfig.ActiveMobs[mob] = nil
    end
end

local function CreateNpcESP(npc)
    if not npc or not npc:IsA("Model") or ESPConfig.ActiveNPCs[npc] then
        return
    end

    local rootPart = npc:FindFirstChild("HumanoidRootPart")
    if not rootPart then
        return
    end

    local espText = NewText(ESPConfig.NpcESPColor)
    espText.Visible = false
    table.insert(ESPConfig.NPCESPOBjects, espText)
    ESPConfig.ActiveNPCs[npc] = {espText = espText}

    local updateName = "UpdateNpcESP_" .. npc:GetDebugId()

    local function UpdateNpcESP()
        if not npc or not npc.Parent or not ESPConfig.npcESP then
            RunService:UnbindFromRenderStep(updateName)
            RemoveESP(npc, ESPConfig.NPCESPOBjects, ESPConfig.ActiveNPCs)
            return
        end

        local player = Players.LocalPlayer
        local char = player.Character
        if not char then
            return
        end

        local playerRoot = char:FindFirstChild("HumanoidRootPart")
        if not playerRoot then
            return
        end

        local distance = (rootPart.Position - playerRoot.Position).Magnitude
        local screenPos, onScreen = Camera:WorldToViewportPoint(rootPart.Position)

        if distance <= ESPConfig.espDistance and onScreen then
            espText.Text = string.format("[%s][Dist: %.1f]", npc.Name, distance)
            espText.Size = ESPConfig.fontSize
            espText.Position = Vector2.new(screenPos.X, screenPos.Y - 50)
            espText.Visible = true
        else
            espText.Visible = false
        end
    end

    RunService:BindToRenderStep(updateName, Enum.RenderPriority.Camera.Value + 1, UpdateNpcESP)

    npc.AncestryChanged:Connect(
        function(_, parent)
            if not parent then
                RunService:UnbindFromRenderStep(updateName)
                RemoveESP(npc, ESPConfig.NPCESPOBjects, ESPConfig.ActiveNPCs)
            end
        end
    )
end
local function CreateMobESP(mob)
    if not (mob and mob:IsA("Model")) or ESPConfig.ActiveMobs[mob] then
        return
    end

    local humanoid = mob:FindFirstChildOfClass("Humanoid")
    local rootPart = mob:FindFirstChild("HumanoidRootPart")
    if not (humanoid and rootPart) then
        return
    end

    local espText = NewText(ESPConfig.MobESPColor)
    espText.Visible = false
    table.insert(ESPConfig.ESPObjects, espText)

    local highlight = Instance.new("Highlight")
    highlight.Parent = mob
    highlight.FillColor = ESPConfig.MobESPColor
    highlight.Enabled = false

    ESPConfig.ActiveMobs[mob] = {espText = espText, highlight = highlight}

    local updateName = "UpdateESP_" .. mob:GetDebugId()

    local function UpdateESP()
        if not mob or not mob.Parent or not humanoid or not rootPart or not ESPConfig.mobESP then
            RunService:UnbindFromRenderStep(updateName)
            RemoveMobESP(mob)
            return
        end

        local player = Players.LocalPlayer
        local char = player.Character
        if not char then
            return
        end

        local playerRoot = char:FindFirstChild("HumanoidRootPart")
        if not playerRoot then
            return
        end

        local distance = (rootPart.Position - playerRoot.Position).Magnitude
        local screenPos, onScreen = Camera:WorldToViewportPoint(rootPart.Position)

        if distance <= ESPConfig.espDistance and onScreen then
            local healthPercent = humanoid.MaxHealth > 0 and (humanoid.Health / humanoid.MaxHealth) * 100 or 0
            healthPercent = math.clamp(math.floor(healthPercent), 0, 100)

            local mobName = mob.Name:match("^(.-)_") or mob.Name
            espText.Text = string.format("[%s] [Dist: %.1f] [HP: %d%%]", mobName, distance, healthPercent)
            espText.Position = Vector2.new(screenPos.X, screenPos.Y - 50)
            espText.Size = ESPConfig.fontSize
            espText.Visible = true
            highlight.Enabled = true
        else
            espText.Visible = false
            highlight.Enabled = false
        end
    end

    RunService:BindToRenderStep(updateName, Enum.RenderPriority.Camera.Value + 1, UpdateESP)

    mob.AncestryChanged:Connect(
        function(_, parent)
            if not parent then
                RunService:UnbindFromRenderStep(updateName)
                RemoveMobESP(mob)
            end
        end
    )
end
--dont worry I just realised that I could just use while loop instead of this useless functions but this is old anyways im kinda a newgen to making roblox scripts
local function UpdateMobs()
    for _, mob in ipairs(workspace.Entities:GetChildren()) do
        if mob:IsA("Model") and not Players:FindFirstChild(mob.Name) and not ESPConfig.ActiveMobs[mob] then
            CreateMobESP(mob)
        end
    end
end
local function UpdateNPC()
    for _, v in ipairs(workspace.Dialogues:GetChildren()) do
        if v:IsA("Model") and not ESPConfig.ActiveNPCs[v] then
            CreateNpcESP(v)
        end
    end
end
workspace.Entities.ChildAdded:Connect(
    function(newMob)
        if newMob:IsA("Model") and not Players:FindFirstChild(newMob.Name) then
            CreateMobESP(newMob)
        end
    end
)

--I have to remove the player esp lib im using out of respect for the original creator
ESPGroup:AddToggle(
    "PlayerESP",
    {
        Text = "Player ESP",
        Default = false,
        Tooltip = "ESP players with name, distance, and health",
        Callback = function(Value)
            ESPConfig.PlayerESP = Value
            if ESPConfig.PlayerESP then
                ESP:load()
            else
                ESP:unload()
            end
        end
    }
):AddColorPicker(
    "PlayerColorPicker",
    {
        Default = ESPConfig.MobESPColor,
        Title = "Player ESP Color",
        Transparency = 0,
        Callback = function(Value)
        end
    }
)

ESPGroup:AddToggle(
    "MobESP",
    {
        Text = "MobESP",
        Default = false,
        Tooltip = "ESP mobs with name, distance, and health",
        Callback = function(Value)
            ESPConfig.mobESP = Value
            if ESPConfig.mobESP then
                UpdateMobs()
            else
                for mob in pairs(ESPConfig.ActiveMobs) do
                    RemoveMobESP(mob)
                end
                ESPConfig.ESPObjects = {}
            end
        end
    }
):AddColorPicker(
    "MobColorPicker",
    {
        Default = ESPConfig.MobESPColor,
        Title = "Mob ESP Color",
        Transparency = 0,
        Callback = function(Value)
            ESPConfig.MobESPColor = Value
            for _, obj in pairs(ESPConfig.ActiveMobs) do
                if obj.highlight then
                    obj.highlight.FillColor = Value
                end
            end
        end
    }
)

ESPGroup:AddToggle(
    "NPCEsp",
    {
        Text = "NpcESP",
        Default = false,
        Tooltip = "NPC ESP",
        Callback = function(Value)
            ESPConfig.npcESP = Value
            if ESPConfig.npcESP then
                UpdateNPC()
            else
                for obj in pairs(ESPConfig.ActiveNPCs) do
                    RemoveESP(obj, ESPConfig.NPCESPOBjects, ESPConfig.ActiveNPCs)
                end
                ESPConfig.NPCESPOBjects = {}
            end
        end
    }
):AddColorPicker(
    "NPCEspPicker",
    {
        Default = ESPConfig.NpcESPColor,
        Title = "NPC ESP COLOR",
        Transparency = 0,
        Callback = function(Value)
            ESPConfig.NpcESPColor = Value
            for _, obj in pairs(ESPConfig.ActiveNPCs) do
                obj.espText.Color = Value
            end
        end
    }
)

ESPGroup:AddSlider(
    "Distance",
    {
        Text = "ESP Distance",
        Default = 1000,
        Min = 0,
        Max = 10000,
        Rounding = 0,
        Compact = true,
        Callback = function(Value)
            ESPConfig.espDistance = Value
        end
    }
)

ESPGroup:AddSlider(
    "TextSizeSlider",
    {
        Text = "Text Font Size",
        Default = 14,
        Min = 10,
        Max = 30,
        Rounding = 0,
        Compact = true,
        Callback = function(Value)
            ESPConfig.fontSize = Value
        end
    }
)
--Auto Farm
local AutoFarmSettings = {
    AutoFarmMobsDistance = 10,
    AutoFarmMobsHeight = 0,
    AutoFarmMobs = false,
    AutoFarmSelectedMobs = false
}
WorldGroup:AddToggle(
    "Attach to nearby mobs",
    {
        Text = "Auto Farm Nearby Mobs",
        Default = false,
        Tooltip = "Auto Farm Nearest mob",
        Callback = function(Value)
            AutoFarmSettings.AutoFarmMobs = Value
            if AutoFarmSettings.AutoFarmMobs then
                task.spawn(
                    function()
                        while AutoFarmSettings.AutoFarmMobs and task.wait() do
                            local character = LocalPlayer.Character
                            if
                                not character or not character:FindFirstChild("HumanoidRootPart") or
                                    not Character.PrimaryPart
                             then
                                return
                            end
                            local hrp = character.HumanoidRootPart
                            local nearestMob = nil
                            local shortestDistance = math.huge
                            for _, mob in pairs(workspace.Entities:GetChildren()) do
                                if mob:IsA("Model") and not Players:FindFirstChild(mob.Name) then
                                    local mobRootPart = mob:FindFirstChild("HumanoidRootPart") or mob.PrimaryPart
                                    if mobRootPart then
                                        local distance = (hrp.Position - mobRootPart.Position).Magnitude
                                        if distance < shortestDistance then
                                            shortestDistance = distance
                                            nearestMob = mobRootPart
                                        end
                                    end
                                end
                            end
                            if nearestMob then
                                repeat
                                    Teleport(
                                        nearestMob.CFrame *
                                            CFrame.new(
                                                0,
                                                AutoFarmSettings.AutoFarmMobsHeight,
                                                AutoFarmSettings.AutoFarmMobsDistance
                                            ),
                                        170
                                    )
                                    task.wait()
                                until not AutoFarmSettings.AutoFarmMobs or not nearestMob.Parent or
                                    not nearestMob:IsDescendantOf(workspace) or nearestMob.Parent:FindFirstChild("Humanoid").Health <= 0
                            end
                        end
                    end
                )
            end
        end
    }
):AddKeyPicker(
    "AutoFarmNearbyKeybind",
    {
        Default = "",
        SyncToggleState = true,
        Mode = "Toggle",
        Text = "AutoFarmNearby Keybind",
        NoUI = false,
        Callback = function(Value)
        end
    }
)
WorldGroup:AddToggle(
    "Attach to nearby Players",
    {
        Text = "Auto Farm Nearby Players",
        Default = false,
        Tooltip = "Auto Farm Nearest Players",
        Callback = function(Value)
            AutoFarmSettings.autofarmplayers = Value
            if AutoFarmSettings.autofarmplayers then
                task.spawn(
                    function()
                        while AutoFarmSettings.autofarmplayers and task.wait() do
                            local character = LocalPlayer.Character
                            if not character or not character:FindFirstChild("HumanoidRootPart") then
                                return
                            end

                            local hrp = character.HumanoidRootPart
                            local nearestPlayer = nil
                            local shortestDistance = math.huge
                            for _, player in pairs(Players:GetPlayers()) do
                                if player ~= LocalPlayer and player.Character then
                                    local targetChar = player.Character
                                    local targetRoot =
                                        targetChar:FindFirstChild("HumanoidRootPart") or targetChar.PrimaryPart

                                    if targetRoot then
                                        local distance = (hrp.Position - targetRoot.Position).Magnitude
                                        if distance < shortestDistance then
                                            shortestDistance = distance
                                            nearestPlayer = targetRoot
                                        end
                                    end
                                end
                            end

                            if nearestPlayer then
                               repeat
                                local targetCFrame =
                                nearestPlayer.CFrame *
                                CFrame.new(
                                    0,
                                    AutoFarmSettings.AutoFarmMobsHeight,
                                    AutoFarmSettings.AutoFarmMobsDistance
                                )
                                Teleport(targetCFrame, 170)
                                task.wait()
                               until not MainVariables.autofarmplayers or not nearestPlayer or not nearestPlayer.Parent or not nearestPlayer:IsDescendantOf(workspace) or nearestPlayer.Parent:FindFirstChild("Humanoid").Health <= 0
                            end
                        end
                    end
                )
            end
        end
    }
):AddKeyPicker(
    "AutoFarmNearbyPlayersKeybind",
    {
        Default = "",
        SyncToggleState = true,
        Mode = "Toggle",
        Text = "AutoFarmNearby Players Keybind",
        NoUI = false,
        Callback = function(Value)
        end
    }
)
WorldGroup:AddSlider(
    "Distance",
    {
        Text = "Distance",
        Default = 10,
        Min = 0,
        Max = 30,
        Rounding = 0,
        Compact = true,
        Callback = function(Value)
            AutoFarmSettings.AutoFarmMobsDistance = Value
        end
    }
)
WorldGroup:AddSlider(
    "Height",
    {
        Text = "Height",
        Default = 0,
        Min = -30,
        Max = 30,
        Rounding = 0,
        Compact = true,
        Callback = function(Value)
            AutoFarmSettings.AutoFarmMobsHeight = Value
        end
    }
)
local bringmobConnection
WorldGroup:AddToggle(
    "Bring Mob",
    {
        Text = "Bring Mob",
        Default = false,
        Tooltip = "Bring Mob",
        Callback = function(Value)
            MainVariables.bringmobs = Value
            if MainVariables.bringmobs then
                bringmobConnection =
                    game:GetService("RunService").RenderStepped:Connect(
                    function()
                        if MainVariables.bringmobs then
                            for i, v in ipairs(workspace.Entities:GetChildren()) do
                                if
                                    v:IsA("Model") and v:FindFirstChild("HumanoidRootPart") and
                                        not game.Players:FindFirstChild(v.Name) and (game.Players.LocalPlayer.Character.PrimaryPart.Position - v.PrimaryPart.Position).Magnitude < MainVariables.bringmobsrange
                                 then
                                    if isnetworkowner(v.PrimaryPart) then
                                        v:FindFirstChild("HumanoidRootPart").CFrame =
                                            LocalPlayer.Character.PrimaryPart.CFrame *
                                            CFrame.new(0, 0, -MainVariables.bringmobsdistance)
                                    end
                                end
                            end
                        end
                    end
                )
            else
                if bringmobConnection then
                    bringmobConnection:Disconnect()
                    bringmobConnection = nil
                end
            end
        end
    }
):AddKeyPicker(
    "BringMobKeybind",
    {
        Default = "",
        SyncToggleState = true,
        Mode = "Toggle",
        Text = "Bring Mob Keybind",
        NoUI = false
    }
)
WorldGroup:AddSlider(
    "Bring Mobs Range",
    {
        Text = "Bring Mob Range",
        Default = 1000,
        Min = 0,
        Max = 10000,
        Rounding = 0,
        Compact = true,
        Callback = function(Value)
            MainVariables.bringmobsrange = Value
        end
    }
)
WorldGroup:AddSlider(
    "BringMobsDistance",
    {
        Text = "Bring Mob Distance",
        Default = 50,
        Min = 0,
        Max = 100,
        Rounding = 0,
        Compact = true,
        Callback = function(Value)
            MainVariables.bringmobsdistance = Value
        end
    }
)

local killAuraIfCredsConnection

WorldGroup:AddToggle(
    "Kill Aura",
    {
        Text = "Kill Aura",
        Default = false,
        Tooltip = "Instant Kill",
        Callback = function(Value)
            MainVariables.VoidMob = Value
            if MainVariables.VoidMob then
                while MainVariables.VoidMob and task.wait() do
                    for i, v in ipairs(workspace.Entities:GetChildren()) do
                        if v:IsA("Model") and not game.Players:FindFirstChild(v.Name) then
                            if v:FindFirstChild("Humanoid") then
                                local humanoid = v:FindFirstChild("Humanoid")
                                if humanoid then
                                    humanoid.Health = 0
                                    humanoid.MaxHealth = 0
                                end
                            end
                            for _, part in ipairs(v:GetDescendants()) do
                                if part:IsA("BasePart") then
                                    part:BreakJoints() --this is useless idk why I put it here
                                end
                            end
                        end
                    end
                end
            end
        end
    }
):AddKeyPicker(
    "KillAuraKeybind",
    {
        Default = "",
        SyncToggleState = true,
        Mode = "Toggle",
        Text = "Kill Aura Keybind",
        NoUI = false,
        Callback = function(Value)
        end
    }
)

WorldGroup:AddToggle(
    "Kill Aura If Creds",
    {
        Text = "Kill Aura if Creds",
        Default = false,
        Tooltip = "Instant Kill",
        Callback = function(Value)
            MainVariables.killauraifcreds = Value
            if Value then
                killAuraIfCredsConnection =
                    RunService.RenderStepped:Connect(
                    function()
                        if MainVariables.killauraifcreds then
                            for i, v in ipairs(workspace.Entities:GetChildren()) do
                                if v:IsA("Model") and not game.Players:FindFirstChild(v.Name) then
                                    if v:FindFirstChild("Humanoid") then
                                        local humanoid = v:FindFirstChild("Humanoid")
                                        if humanoid then
                                            local healthPercentage = (humanoid.Health / humanoid.MaxHealth) * 100
                                            if healthPercentage < MainVariables.killaurahp then
                                                humanoid.Health = 0
                                                humanoid.MaxHealth = 0
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                )
            elseif killAuraIfCredsConnection then
                killAuraIfCredsConnection:Disconnect()
            end
        end
    }
):AddKeyPicker(
    "KillAuraIfCredsKeybind",
    {
        Default = "",
        SyncToggleState = true,
        Mode = "Toggle",
        Text = "Kill Aura if Creds Keybind",
        NoUI = false,
        Callback = function(Value)
        end
    }
)
WorldGroup:AddSlider(
    "Kill Aura Creds HP Threshold",
    {
        Text = "Kill Aura HP Threshold %",
        Default = 100,
        Min = 0,
        Max = 100,
        Rounding = 0,
        Compact = true,
        Callback = function(Value)
            MainVariables.killaurahp = Value
        end
    }
)
WorldGroup:AddButton(
    "Go to quest marker",
    function()
        if Character:FindFirstChild("MissionIcon") then
            coords(Character.MissionIcon.Position.X, Character.MissionIcon.Position.Y, Character.MissionIcon.Position.Z)
        else
            warn("No Mission")
        end
        if Character:FindFirstChild("BoxDeliveryIcon") then
            coords(
                Character.BoxDeliveryIcon.Position.X,
                Character.BoxDeliveryIcon.Position.Y,
                Character.BoxDeliveryIcon.Position.Z
            )
        else
            warn("No Box Icon")
        end
    end
)
WorldGroup:AddButton(
    "Go to Event marker",
    function()
        if Character:FindFirstChild("EventMarker") then
            coords(Character.EventMarker.Position.X, Character.EventMarker.Position.Y, Character.EventMarker.Position.Z)
        else
            warn("no event ")
        end
    end
)
WorldGroup:AddButton(
    "Go to Nearest Loot Crate",
    function()
        local nearestGiftbox
        local shortestDistance = math.huge

        for _, giftbox in pairs(workspace:GetChildren()) do
            if giftbox.Name == "giftbox_blend" then
                local distance =
                    (giftbox.WorldPivot.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                if distance < shortestDistance then
                    shortestDistance = distance
                    nearestGiftbox = giftbox
                end
            end
        end

        if nearestGiftbox then
            coords(
                nearestGiftbox.WorldPivot.Position.X,
                nearestGiftbox.WorldPivot.Position.Y,
                nearestGiftbox.WorldPivot.Position.Z
            )
        else
            warn("No giftbox_blend found in the workspace.")
        end
    end
)
WorldGroup:AddButton(
    "Go to Nearest Artifact",
    function()
        local nearestArtifact
        local shortestDistance = math.huge

        for _, giftbox in pairs(workspace:GetChildren()) do
            if string.find(giftbox.Name, "Artifact") then
                local distance =
                    (giftbox.WorldPivot.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                if distance < shortestDistance then
                    shortestDistance = distance
                    nearestArtifact = giftbox
                end
            end
        end

        if nearestArtifact then
            coords(
                nearestArtifact.WorldPivot.Position.X,
                nearestArtifact.WorldPivot.Position.Y,
                nearestArtifact.WorldPivot.Position.Z
            )
        else
            warn("No Artifact found in the workspace.")
        end
    end
)
local SelectedArea
WorldGroup:AddDropdown(
    "AreaDropdown",
    {
        Values = {
            "Anteiku",
            "Art Studio",
            "Clothing Store",
            "CCG Base",
            "Boss Arenas",
            "Ghoul Mission Board 1",
            "CCG Mission Board 1"
        },
        Default = {},
        Multi = false,
        Text = "Areas",
        Tooltip = "Select Area to tp to",
        Callback = function(Value)
            SelectedArea = Value
        end
    }
)
WorldGroup:AddButton(
    "Goto Selected Area",
    function()
        if SelectedArea == "Anteiku" then
            coords(8461.96582, 20.8455334, 1682.95093)
        end
        if SelectedArea == "Art Studio" then
            coords(8112.271, 8.47572327, -1640.54663)
        end
        if SelectedArea == "Clothing Store" then
            coords(8026.98535, 6.97037315, 1923.37378)
        end
        if SelectedArea == "CCG Base" then
            coords(7758.47509765625, -6.504365921020508, -654.6971435546875)
        end
        if SelectedArea == "Boss Arenas" then
            coords(7714.3271484375, -5.3807783126831055, -984.1307373046875)
        end
        if SelectedArea == "Ghoul Mission Board 1" then
            coords(8447.2578125, -4.508382320404053, 1730.5115966796875)
        end
        if SelectedArea == "CCG Mission Board 1" then
            coords(7696.603515625, 23.998931884765625, -689.2974853515625)
        end
    end
)
VisualMiscGroup:AddToggle(
    "StreamerMode",
    {
        Text = "Streamer Mode",
        Default = false,
        Tooltip = "Hides your UID",
        Callback = function(Value)
            game:GetService("Players").LocalPlayer.PlayerGui.ClientInfo.Section1.Visible = not Value
        end
    }
)
local originalDensity = 0.44999998807907104 --i dont even know what im doing

VisualMiscGroup:AddToggle(
    "NoFog",
    {
        Text = "No Fog",
        Default = false,
        Tooltip = "Removes Fog",
        Callback = function(Value)
            if Value then
                if Lighting:FindFirstChild("Atmosphere") then
                    Lighting.Atmosphere.Density = 0
                end
            else
                if Lighting:FindFirstChild("Atmosphere") then
                    Lighting.Atmosphere.Density = originalDensity
                end
            end
        end
    }
)
local NoWeatherConnection
VisualMiscGroup:AddToggle(
    "No Weather",
    {
        Text = "No Weather",
        Default = false,
        Tooltip = "Removes Weather",
        Callback = function(Value)
            if Value then
                for i, v in ipairs(workspace.DebrisFolder:GetChildren()) do
                    if string.find(v.Name, "Weather") then
                        v:Destroy()
                    end
                end
                NoWeatherConnection =
                    workspace.DebrisFolder.DescendantAdded:Connect(
                    function(descendant)
                        if string.find(descendant.Name, "Weather") then
                            descendant:Destroy()
                        end
                    end
                )
            else
                if NoWeatherConnection then
                    NoWeatherConnection:Disconnect()
                    NoWeatherConnection = nil
                end
            end
        end
    }
)

local fullbrightConnection = nil

VisualMiscGroup:AddToggle(
    "FullBright",
    {
        Text = "FullBright",
        Default = false,
        Tooltip = "Turns off darkness and shadows",
        Callback = function(Value)
            MainVariables.fullbright = Value
            if Value then
                fullbrightConnection =
                    game:GetService("RunService").RenderStepped:Connect(
                    function()
                        game.Lighting.Brightness = MainVariables.Brightness or 2
                        game.Lighting.ClockTime = 14
                        game.Lighting.FogEnd = 100000
                        game.Lighting.GlobalShadows = false
                        game.Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
                    end
                )
            else
                game.Lighting.Brightness = 1
                game.Lighting.ClockTime = 14
                game.Lighting.FogEnd = 1000000
                game.Lighting.GlobalShadows = true
                game.Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
                if fullbrightConnection then
                    fullbrightConnection:Disconnect()
                    fullbrightConnection = nil
                end
            end
        end
    }
)

VisualMiscGroup:AddSlider(
    "Brightness",
    {
        Text = "Brightness",
        Default = 2,
        Min = 0,
        Max = 10,
        Rounding = 1,
        Callback = function(Value)
            MainVariables.Brightness = Value
        end
    }
)

--MISC
MiscGroup:AddButton(
    "Serverhop",
    function()
        serverhop()
    end
)
MiscGroup:AddInput(
    "JobID",
    {
        Default = "",
        Numeric = false,
        Finished = false,
        Text = "JobID",
        Tooltip = "Job ID",
        Placeholder = "",
        Callback = function(Value)
        end
    }
)
MiscGroup:AddButton(
    {
        Text = "Join Server",
        Func = function()
            game:GetService("TeleportService"):TeleportToPlaceInstance(
                game.PlaceId,
                Options.JobID.Value,
                Players.LocalPlayer
            )
        end,
        Tooltip = "Join Server, Add the JobId on the textbox or uses the latest clipboard if empty"
    }
)
MiscGroup:AddButton(
    "Teleport to Permadeath Server",
    function()
        local foundServer = false
        game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("ServerListUI").Enabled = true
        task.wait(.1)
        for i, v in ipairs(
            game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("ServerListUI").Container.CosmeticInterface.ScrollingFrame:GetChildren(

            )
        ) do
            if v:IsA("TextButton") then
                if string.find(v.ServerName.Text, "PERMADEATH") then
                    local current, max = string.match(v.ServerSize.Text, "(%d+)%s*/%s*(%d+)")
                    if current and max then
                        current = tonumber(current)
                        max = tonumber(max)
                        if current < max then
                            foundServer = true
                            GuiService.SelectedObject = v
                            task.wait(.1)
                            VIM:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                            task.wait(0)
                            VIM:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
                            task.wait(.1)
                            v.Active = false
                            GuiService.SelectedObject = nil
                            break
                        end
                    end
                end
            end
        end

        if not foundServer then
            Library:Notify("No permadeath server found", 10)
        end

        task.wait(.1)
        game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("ServerListUI").Enabled = false
    end
)
MiscGroup:AddToggle(
    "ModNotifier",
    {
        Text = "Mod Notifier",
        Default = false,
        Tooltip = "Notifies if a Moderator joined",
        Callback = function(Value)
            MainVariables.ModNotifer = Value
        end
    }
)
MiscGroup:AddToggle(
    "KickIfMod",
    {
        Text = "Kick if Mod joined",
        Default = false,
        Tooltip = "Kick yourself when a moderator joined the server",
        Callback = function(Value)
            MainVariables.kickifmod = Value
        end
    }
)
game.Players.PlayerAdded:Connect(
    function(plr)
        if MainVariables.ModNotifer then
            if plr:GetRankInGroup(34160477) > 1 then
                Library:Notify("A Moderator has joined: " .. plr.Name, 20)
            end
        end
        if MainVariables.kickifmod then
            if plr:GetRankInGroup(34160477) > 1 then
                LocalPlayer:Kick("A Moderator has joined: " .. plr.Name)
            end
        end
    end
)
local function setCameraSubject(player)
    local character = player.Character
    if character and character:FindFirstChild("Humanoid") then
        workspace.CurrentCamera.CameraSubject = character.Humanoid
    end
end

local function resetCameraSubject()
    local character = LocalPlayer.Character
    if character and character:FindFirstChild("Humanoid") then
        workspace.CurrentCamera.CameraSubject = character.Humanoid
    end
end

local function connectButtonEvents(textButton)
    local playerName = textButton.Name
    local player = Players:FindFirstChild(playerName)

    textButton.MouseButton1Down:Connect(
        function()
            if MainVariables.spectateplayers and player then
                setCameraSubject(player)
            end
        end
    )

    textButton.MouseButton1Up:Connect(
        function()
            if MainVariables.spectateplayers then
                resetCameraSubject()
            end
        end
    )

    textButton.MouseLeave:Connect(
        function()
            if MainVariables.spectateplayers then
                resetCameraSubject()
            end
        end
    )
end

local function connectAllButtonEvents()
    for _, v in ipairs(game:GetService("Players").LocalPlayer.PlayerGui.Leaderboard.Leaderboard:GetChildren()) do
        if v:IsA("ImageButton") then
            connectButtonEvents(v)
        end
    end
end

local function disconnectAllButtonEvents()
    for _, v in ipairs(game:GetService("Players").LocalPlayer.PlayerGui.Leaderboard.Leaderboard:GetChildren()) do
        if v:IsA("TextBuImageButtontton") then
            v.MouseButton1Down:Disconnect()
            v.MouseButton1Up:Disconnect()
            v.MouseLeave:Disconnect()
        end
    end
end

game:GetService("Players").LocalPlayer.PlayerGui.Leaderboard.Leaderboard.ChildAdded:Connect(
    function(child)
        if child:IsA("ImageButton") then
            connectButtonEvents(child)
        end
    end
)

MiscGroup:AddToggle(
    "SpectatePlayer",
    {
        Text = "Spectate Players",
        Default = false,
        Tooltip = "Hold down the username from the leaderboard",
        Callback = function(Value)
            MainVariables.spectateplayers = Value
            if MainVariables.spectateplayers then
                connectAllButtonEvents()
            else
                disconnectAllButtonEvents()
                resetCameraSubject()
            end
        end
    }
)
MiscGroup:AddToggle(
    "FPS Unlockers",
    {
        Text = "FPS Unlocker",
        Default = false,
        Tooltip = "FPS Unlocker",
        Callback = function(Value)
            MainVariables.fpsunlocker = Value
            if not MainVariables.fpsunlocker then
                setfpscap(120)
            end
        end
    }
)
MiscGroup:AddInput(
    "FPS",
    {
        Default = 120,
        Numeric = true,
        Finished = true,
        Text = "FPS",
        Tooltip = "FPS",
        Placeholder = "",
        Callback = function(Value)
            if MainVariables.fpsunlocker then
                setfpscap(tonumber(Value))
            end
        end
    }
)

Library:OnUnload(
    function()
        print("Unloaded!")
        Library.Unloaded = true
    end
)

local FrameTimer, FrameCounter, FPS = tick(), 0, 60

local WatermarkConnection =
    game:GetService("RunService").RenderStepped:Connect(
    function()
        FrameCounter = FrameCounter + 1
        if (tick() - FrameTimer) >= 1 then
            FPS = FrameCounter
            FrameTimer, FrameCounter = tick(), 0
        end
        Library:SetWatermark(
            ("XES Hub | %s fps | %s ms"):format(
                math.floor(FPS),
                math.floor(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue())
            )
        )
    end
)

Library:OnUnload(
    function()
        WatermarkConnection:Disconnect()
        print("Unloaded!")
        Library.Unloaded = true
    end
)

local MenuGroup = Tabs["UI Settings"]:AddLeftGroupbox("Menu")
MenuGroup:AddButton(
    "Unload",
    function()
        Library:Unload()
    end
)
MenuGroup:AddLabel("Menu bind"):AddKeyPicker("MenuKeybind", {Default = "End", NoUI = true, Text = "Menu keybind"})
Library.ToggleKeybind = Options.MenuKeybind
MenuGroup:AddToggle(
    "KeybindPanel",
    {
        Text = "Keybinds Menu",
        Default = true,
        Callback = function(Value)
            Library.KeybindFrame.Visible = Value
        end
    }
)
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
ThemeManager:SetFolder("SexHub")
SaveManager:SetFolder("SexHub/specific-game")
SaveManager:BuildConfigSection(Tabs["UI Settings"])
ThemeManager:ApplyToTab(Tabs["UI Settings"])
SaveManager:LoadAutoloadConfig()
