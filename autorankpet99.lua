
local g = {}
local h = {}
local function autofarmquest1()
    local a;
    function checkquestfarmstart()
        for i, v in next, game:GetService("Players").LocalPlayer.PlayerGui.GoalsSide.Frame.Quests.QuestsGradient
            .QuestsHolder:GetChildren() do
            if v:IsA("Frame") and v:FindFirstChild("Progress") then

                b = string.sub(v.Progress.Text, 0, string.find(v.Progress.Text, '/'))
                a = string.gsub(b, '/', '')
                tonumber(a)
                while wait() do
                    return tonumber(a)
                end

            end
        end
    end

    function checkquestfarmened()
        for i, v in next, game:GetService("Players").LocalPlayer.PlayerGui.GoalsSide.Frame.Quests.QuestsGradient
            .QuestsHolder:GetChildren() do
            if v:IsA("Frame") and v:FindFirstChild("Progress") then

                b = string.sub(v.Progress.Text, 0, string.find(v.Progress.Text, '/'))
                a = string.gsub(b, '/', '')
                tonumber(a)
                while wait() do
                    return tonumber(a)
                end

            end
        end

    end
    for i, v in next, game:GetService("Players").LocalPlayer.PlayerGui.GoalsSide.Frame.Quests.QuestsGradient
        .QuestsHolder:GetChildren() do
        if v:IsA("Frame") and v:FindFirstChild("Progress") then

            if checkquestfarmstart() <= checkquestfarmened() and string.find(v.Title.Text, "Egg") then
                spawn(function()

                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                        workspace.__THINGS.Eggs.Main["1 - Egg Capsule"].WorldPivot
                    wait(0.1)
                    local function checkegg(a)
                        for i, v in pairs(workspace.__THINGS.Eggs.Main:GetChildren()) do
                            if string.find(v.Name, "Egg Capsule") and not v:FindFirstChild("EggLock") and
                                v:FindFirstChild("EggInfo") then
                                local a = tostring(v.EggInfo.Frame.Title.Text)
                                return a
                            end
                        end
                    end
                    pcall(function()

                        for i, v in pairs(workspace.__THINGS.Eggs.Main:GetChildren()) do
                            if string.find(v.Name, "Egg Capsule") and not v:FindFirstChild("EggLock") then

                                local args = {
                                    [1] = checkegg(),
                                    [2] = 1
                                }

                                game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild(
                                    "Eggs_RequestPurchase"):InvokeServer(unpack(args))

                            end
                        end
                    end)

                end)
         

            end
        end
    end
end
  function checkquestmap1()
    g={}
    for i, v in pairs(workspace.Map:GetChildren()) do
        if v:IsA("Folder") and v.INTERACT:FindFirstChild("Gate")   then
            table.insert(g, tonumber(string.match(v.Name, "%d+")))

        end
    end
    table.sort(g, function(a, b)
        return a > b
    end)    
end
function checkmap2()
    h={}
     for i, v in pairs(workspace.Map:GetChildren()) do
        if v:IsA("Folder") and not v.INTERACT:FindFirstChild("Gate")     then
            table.insert(h, tonumber(string.match(v.Name, "%d+")))
 
         
    end
    end
    table.sort(h, function(a, b)
        return a > b
    end)
end
  while _G.abcd do wait()
pcall(function()
    
 checkmap2()
 checkquestmap1()
 local n1 =     tonumber(math.max(table.unpack(h)))
  function checkmap3()
    for i, v in pairs(workspace.Map:GetChildren()) do
        if v:IsA("Folder") and tonumber(string.match(v.Name, "%d+")) == n1 then
            return v
        end
    end
end
   local n = tonumber(math.min(table.unpack(g)))-1
    function checkmap()
        for i, v in pairs(workspace.Map:GetChildren()) do
            if v:IsA("Folder") and tonumber(string.match(v.Name, "%d+")) == n then
                return v
            end
        end
    end
    for i, v in next, game:GetService("Players").LocalPlayer.PlayerGui.GoalsSide.Frame.Quests.QuestsGradient
    .QuestsHolder:GetChildren() do
    if v:IsA("Frame") and v:FindFirstChild("Progress") then

        if string.find(v.Title.Text, "Egg") then
            autofarmquest1()
        else
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = checkmap3().INTERACT.BREAK_ZONES.BREAK_ZONE.CFrame

     if game:GetService("Players").LocalPlayer.PlayerGui.ProgressBars.Main.Progress.Bar:FindFirstChild("GreenGradient") then
 
                for i, v in pairs(game.workspace.Map:GetChildren()) do
                   if v:IsA("Folder") and tonumber(math.min(table.unpack(g))) == tonumber(string.match(v.Name, "%d+")) then
       
                       b = string.gsub(v.Name, tostring(string.match(v.Name, "%d+")) .. " | ", "")
                       local args = {
                           [1] = b
                       }
       
                       game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Zones_RequestPurchase")
                           :InvokeServer(unpack(args))
                   end
               end
           else
               game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = checkmap().INTERACT.BREAK_ZONES.BREAK_ZONE.CFrame
       
           end
         
        end
    end
end
        end)
    end

    

--     local args = {
--     [1] = "292113"
-- }

-- game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Breakables_PlayerDealDamage"):FireServer(unpack(args))
