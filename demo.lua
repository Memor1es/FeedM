local arr = { "standard", "standard_long",  "advanced", "advanced_long" }
local types = { "success", "warning", "danger" }
local icons = { 
    "ABIGAIL",
    "ACTING_UP",
    "AGENT14",
    "ALL_PLAYERS_CONF",
    "AMANDA",
    "AMMUNATION",
    "ANDREAS",
    "ANTONIA",
    "ARTHUR",
    "ASHLEY",
    "BANK_BOL",
    "BANK_FLEECA",
    "BANK_MAZE",
    "BARRY",
    "BEVERLY",
    "BIKESITE",
    "BLANK_ENTRY",
    "BLIMP",
    "BLIMP2",
    "BLOCKED",
    "BOATSITE",
    "BOATSITE2",
    "BROKEN_DOWN_GIRL",
    "BRYONY",
    "BUGSTARS",
    "CALL911",
    "CARSITE",
    "CARSITE2",
    "CARSITE3",
    "CARSITE4",
    "CASINO",
    "CASINO_MANAGER",
    "CASTRO",
    "CHAT_CALL",
    "CHEF",
    "CHENG",
    "CHENGSR",
    "CHOP",
    "COMIC_STORE",
    "CRIS",
    "DAVE",
    "DEFAULT",
    "DENISE",
    "DETONATEBOMB",
    "DETONATEPHONE",
    "DEVIN",
    "DIAL_A_SUB",
    "DOM",
    "DOMESTIC_GIRL",
    "DREYFUSS",
    "DR_FRIEDLANDER",
    "ENGLISH_DAVE",
    "EPSILON",
    "ESTATE_AGENT",
    "FACEBOOK",
    "FILMNOIR",
    "FLOYD",
    "FRANKLIN",
    "FRANK_TREV_CONF",
    "GANGAPP",
    "GAYMILITARY",
    "HAO",
    "HITCHER_GIRL",
    "HUMANDEFAULT",
    "HUNTER",
    "JIMMY",
    "JIMMY_BOSTON",
    "JOE",
    "JOSEF",
    "JOSH",
    "LAMAR",
    "LAZLOW",
    "LAZLOW2",
    "LESTER",
    "LESTER_DEATHWISH",
    "LEST_FRANK_CONF",
    "LEST_MIKE_CONF",
    "LIFEINVADER",
    "LJT",
    "LS_CUSTOMS",
    "LS_TOURIST_BOARD",
    "MALC",
    "MANUEL",
    "MARNIE",
    "MARTIN",
    "MARY_ANN",
    "MAUDE",
    "MECHANIC",
    "MICHAEL",
    "MIKE_FRANK_CONF",
    "MIKE_TREV_CONF",
    "MILSITE",
    "MINOTAUR",
    "MOLLY",
    "MP_ARMY_CONTACT",
    "MP_BIKER_BOSS",
    "MP_BIKER_MECHANIC",
    "MP_BRUCIE"
}


RegisterCommand("addMessage", function(source, args, raw)
    if args[1] ~= nil then
        local str = table.concat(args, " ")

        ShowNotification(str)
    end
end)

RegisterCommand("addAdvancedMessage", function(source, args, raw)
    if args[1] ~= nil then
        local Message = table.slice(args, 3)
        Message = table.concat(Message, " ")

        ShowAdvancedNotification(args[1], args[2], Message, "CHAR_" .. random_elem(icons))
    end
end)

RegisterCommand("queuedMessages", function(source, args, raw)
    Citizen.CreateThread(function()
        Citizen.Wait(2000)
        for i = 1, 5 do
            TriggerEvent("feedM:showNotification", "~g~FeedM: ~s~Queued Notification ~b~" .. i)
            Citizen.Wait(500)
        end
    end)
end)


RegisterCommand("demoMessage", function(source, args, raw)

    Citizen.CreateThread(function()
        ShowNotification("This is a ~b~notification", 5000)
        Citizen.Wait(100)
        ShowAdvancedNotification("Title", "Subtitle", "This is an ~g~advanced ~b~notification", "CHAR_" .. random_elem(icons), 5000)
        Citizen.Wait(100)        
        ShowNotification("~b~Lorem ~w~ipsum dolor sit amet, consectetur ~g~adipiscing elit, ~r~sed do eiusmod ~w~tempor inci.", 5000)
        Citizen.Wait(100)
        ShowAdvancedNotification("Title", "Subtitle", "~b~Lorem ~w~ipsum dolor sit amet, consectetur ~g~adipiscing elit, ~r~sed do eiusmod ~w~tempor inci.", "CHAR_" .. random_elem(icons), 5000)
        Citizen.Wait(100)
   

        for i = 1, 10 do
            local type = random_elem(arr)

            if type == "standard" then
                ShowNotification("This is a ~b~notification", 5000, random_elem(types))
                Citizen.Wait(100) 
            elseif type == "standard_long" then
                ShowNotification("~b~Lorem ~w~ipsum dolor sit amet, consectetur ~g~adipiscing elit, ~r~sed do eiusmod ~w~tempor inci.", 5000, random_elem(types))
                Citizen.Wait(100) 
            elseif type == "advanced" then
                ShowAdvancedNotification("Title", "Subtitle", "This is an ~g~advanced ~b~notification", "CHAR_" .. random_elem(icons), 5000, random_elem(types))
                Citizen.Wait(100) 
            elseif type == "advanced_long" then
                ShowAdvancedNotification("Title", "Subtitle", "~b~Lorem ~w~ipsum dolor sit amet, consectetur ~g~adipiscing elit, ~r~sed do eiusmod ~w~tempor inci.", "CHAR_" .. random_elem(icons), 5000, random_elem(types))
                Citizen.Wait(100) 
            end
        end
    end)
end)

function random_elem(tb)
    local keys = {}
    for k in pairs(tb) do table.insert(keys, k) end
    return tb[keys[math.random(#keys)]]
end