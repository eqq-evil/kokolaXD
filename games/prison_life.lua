--[[local function GetPos()
	return game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
end

local function GetCamPos()
	return workspace.CurrentCamera.CFrame
end

local function GetTeam()
	return game.Players.LocalPlayer.TeamColor.Name
end

local function GetPlayer(String)
	if not String then return end
	local Yes = {}
	for _, Player in ipairs(game.Players:GetPlayers()) do
		if string.lower(Player.Name):match(string.lower(String)) or string.lower(Player.DisplayName):match(string.lower(String)) then
			table.insert(Yes, Player)
		end
	end
	if #Yes > 0 then
		return Yes[1]
	elseif #Yes < 1 then
		return nil
	end
end

local function Kill(Player)
	pcall(function()
		if Player.Character:FindFirstChild("ForceField") or not workspace:FindFirstChild(Player.Name) or not workspace:FindFirstChild(Player.Name):FindFirstChild("Head") or Player == nil or Player.Character.Parent ~= workspace then return end
		workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP)

		local MyTeam = GetTeam()
		if Player.TeamColor.Name == game.Players.LocalPlayer.TeamColor.Name then
			local savedcf = GetPos()
			local savedcamcf = GetCamPos()
			workspace.Remote.loadchar:InvokeServer(nil, BrickColor.random().Name)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = savedcf
			workspace.CurrentCamera.CFrame = savedcamcf
			workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP)
		end

		local Gun = game.Players.LocalPlayer.Character:FindFirstChild("Remington 870") or game.Players.LocalPlayer.Backpack:FindFirstChild("Remington 870")

		local FireEvent = {
			[1] = {
				["RayObject"] = Ray.new(Vector3.new(), Vector3.new()), 
				["Distance"] = 0, 
				["Cframe"] = CFrame.new(), 
				["Hit"] = workspace[Player.Name].Head
			}, [2] = {
				["RayObject"] = Ray.new(Vector3.new(), Vector3.new()), 
				["Distance"] = 0, 
				["Cframe"] = CFrame.new(), 
				["Hit"] = workspace[Player.Name].Head
			}, [3] = {
				["RayObject"] = Ray.new(Vector3.new(), Vector3.new()), 
				["Distance"] = 0, 
				["Cframe"] = CFrame.new(), 
				["Hit"] = workspace[Player.Name].Head
			}, [4] = {
				["RayObject"] = Ray.new(Vector3.new(), Vector3.new()), 
				["Distance"] = 0, 
				["Cframe"] = CFrame.new(), 
				["Hit"] = workspace[Player.Name].Head
			}, [5] = {
				["RayObject"] = Ray.new(Vector3.new(), Vector3.new()), 
				["Distance"] = 0, 
				["Cframe"] = CFrame.new(), 
				["Hit"] = workspace[Player.Name].Head
			}, [6] = {
				["RayObject"] = Ray.new(Vector3.new(), Vector3.new()), 
				["Distance"] = 0, 
				["Cframe"] = CFrame.new(), 
				["Hit"] = workspace[Player.Name].Head
			}, [7] = {
				["RayObject"] = Ray.new(Vector3.new(), Vector3.new()), 
				["Distance"] = 0, 
				["Cframe"] = CFrame.new(), 
				["Hit"] = workspace[Player.Name].Head
			}, [8] = {
				["RayObject"] = Ray.new(Vector3.new(), Vector3.new()), 
				["Distance"] = 0, 
				["Cframe"] = CFrame.new(), 
				["Hit"] = workspace[Player.Name].Head
			}
		}

		game:GetService("ReplicatedStorage").ShootEvent:FireServer(FireEvent, Gun)
		Gun.Parent = game.Players.LocalPlayer.Character
		game.Players.LocalPlayer.Character["Remington 870"]:Destroy()
	end)
end


local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/GreenDeno/Venyx-UI-Library/main/source.lua"))()
local lplr = game:GetService("Players").LocalPlayer
local w = lib.new("kokolaXD in beta")
local page1 = w:addPage("Home")

