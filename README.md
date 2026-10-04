# arca_chattheme

An Arca-styled theme for the default cfx `chat` resource: dark glass message cards with a green accent bar, a rounded input box and a matching command suggestion list. Start it after `chat`, and it applies to every message automatically.

## Message templates

Normal chat messages use the theme on their own. These extra templates add a coloured badge:

| Template | Args | Look |
|---|---|---|
| `arca_system` | text | blue SYSTEM badge |
| `arca_announce` | text | amber ANNOUNCEMENT card |
| `arca_error` | text | red ERROR badge |
| `arca_staff` | author, text | red STAFF badge |
| `arca_ooc` | author, text | grey OOC badge |
| `arca_me` | name, action | purple italic ME line |

```lua
-- server
exports.arca_chattheme:Send(-1, 'announce', 'Server restart in 10 minutes')
exports.arca_chattheme:Send(source, 'staff', 'Admin', 'Please read the rules')

-- client (only this player sees it)
exports.arca_chattheme:Send('error', 'You can\'t do that here')

-- or with the chat event directly
TriggerClientEvent('chat:addMessage', -1, { templateId = 'arca_system', args = { 'Hello' } })
```

Colour codes (`^1`–`^9`) still work inside messages.
