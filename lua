-- Function to handle player chat
local function onChatted(message)
    local prefix = ".win"
    if message:sub(1, #prefix) == prefix then
        -- Execute the desired code when ".win" is typed in the chat
        game:GetService("ReplicatedStorage").WonDragMinigame:FireServer()
    end
end

-- Connect the onChatted function to player chat event
game:GetService("Players").LocalPlayer.Chatted:Connect(onChatted)

print("Made By trashux")
