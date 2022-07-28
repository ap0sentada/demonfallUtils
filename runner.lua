local HttpService = game:GetService("HttpService")
local function sendMessage(msg)
    local gamechat =
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents
            .SayMessageRequest
    local chat = require(game.Players.LocalPlayer.PlayerScripts.ChatScript
                             .ChatMain)
    gamechat:FireServer(msg, "All")
    chat.MessagePosted:fire(msg);
end
local function Unban(list)
    if #list > 0 then
        for i = 1, #list do
            wait(2)
            sendMessage("!unban " .. list[i])
        end
    end
end
local function Ban(list)
    if #list > 0 then
        for i = 1, #list do
            wait(2)
            sendMessage("!ban " .. list[i])
        end
    end
end
local function ping() 
    sendMessage("ping! [automation anti kick]") 
end
local function start()
    while wait(5) do
        ping()
        local response = game:HttpGet("http://---:1980/list")
        local list = HttpService:JSONDecode(response)
        Unban(list.unbans)
        Ban(list.bans)
    end
end

start()
