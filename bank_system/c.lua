--[[
    =====================================
    =                                   =
    =           Autor - Legion          =
    =                                   =
    =====================================
]]

s = Vector2(guiGetScreenSize())


function przecinek(liczba)
    local str = tostring(liczba)
    str = str:reverse():gsub("(%d%d%d)", "%1,"):reverse():gsub("^,", "")
    if str:sub(1, 1) == "," then
        str = str:sub(2)
    end
    return str
end

marker = createMarker(-2423.61011, -586.73651, 132.74200-1.5, "cylinder", 2.0, 0,0,0,120)

w = {
    bank = false, 
    bankomat = false;
}

function dxDrawRoundedRectangleOutline(x, y, w, h, radius, color, postGUI, subPixelPositioning, outline)
    exports.legion_gui:dxDrawRoundedRectangle(x-outline, y, w, h, radius, color, postGUI, subPixelPositioning)
    exports.legion_gui:dxDrawRoundedRectangle(x, y-outline, w, h, radius, color, postGUI, subPixelPositioning)
    exports.legion_gui:dxDrawRoundedRectangle(x, y, w+outline, h, radius, color, postGUI, subPixelPositioning)
    exports.legion_gui:dxDrawRoundedRectangle(x, y, w, h+outline, radius, color, postGUI, subPixelPositioning)
end


