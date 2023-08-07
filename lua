-- Function to handle player chat
local function onChatted(message)
    local prefix = ".win mini"
    if message:sub(1, #prefix) == prefix then
        -- Execute the desired code when ".win" is typed in the chat
        game:GetService("ReplicatedStorage").WonDragMinigame:FireServer()
    end
end

-- Connect the onChatted function to player chat event
game:GetService("Players").LocalPlayer.Chatted:Connect(onChatted)

local function onChatted(message)
    local prefix = ".win "
    if message:sub(1, #prefix) == prefix then
        local targetName = message:sub(#prefix + 1):lower() -- Convert to lowercase for case-insensitive comparison

        -- Check if the user wants to kill everyone in the server except themselves
        if targetName == "game" then
            local localPlayer = game.Players.LocalPlayer
            for _, player in ipairs(game.Players:GetPlayers()) do
                if player ~= localPlayer and player.Character then
                    local args = {
                        [1] = player.Character
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("Kill"):FireServer(unpack(args))
                end
            end
            return -- Exit the function since we've killed everyone else
        end
    end
end

game:GetService("Players").LocalPlayer.Chatted:Connect(onChatted)
