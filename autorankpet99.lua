 

local g = {}
local h = {}
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
        
        
             
        end)
    end
