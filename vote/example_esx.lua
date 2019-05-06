local function getPlayerByName(playername)
    local xPlayers = ESX.GetPlayers()
    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if xPlayer ~= nil and xPlayer.getName() == playername then
            return xPlayer
        end
    end
    return nil
end

AddEventHandler('onPlayerVote', function (playername, ip, date)
    local player = getPlayerByName(playername)
    if player then
        player.addMoney(100)
    else
        print("Joueur introuvable !")
    end
    print(playername)
    print(ip)
    print(date)
end)
