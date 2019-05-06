AddEventHandler('onServerResourceStart', function (resource)
    if resource == "vote" then
        port = 5394
        serverToken = "XXXXX"
        exports['vote']:vote_configure(port, serverToken)
    end
end)