function ui()
    if w.bank then
        --[[local kursyTable = { 
            Polskizloty = 0,
            Euro = 3.55,
            Frank = 3.55,
            Funt = 3.55,
            Yuan = 3.55,
        }]]--
        local infoText = "Kursy są przeliczane z dolara amerykańskiego (USD), zmiana kursów następuje co 24h i jest ona powiązana z realnymi kursami walut.\n (nie musi sie zmienić)"
        dxDrawRoundedRectangleOutline(593, 72, 735, 885, 15, tocolor(120, 120, 120, 255), false, false, 1)
        exports.legion_gui:dxDrawRoundedRectangle(593, 72, 735, 885, 15, tocolor(26, 26, 26, 255), false)
        dxDrawRoundedRectangleOutline(593, 72, 735, 52, 10, tocolor(120, 120, 120, 255), false, false, 1)
        exports.legion_gui:dxDrawRoundedRectangle(593, 72, 735, 52, 10, tocolor(44, 44, 44, 255), false)
        dxDrawRectangle(593-1, 72, 735, 32, tocolor(120, 120, 120, 255), false)
        dxDrawRectangle(593, 72-1, 735, 32, tocolor(120, 120, 120, 255), false)
        dxDrawRectangle(593, 72, 735+1, 32, tocolor(120, 120, 120, 255), false)
        dxDrawRectangle(593, 72, 735, 32, tocolor(44, 44, 44, 255), false)
        dxDrawText("Strona główna banku", 737, 78, 1184, 118, tocolor(255, 255, 255, 255), 1.00, exports.legion_gui:getGUIFont("exo25"), "center", "center", false, false, false, false, false)
        dxDrawRoundedRectangleOutline(635, 149, 650, 375, 10, tocolor(120, 120, 120, 255), false, false, 1)
        exports.legion_gui:dxDrawRoundedRectangle(635, 149, 650, 375, 10, tocolor(44, 44, 44, 255), false)
        dxDrawRoundedRectangleOutline(635, 554, 650, 375, 10, tocolor(120, 120, 120, 255), false, false, 1)
        exports.legion_gui:dxDrawRoundedRectangle(635, 554, 650, 375, 10, tocolor(44, 44, 44, 255), false)
        dxDrawRoundedRectangleOutline(635, 554, 650, 40, 10, tocolor(120, 120, 120, 255), false, false, 1)
        exports.legion_gui:dxDrawRoundedRectangle(635, 554, 650, 40, 10, tocolor(32, 32, 32, 255), false)
        dxDrawRoundedRectangleOutline(635, 149, 650, 40, 10, tocolor(120, 120, 120, 255), false, false, 1)
        exports.legion_gui:dxDrawRoundedRectangle(635, 149, 650, 40, 10, tocolor(32, 32, 32, 255), false)
        --[[dxDrawRectangle(635-1, 554, 650, 30, tocolor(120, 120, 120, 255), false)
        dxDrawRectangle(635, 554-1, 650, 30, tocolor(120, 120, 120, 255), false)
        dxDrawRectangle(635, 554, 650+1, 30, tocolor(120, 120, 120, 255), false)
        dxDrawRectangle(635, 554, 650, 30, tocolor(32, 32, 32, 255), false)
        dxDrawRectangle(635-1, 149, 650, 30, tocolor(120, 120, 120, 255), false)
        dxDrawRectangle(635, 149-1, 650, 30, tocolor(120, 120, 120, 255), false)
        dxDrawRectangle(635, 149, 650+1, 30, tocolor(120, 120, 120, 255), false)
        dxDrawRectangle(635, 149, 650, 30, tocolor(32, 32, 32, 255), false)--]]
        
        dxDrawText("Twoje konto", 786, 153, 1138, 183, tocolor(255, 255, 255, 255), 1.00, exports.legion_gui:getGUIFont("exo15"), "center", "center", false, false, false, false, false)
        dxDrawText("Kursy walut", 786, 559, 1138, 589, tocolor(255, 255, 255, 255), 1.00, exports.legion_gui:getGUIFont("exo15"), "center", "center", false, false, false, false, false)
       
        if isMouseInPos(902, 876, 50, 50) then 
            dxDrawImage(902, 876, 50, 50, "icons/info-icon.png", 0, 0, 0, tocolor(120, 120, 120, 255), false)
            dxDrawRoundedRectangleOutline(822, 936, 275, 84, 10, tocolor(120, 120, 120, 255), false, false, 1)
            exports.legion_gui:dxDrawRoundedRectangle(822, 936, 275, 84, 10, tocolor(66, 66, 66, 255), false)
            dxDrawText(infoText, 827, 941, 1087, 1010, tocolor(255, 255, 255, 255), 1.00, exports.legion_gui:getGUIFont("exo10"), "center", "center", false, true, false, false, false)
        else 
            dxDrawImage(902, 876, 50, 50, "icons/info-icon.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        end
        if isMouseInPos(968, 876, 50, 50) then 
            dxDrawImage(968, 876, 50, 50, "icons/echange-icon.png", 0, 0, 0, tocolor(120, 120, 120, 255), false)
            dxDrawRoundedRectangleOutline(822, 936, 275, 84, 10, tocolor(120, 120, 120, 255), false, false, 1)
            exports.legion_gui:dxDrawRoundedRectangle(822, 936, 275, 84, 10, tocolor(66, 66, 66, 255), false)
            dxDrawText("Kliknij by przejść do wymienienia walut", 827, 941, 1087, 1010, tocolor(255, 255, 255, 255), 1.00, exports.legion_gui:getGUIFont("exo10"), "center", "center", false, true, false, false, false)
        else 
            dxDrawImage(968, 876, 50, 50, "icons/echange-icon.png", 0, 0, 0, tocolor(255, 255, 255, 255), false) 
        end 

        local additionY = 0 
        if kursyTable and next(kursyTable) ~= nil then 
            for c, rate in pairs(kursyTable) do
                dxDrawRoundedRectangleOutline(666, 604 + additionY, 588, 45, 10, tocolor(120, 120, 120, 255), false, false, 1)
                exports.legion_gui:dxDrawRoundedRectangle(666, 604 + additionY, 588, 45, 10, tocolor(31, 31, 31, 255), false)
                dxDrawText(c .. " - " .. rate, 688, 609 + (additionY)*2, 1231, 645, tocolor(255, 255, 255, 255), 1.00, exports.legion_gui:getGUIFont("exo13"), "center", "center", false, false, false, false, false)
                additionY = additionY + 55 
            end
        else 
            dxDrawText("Ładowanie...", 732, 687, 1196, 781, tocolor(255, 255, 255, 255), 1.00, exports.legion_gui:getGUIFont("exo30"), "center", "center", false, false, true, false, false)
        end
        for i, bank in ipairs(bankTable) do 
            dxDrawRoundedRectangleOutline(670, 212, 196, 286, 10, tocolor(120,120,120, 255), false, false, 1)
            exports.legion_gui:dxDrawRoundedRectangle(670, 212, 196, 286, 10, tocolor(33, 33, 33, 255), false)
            dxDrawRoundedRectangleOutline(885, 212, 380, 286, 10, tocolor(120,120,120, 255), false, false, 1)
            exports.legion_gui:dxDrawRoundedRectangle(885, 212, 380, 286, 10, tocolor(32, 33, 33, 255), false)
            dxDrawText("Saldo konta", 902, 222, 1248, 257, tocolor(255, 255, 255, 255), 1.00, exports.legion_gui:getGUIFont("exo20"), "center", "center", false, false, false, false, false)
            dxDrawText("USD: "..przecinek(bank.usd), 914, 272, 1238, 306, tocolor(255, 255, 255, 255), 1.00, exports.legion_gui:getGUIFont("exo15"), "left", "center", false, false, false, false, false)
            exports.legion_gui:dxDrawRoundedRectangle(917, 325, 6, 156, 4, tocolor(62, 64, 64, 255), false)
            exports.legion_gui:dxDrawRoundedRectangle(917, 476, 52, 6, 4, tocolor(62, 64, 64, 255), false)
            
            
            if bank.frank < 1 then
                franki = "#ff0000Brak"
            else 
                franki = przecinek(bank.frank)
            end
            if bank.eur < 1 then
                eurosy = "#ff0000Brak"
            else 
                eurosy = przecinek(bank.euro)
            end 
            if bank.pln < 1 then
                plny = "#ff0000Brak"
            else 
                plny = przecinek(bank.pln)
            end 
            if bank.yuan < 1 then 
                yuany = "#ff0000Brak"
            else 
                yuany =  przecinek(bank.yuan)
            end
            
            dxDrawText("Frank: "..franki, 941, 325, 1099, 350, tocolor(255, 255, 255, 255), 1.00, exports.legion_gui:getGUIFont("exo12"), "left", "top", false, false, false, true, false)
            dxDrawText("Euro: "..eurosy, 941, 360, 1099, 385, tocolor(255, 255, 255, 255), 1.00, exports.legion_gui:getGUIFont("exo12"), "left", "top", false, false, false, true, false)
            dxDrawText("Pln: "..plny, 941, 395, 1099, 420, tocolor(255, 255, 255, 255), 1.00, exports.legion_gui:getGUIFont("exo12"), "left", "top", false, false, false, true, false)
            dxDrawText("Yuan: "..yuany, 941, 430, 1099, 452, tocolor(255, 255, 255, 255), 1.00, exports.legion_gui:getGUIFont("exo12"), "left", "top", false, false, false, true, false)
        end 
    end
end 



addEvent("infoBank", true)
addEventHandler("infoBank", root, function(table)
    bankTable = table
end)

addEvent("infoKursy", true)
addEventHandler("infoKursy", root, function(table)
    kursyTable = table
end)


function isMouseInPos (x, y, w, h)
    if (not isCursorShowing()) then 
        return false
    end
    local cx, cy = getCursorPosition()
    local cx, cy = (cx*s.x), (cy*s.y)
    return ( (cx >= x and cx <= x+w) and (cy >= y and cy <= y+h) )
end

addEventHandler("onClientMarkerHit", root, function(plr, dim)
    if plr == localPlayer and dim then 
        if source == marker then
            triggerServerEvent("getPlayerBankBalance", localPlayer)
            addEventHandler("onClientRender", root, ui)
            setTimer(function()
                w.bank = true
            end,200,1)
        end
    end 
end)

addEventHandler("onClientMarkerLeave", root, function(plr, dim)
    if plr == localPlayer and dim then 
        if source == marker then
            removeEventHandler("onClientRender", root, ui)
            setTimer(function()
                w.bank = false
            end,200,1)
        end
    end 
end)

bindKey("f3", "up", function()
    if isCursorShowing() then 
        showCursor(false)
    else 
        showCursor(true)
    end
end)

