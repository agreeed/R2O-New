if not game:IsLoaded() then
	game.Loaded:Wait()
end

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Lighting = Lighting

if game.PlaceId == 6403373529 or game.PlaceId == 11520107397 or game.PlaceId == 9015014224 then
	local bypass;
	bypass = hookmetamethod(game, "__namecall", function(method, ...) 
		if getnamecallmethod() == "FireServer" and method == ReplicatedStorage.Ban then
			return
		elseif getnamecallmethod() == "FireServer" and method == ReplicatedStorage.AdminGUI then
			return
		elseif getnamecallmethod() == "FireServer" and method == ReplicatedStorage.WalkSpeedChanged then
			return
		end
		return bypass(method, ...)
	end)

	if setfpscap then 
		setfpscap(12569)
	end


	local Gloves = loadstring(game:HttpGet("https://raw.githubusercontent.com/agreeed/R2O-New/main/Files/Gloves.lua"))()
	local Functions = loadstring(game:HttpGet("https://raw.githubusercontent.com/cheesynob39/R2O/main/Files/Functions.lua"))()
	local Coasting = loadstring(game:HttpGet(("https://raw.githubusercontent.com/cheesynob39/Coasting/main/Source.lua")))()

	local function getGlove()
		return Player.leaderstats.Glove.Value
	end
		
	local Farms = Coasting:CreateTab("Autofarms")
	local Farms1 = Farms:CreateSection("Slaps")
	local Farms2 = Farms:CreateSection("Badges")

	local Combat = Coasting:CreateTab("Combat")
	local Combat1 = Combat:CreateSection("Main")
	local Combat2 = Combat:CreateSection("Godmodes")
	
	local Perks = Coasting:CreateTab("Perks")
	local Perks1 = Perks:CreateSection("Anti Stuff")
	local Perks2 = Perks:CreateSection("Other Stuff")
	
	local Plr = Coasting:CreateTab("Player")
	local Plr1 = Plr:CreateSection("Local")
	local Plr2 = Plr:CreateSection("FE")

	local Credits = Coasting:CreateTab("Credits")
	local Credits1 = Credits:CreateSection("Coding")
	local Credits2 = Credits:CreateSection("Design")

	local spamBob = Farms2:CreateToggle("Bob Farm", function(bool)
		autoBob = bool
		if autoBob then
			while autoBob and task.wait() do
				ReplicatedStorage.Duplicate:FireServer(true);
				wait(5.1)
			end
		end
	end)

	local slabbleFarm = Farms2:CreateToggle("Slapple Farm", function(bool)
		slappleFarm = bool
		if bool == true then
			while slappleFarm do
				wait()
				for Index, Instance in next, workspace.Arena.island5.Slapples:GetDescendants() do
					if Instance:IsA("TouchTransmitter") then
						firetouchinterest(Player.Character.Head, Instance.Parent, 0)
						firetouchinterest(Player.Character.Head, Instance.Parent, 1)
					end
				end
			end
		end
	end)

	local rGOD = Combat2:CreateToggle("Reverse Godmode", function(bool)
		autoReverse = bool
		if bool == true then
			while autoReverse and task.wait() do
				local Character = workspace:WaitForChild(Player.Name)
				if Player.leaderstats.Glove.Value == "Reverse" and Character:FindFirstChild("entered") then
					task.wait(5.7)
					ReplicatedStorage:WaitForChild("ReverseAbility"):FireServer()
				end
			end
		end
	end)


	local slapFarm = Farms1:CreateToggle("Universal Slap Farm", function(bool)
		allFarming = bool
		if bool == true then
			setfpscap(50)
			workspace.DEATHBARRIER.CanTouch = false
			workspace.DEATHBARRIER2.CanTouch = false
			workspace.dedBarrier.CanTouch = false
			
			while allFarming and task.wait() do
				pcall(function()
					for Index, Human in next, game.Players:GetPlayers() do
						if Human ~= Player and Human.Character and not Human.Character:FindFirstChild("isParticipating") and Human.Character:FindFirstChild("Torso") and Human.Character:FindFirstChild("Head") and Human.Character:FindFirstChild("entered") and Human.Character.Head:FindFirstChild("UnoReverseCard") == nil and Human.Character:FindFirstChild("rock") == nil and Human.Character.Ragdolled.Value == false then
							if Player.Character:FindFirstChild("entered") and Player.Character:FindFirstChild("HumanoidRootPart") then                             
								task.wait(.1)
								Player.Character:WaitForChild("HumanoidRootPart").CFrame = Human.Character:FindFirstChild("Right Leg").CFrame * CFrame.new(6,-5,6)   

								task.wait()
								Player.Character:WaitForChild("Humanoid").PlatformStand = true

								wait(.25)
								shared.gloveHits[getGlove()]:FireServer(Human.Character:FindFirstChild("Torso"))

								wait(.25)
							end
						end
					end
				end) 
			end
		else
			setfpscap(1269)
			workspace.DEATHBARRIER.CanTouch = true
			workspace.DEATHBARRIER2.CanTouch = true
			workspace.dedBarrier.CanTouch = true
			-------------------------------------------------------------------------
			if Player.Character.Humanoid.PlatformStand == true then
				task.wait(3)
				Player.Character.Humanoid.PlatformStand = false
			end
		end
	end)

	local autoShukuchi = Combat1:CreateToggle("Bully People [ Shukuchi ] ", function(bool)
		autoShuk = bool
		if bool == true then
			while autoShuk do
				task.wait()
				pcall(function()
					if getGlove() == "Shukuchi" then
						for i,x in pairs(game.Players:GetPlayers()) do
							if x ~= Player and x.Character and 150 >= (Player.Character.HumanoidRootPart.Position - x.Character.HumanoidRootPart.Position).Magnitude then
								ReplicatedStorage.SM:FireServer(x)
							end
						end
					end
				end)
			end
		end
	end)

	local spamExplode = Combat1:CreateToggle("Explosion Aura [ OP ]", function(bool)
		spamExplode = bool
		if spamExplode then
			while spamExplode and task.wait(.01) do
				ReplicatedStorage:WaitForChild("rhythmevent"):FireServer("AoeExplosion", 86)
			end
		end
	end)

	local cloud = Combat1:CreateButton("Create Cloud", function()
		ReplicatedStorage.CloudAbility:FireServer()
	end)
	local gcloud = Combat1:CreateButton("Create Golden Cloud", function()
		ReplicatedStorage.NimbusAbility:FireServer()
	end)
	local snull = Combat1:CreateButton("Spawn Null", function()
		ReplicatedStorage.NullAbility:FireServer()
	end)

	local function whitelisted(name)
		whitelist = {"Hgfejjhhhgtyht", "Niique_95", "HDUSSJSD", "justiceKid599", "antonimiento"}
		included = false

		for i, v in pairs(whitelist) do
			if v == name then
				included = true
				break
			end
		end

		return not included
	end

	local killAura = Combat1:CreateToggle("Slap Aura", function(bool)
		slapAura = bool
		if bool == true then
			while slapAura do
				task.wait(.005)  
				local s,e = pcall(function()    
					for Index, Player_ in next, game.Players:GetPlayers() do
						if Player_ ~= Player and Player_.Character and Player.Character:FindFirstChild("entered") and whitelisted(Player_.Name) then
							if Player_.Character:FindFirstChild("Head") then
								if Player_.Character.Head:FindFirstChild("UnoReverseCard") == nil and Player_.Character:FindFirstChild("rock") == nil then
									if Player_.Character:FindFirstChild("HumanoidRootPart") then
										local Magnitude = (Player.Character.HumanoidRootPart.Position - Player_.Character.HumanoidRootPart.Position).Magnitude
										
										task.wait()
										if 25 >= Magnitude then
											shared.gloveHits[getGlove()]:FireServer(Player_.Character:WaitForChild("Head"))
										end
									end
								end
							end
						end
					end
				end)

				if not s then
					warn(e)
				end
			end 
		end
	end)

	local antiFall = Combat2:CreateToggle("Anti Ragdoll", function(bool)
		antiRagdoll = bool
		if bool == true then
			Player.Character.Humanoid.Health = 0
			
			task.wait()
			Player.CharacterAdded:Connect(function(Character)
				
				task.wait()
				Character:WaitForChild("Ragdolled").Changed:Connect(function()
					if Character:WaitForChild("Ragdolled").Value == true and antiRagdoll == true then
						repeat task.wait()
							Character.Torso.Anchored = true
						until Character:FindFirstChild("Torso") == nil or Character:WaitForChild("Ragdolled").Value == false
						
						----------------------------------------------------------------------------------------------------
						Character.Torso.Anchored = false
					end
				end)
			end)
		end
	end)

	local autoEnter = Perks2:CreateToggle("Auto Enter Arena", function(bool)
		autoJoin = bool
		if bool == true then
			while autoJoin do
				wait()
				repeat task.wait() until Player.Character
					if not Player.Character:FindFirstChild("entered") and Player.Character:FindFirstChild("HumanoidRootPart") then
					repeat task.wait(.005)
						firetouchinterest(Player.Character:WaitForChild("Head"), workspace.Lobby.Teleport1.TouchInterest.Parent, 0)
						firetouchinterest(Player.Character:WaitForChild("Head"), workspace.Lobby.Teleport1.TouchInterest.Parent, 1)
					until Player.Character:FindFirstChild("entered")
				end
			end
		end
	end)

	local antiAdmins = Perks1:CreateToggle("Anti Admins", function(bool)
		antiAdmins = bool
		if bool == true then
			game.Players.PlayerAdded:Connect(function(Plr)
				if Plr:GetRankInGroup(9950771) and 7 <= Plr:GetRankInGroup(9950771) and antiAdmins then
					Player:Kick("Admin Detected 🔥")
				end
			end)
		end
	end)

	local anticccon
	local antiCC = Perks1:CreateToggle("Anti ColorCorrection", function(bool)
		antiCC = bool

		if bool == true then
			anticccon = Lighting.ChildAdded:Connect(function(v)
				if v:IsA("ColorCorrectionEffect") then
					v.Enabled = false
					v:Destroy()
				end
			end)
		elseif bool == false then
			anticccon:Disconnect()
		end
	end)
	
	local antigecon1
	local antigecon2
	local antige = Perks1:CreateToggle("Anti Ghost Effect", function(bool)
		antige = bool
		if bool == true then
			antigecon1 = Lighting.ChildAdded:Connect(function(v)
				if v:IsA("Sky") and v.Name == "Creepysky" then
					ReplicatedStorage.Sky:Clone().Parent = Lighting
					v:Destroy()
				end
				if v:IsA("ColorCorrectionEffect") and v.Name == "dimensioncolor" then
					v.Enabled = false
					v:Destroy()
				end
			end)
			antigecon2 = Lighting:GetPropertyChangedSignal("ExposureCompensation"):Connect(function()
				if Lighting.ExposureCompensation ~= 0 then
					Lighting.ExposureCompensation = 0
				end
			end)
		elseif bool == false then
			antigecon1:Disconnect()
			antigecon2:Disconnect()
		end
	end)
	
	local antincon
	local antin = Perks1:CreateToggle("Anti Nightmare", function(bool)
		antin = bool
		if bool == true then
			antincon = Player:GetPropertyChangedSignal("CameraMode"):Connect(function()
				if Player.CameraMode ~= Enum.CameraMode.Classic then
					Player.CameraMode = "Classic"
				end
			end)
		elseif bool == false then
			antincon:Disconnect()
		end
	end)

	local antiHJack = Perks1:CreateToggle("Anti Hallow-Jack", function(bool)
		antiHallow = bool
		if bool == true then
			Player.PlayerScripts.HallowJackAbilities.Disabled = true
		else
			Player.PlayerScripts.HallowJackAbilities.Enabled = true
		end
	end)

	local antiZHando = Perks1:CreateToggle("Anti Za Hando", function(bool)
		antiZH = bool
		if bool == true then
			while antiZH do
				wait(.001)
				for i,v in pairs(workspace:GetChildren()) do
					if v:IsA("Part") and v.Name == "Part" then
						v:Destroy()
					end 
				end 
			end
		end
	end)

	local antiReap = Perks1:CreateToggle("Anti Reaper", function(bool)
		antiReaper = bool
		if bool == true then
			while antiReaper do
				wait(.001)
				for i,v in pairs(Player.Character:GetChildren()) do
					if v.Name == "DeathMark" then
						ReplicatedStorage.ReaperGone:FireServer(Player.Character.DeathMark)
						Lighting:WaitForChild("DeathMarkColorCorrection"):Destroy()
					end 
				end
			end
		end
	end)

	local antiPush = Perks1:CreateToggle("Anti Pusher", function(bool)
		antiPusher = bool
		if bool == true then
			while antiPusher do
				wait(.001)
				for i,v in pairs(workspace:GetChildren()) do
					if v.Name == "wall" then
						v.CanCollide = false
					end
				end
			end
		end
	end)

	local antiBoost = Perks1:CreateToggle("Anti Booster", function(bool)
		antiBooster = bool
		if bool == true then
			if Player.Character:FindFirstChild("BoosterObject", 1) then
				Player.Character:FindFirstChild("BoosterObject", 1):Destroy()
			end
			task.wait()
			Player.Character.DescendantAdded:Connect(function(v)
				if antiBooster == true then
					if v.Name == "BoosterObject" then
						task.wait(.1)
						v:Destroy()
					end
				end
			end)
		end
	end)
	
	local antiMailPopup = Perks1:CreateToggle("Anti Mail", function(bool)
		antiMail = bool
		if bool == true then
			Player.PlayerGui.DescendantAdded:Connect(function(UI)
				if antiMail == true then
					if UI.Name == "MailPopup" then
						UI.Frame.Visible = false
						task.wait()
						Player.Character.Head.MailIcon:Destroy()
					end
				end
			end)
		else
			if Player.PlayerGui:FindFirstChild("MailPopup") then
				Player.PlayerGui.MailPopup.Frame.Visible = true
				task.wait()
			end
		end
	end)
	
	local antiStunGlove = Perks1:CreateToggle("Anti Stun", function(bool)
		antiStun = bool
		if bool == true then
			while antiStun do
				task.wait()
				if Player.Character:FindFirstChild("Humanoid") and Player.Character.Humanoid.PlatformStand == true and not Farming and not allFarming and not Player.Character.Ragdolled.Value == true and workspace:FindFirstChild("Shockwave") then
					Player.Character.Humanoid.PlatformStand = false
				end
			end
		end
	end)

	local DisableCOD = Perks2:CreateToggle("Disable Cube Of Death", function(bool)
		if bool == true then
			if workspace:FindFirstChild("the cube of death(i heard it kills)", 1) then
				workspace.Arena.CubeOfDeathArea["the cube of death(i heard it kills)"].CanTouch = false
			end
		else 
			if workspace:FindFirstChild("the cube of death(i heard it kills)", 1) then  
				workspace.Arena.CubeOfDeathArea["the cube of death(i heard it kills)"].CanTouch = true
			end
		end
	end)
	
	local noName = Perks2:CreateToggle("Auto Remove Name", function(bool)
		Auto_Remove = bool
		if bool == true then
			Player.Character:FindFirstChild("Head").Nametag.TextLabel:Destroy()
			task.wait()
			Player.CharacterAdded:Connect(function()
				if Auto_Remove == true then
					repeat task.wait() until Player.Character:FindFirstChild("Head")
					Player.Character:FindFirstChild("Head").Nametag.TextLabel:Destroy()
				end
			end)
		end
	end)
	
	local invisReverse = Plr2:CreateToggle("Invisible Reverse [ FE ] ", function(bool)
		Invis_Reverse = bool
		if bool == true then
			while Invis_Reverse do
				repeat wait(.005) until Player.Character:FindFirstChild("SelectionBox", 1) and Player.Character:FindFirstChild("Head"):FindFirstChild("UnoReverseCard")
				Player.Character.Head["UnoReverseCard"]:Destroy()
				for i,v in pairs(Player.Character:GetDescendants()) do
					if v.Name == "SelectionBox" then
						v:Destroy()
					end
				end
			end
		end
	end)

	local fishTimer = Farms2:CreateToggle("Fish Farm", function(bool)
		fishFarm = bool
		if bool == true then 
			if Player.Character:FindFirstChild("entered") and getGlove() == "ZZZZZZZ" then            
				Player.Character.HumanoidRootPart.CFrame = workspace["Bed [ OvErCrInGe02#0658 ] "].Bed3.CFrame * CFrame.new(0,0,-1)
				task.wait(.5)
				ReplicatedStorage.ZZZZZZZSleep:FireServer()
			else
				print("FAILED TO TELEPORT TO SAFE SPOT PLEASE DO IT MANUALLY")
			end
			task.wait()
	
			while fishFarm and task.wait() do
				if getGlove() == "ZZZZZZZ" and workspace:WaitForChild(Player.Name):FindFirstChild("entered") then
					if workspace:WaitForChild(Player.Name):FindFirstChild("Ragdolled").Value then
						task.wait(1)
						Time = Time + 1
						print("You Have Been Asleep For: " .. Time .. " Seconds. You Have: " .. (3600 - Time) .. " Seconds Left")
					else
						Time = 0
					end
				end
			end
		else
			Player.Character.Humanoid.Health = 0
		end
	end)

	local getTycoon = Farms2:CreateButton("Get Tycoon", function()
		if not game:GetService("BadgeService"):UserHasBadgeAsync(Player.UserId, 2129212145) then
			if Player.Character:FindFirstChild("entered") == nil then    
				repeat task.wait(.5)   
					firetouchinterest(Player.Character:FindFirstChild("Head"), workspace.Lobby.Teleport1.TouchInterest.Parent, 0)
					firetouchinterest(Player.Character:FindFirstChild("Head"), workspace.Lobby.Teleport1.TouchInterest.Parent, 1)          
				until Player.Character:FindFirstChild("entered") 
			end
			task.wait()
			repeat task.wait(.5)
				Player.Character.HumanoidRootPart.CFrame = workspace.Arena.Plate.CFrame * CFrame.new(0,-2,0)   
			until game:GetService("BadgeService"):UserHasBadgeAsync(Player.UserId, 2129212145) 
			-----------------------------------------------------------------------------------------------------------------------
			Player.Character.HumanoidRootPart.CFrame = workspace.Arena.Plate.CFrame * CFrame.new(0,2,0)
		end
	end)
		
	local getRedacted = Farms2:CreateButton("Get [ REDACTED ] ", function()
		local Door = 1
		if not game:GetService("BadgeService"):UserHasBadgeAsync(Player.UserId, 2124847850) and 5000 <= Player.leaderstats.Slaps.Value then
			repeat task.wait(.25)
				Player.Character.HumanoidRootPart.CFrame = workspace.PocketDimension.Doors[Door].CFrame
				Door = Door + 1
				print(Door)
				wait(5)
			until game:GetService("BadgeService"):UserHasBadgeAsync(Player.UserId, 2124847850)
		else 
			print("YOU ALREADY HAVE [ R E D A C T E D ] !!")
			print("OR YOU DONT HAVE 5K SLAPS")
		end
	end)
			
	local antiVoid = Perks2:CreateToggle("Anti Void", function(noVoid)
		if noVoid == true then
			for i,v in pairs(workspace:GetDescendants()) do
				if v.Name == "dedBarrier"  or v.Name == "ArenaBarrier" or v.Name == "DEATHBARRIER" or v.Name == "DEATHBARRIER2" then               
					v.CanCollide = true
					v.Material = "ForceField"
					v.Color = Color3.new(255,255,255)
					v.Transparency = .9
				end  
			end 
		else
			for i,v in pairs(workspace:GetDescendants()) do
				if v.Name == "dedBarrier"  or v.Name == "ArenaBarrier" or v.Name == "DEATHBARRIER" or v.Name == "DEATHBARRIER2" then               
					v.CanCollide = false
					v.Transparency = 1
				end  
			end
		end
	end)
	
	local antiSquid = Perks1:CreateToggle("Anti Squid", function(bool)
		AntiSquid = bool
			if bool == true then
				while AntiSquid do
					task.wait()
					for i,v in pairs(Player.PlayerGui.SquidInk:GetChildren()) do
						if v.Parent then
							v:Destroy()
						end
					end
				end
			end
	end)
	
	local walkSpeed = Plr1:CreateSlider("Walkspeed", 20, 300, 20, false, function(WS)
		Player.Character.Humanoid.WalkSpeed = WS
		WS1 = WS
	end)

	local autoWS = Plr1:CreateToggle("Auto Set WalkSpeed", function(bool)
		autoSet1 = bool
		if bool == true then
			while autoSet1 do
				task.wait()
				local Character = workspace:WaitForChild(Player.Name)
				if Character:FindFirstChild("Humanoid") ~= nil and Character.Humanoid.WalkSpeed ~= WS1 then
					Character:FindFirstChild("Humanoid").WalkSpeed = WS1
				end
			end
		end
	end)
	
	local jumpPower = Plr1:CreateSlider("Jump Power", 50, 300, 50, false, function(JP)
		Player.Character.Humanoid.JumpPower = JP
		WS2 = JP
	end)
		
	local autoSJ = Plr1:CreateToggle("Auto Set JumpPower", function(bool)
		autoSet2 = bool
		if bool == true then
			while autoSet2 do
				task.wait()
				local Character = workspace:WaitForChild(Player.Name)
				if Character:FindFirstChild("Humanoid") ~= nil and Character.Humanoid.JumpPower ~= WS2 then
					Character:FindFirstChild("Humanoid").JumpPower = WS2
				end
			end
		end
	end)
	
	local errSpam = Plr2:CreateToggle("Spam Error Sound", function(bool)
		errorSpam = bool
		if bool == true then
			while errorSpam do
				task.wait()
				ReplicatedStorage.ErrorDeath:FireServer()
			end
		end
	end)
	
	local spamThanos = Plr2:CreateToggle("Spam Thanos Sound", function(bool)
		autoThanos = bool
		if bool == true then
			while autoThanos do
				task.wait()
				if getGlove() == "Thanos" then
					task.wait()
					ReplicatedStorage.Illbeback:FireServer()
				end
			end
		end
	end)
	
	local spamZG = Plr2:CreateToggle("Spam Space Sound", function(bool)
		spamSpace = bool
		if bool == true then
			while spamSpace do
				task.wait()
				if getGlove() == "Space" then
					ReplicatedStorage["ZeroGSound"]:FireServer()
					Player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Landed)
				end
			end
		else
			for x = 1,5 do
				task.wait()
				Player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Landed)
			end
		end
	end)
	
	local autoInvisible = Plr2:CreateToggle("Auto Invis", function(bool)
		autoInvis = bool
		Player.CharacterAdded:Connect(function()
			if autoInvis == true and 666 <= Player.leaderstats.Slaps.Value then
				repeat task.wait()  until Player.Character:FindFirstChild("Head") and Player.Character:FindFirstChild("Head"):FindFirstChild("Nametag") ~= nil
				Player.Character.Head.Nametag:Destroy()
				ReplicatedStorage.Ghostinvisibilitydeactivated:FireServer()
				task.wait(.1)
				local gloveClick = tostring(getGlove())
				fireclickdetector(workspace.Lobby.Ghost.ClickDetector)
				task.wait(.2)
				ReplicatedStorage.Ghostinvisibilityactivated:FireServer()
				task.wait(.2)
				fireclickdetector(workspace.Lobby[gloveClick].ClickDetector)
			end 
		end)
	end)
	
	local discordTag = Credits1:CreateButton("_vxx_", function()
		if setclipboard then
			setclipboard("_vxx_")
		end
	end)
	
	local discordTag2 = Credits2:CreateButton("_vxx_", function()       
		if setclipboard then
			setclipboard("_vxx_")
		end
	end)
	
	local discordInvite = Credits2:CreateButton("Discord Invite", function()
		if setclipboard then
			setclipboard("https://discord.gg/zty372wma5")
		end
	end)
end

shared.removeBlue()
shared.autofarmTab()
shared.createBed()
shared.chatPlr()
