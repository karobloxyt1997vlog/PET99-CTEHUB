_G.abcd = true
local f = {}
function checkquestmap1()
    for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.TeleportMap.Frame.Map.Locations:GetChildren()) do
        if v:IsA("Frame") and string.find(v.Box.TextHolder.Number.Text, "#") and
            not string.find(v.Box.TextHolder.Title.Text, "???") then

            table.insert(f, tonumber(string.match(v.Box.TextHolder.Number.Text, "%d+")))
            table.sort(f, function(a, b)
                return a > b
            end)
        end
    end

end
checkquestmap1()
 
function checkmap()
    for i, v in pairs(workspace.Map:GetChildren()) do
        if v:IsA("Folder") and tonumber(string.match(v.Name, "%d+")) == tonumber(math.max(table.unpack(f))) then
            return v
        end
    end
end
while _G.abcd do
    wait()
    for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.TeleportMap.Frame.Map.Locations:GetChildren()) do
        if v:IsA("Frame") and tonumber(string.match(v.Box.TextHolder.Number.Text, "%d+")) ==
            tonumber(math.max(table.unpack(f))) and not checkmap() then
            local args = {
                [1] = v.Box.TextHolder.Title.Text
            }

            game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Teleports_RequestTeleport")
                :InvokeServer(unpack(args))
        end
    end
    local function click(a)
        game:GetService("VirtualInputManager"):SendMouseButtonEvent(a.AbsolutePosition.X + a.AbsoluteSize.X / 2,
            a.AbsolutePosition.Y + 50, 0, true, a, 1)
        game:GetService("VirtualInputManager"):SendMouseButtonEvent(a.AbsolutePosition.X + a.AbsoluteSize.X / 2,
            a.AbsolutePosition.Y + 50, 0, false, a, 1)
    end
    -- game:GetService("Players").LocalPlayer.PlayerGui.TeleportMap.Frame.Visible = false 
 
    if game:GetService("Players").LocalPlayer.PlayerGui.ProgressBars.Main.Progress.Bar:FindFirstChild("GreenGradient") then
             game:GetService("Players").LocalPlayer.PlayerGui.MainLeft.Left.Tools.Teleport.Parent = game:GetService(
                                                                                                       "Players").LocalPlayer
                                                                                                       .PlayerGui.Main
                                                                                                       .Boosts
                                                                                                       .UIGridLayout
                                                                                                       .Parent

         wait(1)
        game:GetService("Players").LocalPlayer.PlayerGui.TeleportMap.Frame.Visible = false
        wait(1)
        click(game:GetService("Players").LocalPlayer.PlayerGui.Main.Boosts.Teleport.ConsoleButton)
        for i, v in pairs(game.workspace.Map:GetChildren()) do
            if v:IsA("Folder") and tonumber(math.max(table.unpack(f))) + 1 == tonumber(string.match(v.Name, "%d+")) then

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