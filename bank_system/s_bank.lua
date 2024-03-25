addEvent("getPlayerBankBalance", true)
addEventHandler("getPlayerBankBalance", root, function()
    local pSerial = getPlayerSerial(client)
    local query = exports.lgn_db:dbGet("SELECT * FROM twoja_tabela WHERE serial=?", pSerial)
    triggerClientEvent("infoBank", client, query)
end)


function handleResponse(responseData, errno)
    if errno == 0 then 
        local data = fromJSON(responseData)
        if data and data.result == "success" then 
            local conversionRates = data.conversion_rates

            local PLN = conversionRates.PLN
            local EUR = conversionRates.EUR
            local CHF = conversionRates.CHF
            local GBP = conversionRates.GBP
            local CNY = conversionRates.CNY
            
            local roundedPLN = string.format("%.2f", PLN)
            local roundedEUR = string.format("%.2f", EUR)
            local roundedCHF = string.format("%.2f", CHF)
            local roundedGBP = string.format("%.2f", GBP)
            local roundedCNY = string.format("%.2f", CNY)
            
            kursy = { 
                polskizloty = roundedPLN,
                euro = roundedEUR,
                frank = roundedCHF,
                funt = roundedGBP,
                yuan = roundedCNY,
            }
            
            
            triggerClientEvent("infoKursy", root, kursy)
        else
            outputChatBox("Błąd: Nie udało się pobrać danych")
        end
    else 
        outputChatBox("Błąd: "..errno)
    end   
end 


addEventHandler("onPlayerResourceStart", getRootElement(getThisResource()), function()
    setTimer(function() 
        fetchRemote("https://v6.exchangerate-api.com/v6/twoj_api_key/latest/USD", handleResponse)
    end, 4000, 1)
end)

