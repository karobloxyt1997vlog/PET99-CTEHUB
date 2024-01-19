 
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

            if checkquestfarmstart() <= checkquestfarmened() and string.find(v.Title.Text, "Egg")   then
                spawn(function()
                  
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                        workspace.__THINGS.Eggs.Main["1 - Egg Capsule"].WorldPivot
                    wait(0.1)
                    game:GetService("VirtualUser"):ClickButton1(Vector2.new(125,125)) 
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
                                 wait(0.1)
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
                print(checkquestfarmstart())
                print("ASS")

            end
        end
    end
end
while _G.abcd do
    wait()
    spawn(function  ()
 autofarmquest1()

    end)
end