local section1 = page1:addSection("LocalPlayer")
local section2 = page1:addSection("Kill")

local toggles = {
    LoopKillAll = false,
    LoopKillInmates = false,
    LoopKillGuards = false
}

section1:addSlider("WalkSpeed",math.floor(lplr.Character.Humanoid.WalkSpeed),math.floor(lplr.Character.Humanoid.WalkSpeed),1000,function(val)
    lplr.Character.Humanoid.WalkSpeed = val
end)

section1:addSlider("JumpPower",math.floor(lplr.Character.Humanoid.JumpPower),math.floor(lplr.Character.Humanoid.JumpPower),1000,function(val)
    lplr.Character.Humanoid.JumpPower = val
end)

section2:addTextbox("Kill", "Player", function(v,l)
    local Player = GetPlayer(v)
    if l then
        if Player ~= nil then
            Kill(Player)
            w:Notify("Success", "Killed "..Player.Name)
        else
            w:Notify("Error", "No player found")
        end
    end
end)

section2:addButton("Kill all",function()
    for i,v in pairs(game.Players:GetPlayers()) do
        if v ~= game.Players.LocalPlayer then
            Kill(v)
        end
    end
    w:Notify("Success", "Killed All players")
end)

section2:addButton("Kill inmates",function()
    for i,v in pairs(game.Players:GetPlayers()) do
        if v ~= game.Players.LocalPlayer then
            if v.TeamColor.Name == "Bright orange" then
                Kill(v)
            end
        end
    end
    w:Notify("Success", "Killed All inmates")
end)

section2:addButton("Kill guards",function()
    for i,v in pairs(game.Players:GetPlayers()) do
        if v ~= game.Players.LocalPlayer then
            if v.TeamColor.Name == "Bright blue" then
                Kill(v)
            end
        end
    end
    w:Notify("Success", "Killed All guards")
end)

section2:addToggle("Loop Kill All", false, function(bool)
    toggles.LoopKillAll = bool
    if bool == true then
        w:Notify("Success", "Looping kills all")
    else
        w:Notify("Success", "Stoping looping kill all")
    end
end)

section2:addToggle("Loop Kill Inmates", false, function(bool)
    toggles.LoopKillInmates = bool
    if bool == true then
        w:Notify("Success", "Looping kills inmates")
    else
        w:Notify("Success", "Stoping looping kill inmates")
    end
end)

section2:addToggle("Loop Kill Guards", false, function(bool)
    toggles.LoopKillGuards = bool
    if bool == true then
        w:Notify("Success", "Looping kills guards")
    else
        w:Notify("Success", "Stoping looping kill guards")
    end
end)

w:SelectPage(w.pages[1], true)

if not syn_decompile then
    if not KRNL_LOADED then
        w:Notify("kokolaXD Script Support","Since you are not using synapse, I recommend you use krnl. Would you like to copy download link?",function(v)
            if v == true then
                setclipboard("https://krnl.ca")
                w:Notify("KRNL Download!", "The download link has been copied to your clipboard, Paste it in your browser for download.")
            end
        end)
    end
end

while true do
    wait(.1)
    if toggles.LoopKillAll == true then
        for i,v in pairs(game.Players:GetPlayers()) do
            if v ~= game.Players.LocalPlayer then
                Kill(v)
            end
        end
    end
    if toggles.LoopKillInmates == true then
        for i,v in pairs(game.Players:GetPlayers()) do
            if v ~= game.Players.LocalPlayer then
                if v.TeamColor.Name == "Bright orange" then
                    Kill(v)
                end
            end
        end
    end
    if toggles.LoopKillGuards == true then
        for i,v in pairs(game.Players:GetPlayers()) do
            if v ~= game.Players.LocalPlayer then
                if v.TeamColor.Name == "Bright blue" then
                    Kill(v)
                end
            end
        end
    end
end]]

game.Players.LocalPlayer:Kick("project discountinued.")
