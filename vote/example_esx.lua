-- This is a basic example using ESX.
-- It's only a demo, it's up to you to modify at your convenience.

ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
_Prefix = '^2[voteTopGames]^0'
_PrefixError = '^1[voteTopGames]^0'

local function getPlayerByName(playername)
    local xPlayers = ESX.GetPlayers()
    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if xPlayer ~= nil and xPlayer.getName() == playername then
            return xPlayer
        end
    end
    return false
end

AddEventHandler('onPlayerVote', function (playername, ip, date)
    if Config.giveMoney then
        if getPlayerByName(playername) then
            Player.addMoney(Config.amountGiven)

            -- For notify (pNotify needed):
            --TriggerClientEvent("pNotify:SendNotification", -1, {
            --    text = ""..playername.. " voted for the server</br>He won <b style='color:green'>".. Config.amountGiven .."$</b>",
            --    type = "info",
            --    timeout = 2500,
            --    layout = "centerRight"
            --})
            return
        end
        if Config.addMoneyOfflinePlayer == false then
            -- For notify (pNotify needed):
            --TriggerClientEvent("pNotify:SendNotification", -1, {
            --    text = "A stranger voted for the server!",
            --    type = "info",
            --    timeout = 1000,
            --    layout = "centerRight"
            --})
            return
        end
        MySQL.Async.fetchAll("SELECT * FROM users WHERE name = @name", {
            ['@name'] = playername
        }, function (result)
            if result[1] then
                -- For notify (pNotify needed):
                MySQL.Async.execute('UPDATE users SET bank = @bank WHERE name = @name',
                {
                    ['@bank'] = result[1]['bank'] + Config.amountGiven,
                    ['@name'] = result[1]['name']
                }, function(rowschanged)
                    if rowschanged then
                        --TriggerClientEvent("pNotify:SendNotification", -1, {
                        --    text = ""..playername.. " voted for the server</br>He won <b style='color:green'>".. Config.amountGiven .."$</b>",
                        --    type = "info",
                        --    timeout = 2500,
                        --    layout = "centerRight"
                        --})
                    else
                        print(_PrefixError .. ": add bank money for username: " .. playername .. " !")
                    end
                end)
            else
                print(_PrefixError .. ": Player not found: "..playername.." !")

                -- For notify (pNotify needed):
                --TriggerClientEvent("pNotify:SendNotification", -1, {
                --    text = "A stranger voted for the server!",
                --    type = "info",
                --    timeout = 1000,
                --    layout = "centerRight"
                --})
            end
        end)
    end
end)
