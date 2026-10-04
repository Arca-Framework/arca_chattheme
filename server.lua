-- Helpers for sending themed chat messages.
--   exports.arca_chattheme:Send(target, 'system', 'Server restarting in 5 minutes')
--   exports.arca_chattheme:Send(-1, 'staff', 'Admin', 'Please stop ramming cars')
-- kinds: system, announce, error (text only) · staff, ooc, me (author + text)

local single = { system = true, announce = true, error = true }

local function send(target, kind, a, b)
    local template = 'arca_' .. tostring(kind)
    local args = single[kind] and { tostring(a or '') } or { tostring(a or ''), tostring(b or '') }
    TriggerClientEvent('chat:addMessage', target, { templateId = template, args = args })
end

exports('Send', send)
