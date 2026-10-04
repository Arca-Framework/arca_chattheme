-- Client version of the helper in server.lua (only shows the message to this player).
--   exports.arca_chattheme:Send('error', 'You can\'t do that here')

local single = { system = true, announce = true, error = true }

exports('Send', function(kind, a, b)
    local args = single[kind] and { tostring(a or '') } or { tostring(a or ''), tostring(b or '') }
    TriggerEvent('chat:addMessage', { templateId = 'arca_' .. tostring(kind), args = args })
end)

---------------------------------------------------------------------
-- Hide key-mapping commands (+arca_admin, -arca_noclip...) from the suggestion list.
-- The chat lists every registered command whenever a resource starts, so tidy up after it.
---------------------------------------------------------------------
local function hideKeyCommands()
    for _, cmd in ipairs(GetRegisteredCommands()) do
        local first = cmd.name:sub(1, 1)
        if first == '+' or first == '-' or cmd.name:find('^_') then
            TriggerEvent('chat:removeSuggestion', '/' .. cmd.name)
        end
    end
end

local pending = false
AddEventHandler('onClientResourceStart', function()
    if pending then return end
    pending = true
    SetTimeout(1000, function()
        pending = false
        hideKeyCommands()
    end)
end)

CreateThread(function()
    Wait(3000)
    hideKeyCommands()
end)
