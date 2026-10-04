fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'arca_chattheme'
author 'Arca'
description 'Arca theme for the default cfx chat'
version '0.1.0'

file 'style.css'

-- picked up by the default `chat` resource
chat_theme 'arca' {
    styleSheet = 'style.css',
    msgTemplates = {
        -- every normal message: author + text
        default = '<div class="arca-msg"><span class="arca-author">{0}</span><span class="arca-text">{1}</span></div>',
        -- messages with only one argument (prints, system lines)
        defaultAlt = '<div class="arca-msg arca-plain"><span class="arca-text">{0}</span></div>',
        -- console / resource output (restart messages etc.)
        print = '<div class="arca-msg arca-print"><i class="arca-dot"></i><span class="arca-text">{0}</span></div>',

        -- extra templates other resources can use (see README)
        arca_system = '<div class="arca-msg arca-tag" data-kind="system"><span class="arca-badge">SYSTEM</span><span class="arca-text">{0}</span></div>',
        arca_announce = '<div class="arca-msg arca-tag" data-kind="announce"><span class="arca-badge">ANNOUNCEMENT</span><span class="arca-text">{0}</span></div>',
        arca_staff = '<div class="arca-msg arca-tag" data-kind="staff"><span class="arca-badge">STAFF</span><span class="arca-author">{0}</span><span class="arca-text">{1}</span></div>',
        arca_ooc = '<div class="arca-msg arca-tag" data-kind="ooc"><span class="arca-badge">OOC</span><span class="arca-author">{0}</span><span class="arca-text">{1}</span></div>',
        arca_me = '<div class="arca-msg arca-tag" data-kind="me"><span class="arca-badge">ME</span><span class="arca-text"><b>{0}</b> {1}</span></div>',
        arca_error = '<div class="arca-msg arca-tag" data-kind="error"><span class="arca-badge">ERROR</span><span class="arca-text">{0}</span></div>',
    },
}

client_script 'client.lua'
server_script 'server.lua'

dependency 'chat'
