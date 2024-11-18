local ffi = require("ffi")

JSON = Panorama.LoadString([[
    return {
        stringify: JSON.stringify,
        parse: JSON.parse
    };
]])()

function Log(msg)
    print('[aimless.lua] ' .. msg)
end

function ShowTable(tab)
    for i, v in ipairs(tab) do
        print(v)
    end
end

function GetTableString(tab)
    local res = ""
    for i, v in ipairs(tab) do
        res = res .. ", " .. tostring(v)
    end
    return res
end

MapList = {
    ['ar_baggage'] = 'Baggage',
    ['ar_dizzy'] = 'Dizzy',
    ['ar_lunacy'] = 'Lunacy',
    ['ar_monastery'] = 'Monastery',
    ['ar_shoots'] = 'Shoots',
    ['cs_agency'] = 'Agency',
    ['cs_assault'] = 'Assault',
    ['cs_italy'] = 'Italy',
    ['cs_militia'] = 'militia',
    ['cs_office'] = 'Office',
    ['de_anubis'] = 'Anubis',
    ['de_bank'] = 'Bank',
    ['de_cache'] = 'Cache',
    ['de_cbble'] = 'Cobblestone',
    ['de_chlorine'] = 'Chlorine',
    ['de_dust2'] = 'Dust II',
    ['de_inferno'] = 'Inferno',
    ['de_lake'] = 'Lake',
    ['de_mirage'] = 'Mirage',
    ['de_nuke'] = 'Nuke',
    ['de_overpass'] = 'Overpass',
    ['de_safehouse'] = 'Safehouse',
    ['de_shortdust'] = 'Shortdust',
    ['de_shortnuke'] = 'Shortnuke',
    ['de_stmarc'] = 'St. Marc',
    ['de_sugarcane'] = 'Sugarcane',
    ['de_train'] = 'Train',
    ['de_vertigo'] = 'Vertigo',
    ['dz_blacksite'] = 'Blacksite',
    ['dz_junglety'] = 'Junglety',
    ['dz_sirocco'] = 'Sirocco',
    ['gd_cbble'] = 'Cobblestone',
    ['gd_rialto'] = 'Rialto'
}
CountryCodes = {
    ['Afrikaans'] = 'af',
    ['Irish'] = 'ga',
    ['Albanian'] = 'sq',
    ['Italian'] = 'it',
    ['Arabic'] = 'ar',
    ['Japanese'] = 'ja',
    ['Azerbaijani'] = 'az',
    ['Kannada'] = 'kn',
    ['Basque'] = 'eu',
    ['Korean'] = 'ko',
    ['Bengali'] = 'bn',
    ['Latin'] = 'la',
    ['Belarusian'] = 'be',
    ['Latvian'] = 'lv',
    ['Bulgarian'] = 'bg',
    ['Lithuanian'] = 'lt',
    ['Catalan'] = 'ca',
    ['Macedonian'] = 'mk',
    ['Chinese CN'] = 'zh-CN',
    ['Malay'] = 'ms',
    ['Chinese TW'] = 'zh-TW',
    ['Maltese'] = 'mt',
    ['Croatian'] = 'hr',
    ['Norwegian'] = 'no',
    ['Czech'] = 'cs',
    ['Persian'] = 'fa',
    ['Danish'] = 'da',
    ['Polish'] = 'pl',
    ['Dutch'] = 'nl',
    ['Portuguese'] = 'pt',
    ['English'] = 'en',
    ['Romanian'] = 'ro',
    ['Esperanto'] = 'eo',
    ['Russian'] = 'ru',
    ['Estonian'] = 'et',
    ['Serbian'] = 'sr',
    ['Filipino'] = 'tl',
    ['Slovak'] = 'sk',
    ['Finnish'] = 'fi',
    ['Slovenian'] = 'sl',
    ['French'] = 'fr',
    ['Spanish'] = 'es',
    ['Galician'] = 'gl',
    ['Swahili'] = 'sw',
    ['Georgian'] = 'ka',
    ['Swedish'] = 'sv',
    ['German'] = 'de',
    ['Tamil'] = 'ta',
    ['Greek'] = 'el',
    ['Telugu'] = 'te',
    ['Gujarati'] = 'gu',
    ['Thai'] = 'th',
    ['Haitian'] = 'ht',
    ['Turkish'] = 'tr',
    ['Hebrew'] = 'iw',
    ['Ukrainian'] = 'uk',
    ['Hindi'] = 'hi',
    ['Urdu'] = 'ur',
    ['Hungarian'] = 'hu',
    ['Vietnamese'] = 'vi',
    ['Icelandic'] = 'is',
    ['Welsh'] = 'cy',
    ['Indonesian'] = 'id',
    ['Yiddish'] = 'yi'
}
Ranks = {
    MM = {
        'SI',
        'S2',
        'S3',
        'S4',
        'SE',
        'SEM',

        'GN1',
        'GN2',
        'GN3',
        'GNM',
        'MG1',
        'MG2',

        'MGE',
        'DMG',
        'LE',
        'LEM',
        'SMFC',
        'GE'
    },
    DZ = {
        'Lab Rat I',
        'Lab Rat II',

        'Sprinting Hare I',
        'Sprinting Hare II',

        'Wild Scout I',
        'Wild Scout II',
        'Wild Scout Elite',

        'Hunter Fox I',
        'Hunter Fox II',
        'Hunter Fox III',
        'Hunter Fox Elite',

        'Timber Wolf',
        'Ember Wolf',
        'Wildfire Wolf',

        'The Howling Alpha'
    }
}
Colors = {
    White = '\x01',
    Red = '\x02',
    Purple = '\x03',
    Green = '\x04',
    YellowGreen = '\x05',
    LightGreen = '\x06',
    LightRed = '\x07',
    Gray = '\x08',
    Gray2 = '\x0A',
    LightYellow = '\x09',
    Blue = '\x0B',
    DarkBlue = '\x0C',
    Gold = '\x10',
    RGB = {
        White = {
            r = 255,
            g = 255,
            b = 255
        },
        Yellow = {
            r = 234,
            g = 237,
            b = 37
        },
        Green = {
            r = 126,
            g = 215,
            b = 135
        },
        Red = {
            r = 200,
            g = 82,
            b = 76
        },
        Blue = {
            r = 105,
            g = 140,
            b = 255
        },
        Orange = {
            r = 200,
            g = 140,
            b = 56
        },
    },
    Discord = {
        Win = 7855479, -- GREEN
        Loss = 16738657, -- RED
        CT = 2003199, -- CT
        T = 16757575, -- T
        Draw = 9868950 -- GREY
    },
    PlayerColours = {
        yellow = '#F8F62D',
        y = '#F8F62D',

        purple = '#A119F0',
        p = '#A119F0',

        green = '#00B562',
        g = '#00B562',

        blue = '#5CA8FF',
        b = '#5CA8FF',

        orange = '#FF9B25',
        o = '#FF9B25'
    }
}
RoundEndReasons = {
    "CT win through elimination",
    "CT win through rescuing the hostage",
    "CT win through defusing the bomb",
    "CT win because the time ran out",
    "T win through elimination",
    "T win through bomb explosion",
    "T win because the time ran out"
}

--region EventDispatcher
EventDispatcher = {}
EventDispatcher.callbacks = {}

function EventDispatcher:IsRegistered(eventName, callbackFunction)
    local callbacks = self.callbacks
    if not callbacks[eventName] then return false end
    local funcs = callbacks[eventName]
    for k, v in pairs(funcs) do
        if v == callbackFunction then return true end
    end
    return false
end

function EventDispatcher:RegisterCallback(eventName, callbackFunction)
    local callbacks = self.callbacks
    if not callbacks[eventName] then callbacks[eventName] = {}
    elseif self:IsRegistered(eventName, callbackFunction) then return end

    table.insert(callbacks[eventName], callbackFunction)
end

function EventDispatcher:UnregisterCallback(eventName, callbackFunction)
    local callbackTable = self.callbacks[eventName]
    if not callbackTable then return end

    for i = 1, #callbackTable do
        if callbackTable[i] == callbackFunction then
            table.remove(callbackTable, i)
            if #callbackTable < 1 then callbackTable = nil end
            return
        end
    end
end

function EventDispatcher:RunCallbacks(event)
    local eName = event:GetName()
    local callbackTable = self.callbacks[eName]
    if not callbackTable then return end
    for k, v in pairs(callbackTable) do
        v(event)
    end
end

function EventDispatcher.EventCallback(event)
    EventDispatcher.RunCallbacks(EventDispatcher, event)
end

function EventDispatcher:Print()
    local callbacks = self.callbacks
    for k, v in pairs(callbacks) do
        print(k .. " has " .. tostring(#v) .. " callbacks")
    end
end

Cheat.RegisterCallback("events", EventDispatcher.EventCallback)
--endregion EventDispatcher

--region Scheduler
Scheduler = {
    schedule = {},
    delays = {}
}

function Scheduler.Schedule(interval, func, ...)
    table.insert(Scheduler.schedule, { interval, interval, func, { ... } })
end

-- TODO
function Scheduler.CancelSchedule(func) end

function Scheduler.Delay(amount, func, ...)
    table.insert(Scheduler.delays, { amount, func, { ... } })
end

-- TODO
function Scheduler.CancelDelay()

end

function Scheduler:OnDraw()
    local deltaTime = GlobalVars.frametime
    -- delays
    for i, v in ipairs(self.delays) do
        if v[1] < 0 then v[2](unpack(v[3])); table.remove(self.delays, i) else v[1] = v[1] - deltaTime end
    end
    -- schedule
    for i, v in ipairs(self.schedule) do
        if v[1] < 0 then v[3](unpack(v[4])); v[1] = v[2]; else v[1] = v[1] - deltaTime end
    end
end

Delay = Scheduler.Delay
Schedule = Scheduler.Schedule
--endregion

--region Output
ffi.cdef [[
    typedef void***(__thiscall* FindHudElement_t)(void*, const char*);
    typedef void(__cdecl* ChatPrintf_t)(void*, int, int, const char*, ...);
]]

Output = {}

Output.signatures = {
    gHud = 'B9 ? ? ? ? D9 5C 24 10',
    fFindElement = '55 8B EC 53 8B 5D 08 56 57 8B F9 33 F6 39 77 28'
}

--region Output internals
Output.internals = {}

Output.internals.InitChat = function()
    local match = Utils.PatternScan('client.dll', Output.signatures.gHud) or error('sig1 not found') -- returns void***
    local char_match = ffi.cast('char*', match) + 1
    local hud = ffi.cast('void**', char_match)[0] or error('hud is nil') -- returns void**
    match = Utils.PatternScan('client.dll', Output.signatures.fFindElement) or error('FindHudElement not found')
    local find_hud_element = ffi.cast('FindHudElement_t', match)
    local hudchat = find_hud_element(hud, 'CHudChat') or error('CHudChat not found')
    local chudchat_vtbl = hudchat[0] or error('CHudChat instance vtable is nil')
    local raw_print_to_chat = chudchat_vtbl[27] -- void*
    local print_to_chat = ffi.cast('ChatPrintf_t', raw_print_to_chat)
    Output.internals.ChatPrintf = function(message, ...)
        print_to_chat(hudchat, 0, 0, message, ...)
    end
end
--endregion

--region Output interface
Output.PrintConsole = function(msg, ...)
    print("[aimless.lua] " .. msg, ...)
end

Output.PrintLobby = function() end -- TODO

Output.PrintChat = function(message, ...)
    Output.internals.ChatPrintf(message, ...)
end
--endregion

Output.internals.InitChat()
--endregion

--region DiscordRPC
DiscordRPC = {}

DiscordRPC.internals = {
    appID = "-- SECRET --",
    lastUpdate = 0,
    minTimeDelta = 16,
    discordRPClib = ffi.load("discord-rpc")
}

ffi.cdef [[
    typedef struct DiscordRichPresence {
        const char* state;   /* max 128 bytes */
        const char* details; /* max 128 bytes */
        int64_t startTimestamp;
        int64_t endTimestamp;
        const char* largeImageKey;  /* max 32 bytes */
        const char* largeImageText; /* max 128 bytes */
        const char* smallImageKey;  /* max 32 bytes */
        const char* smallImageText; /* max 128 bytes */
        const char* partyId;        /* max 128 bytes */
        int partySize;
        int partyMax;
        const char* matchSecret;    /* max 128 bytes */
        const char* joinSecret;     /* max 128 bytes */
        const char* spectateSecret; /* max 128 bytes */
        int8_t instance;
    } DiscordRichPresence;

    typedef struct DiscordUser {
        const char* userId;
        const char* username;
        const char* discriminator;
        const char* avatar;
    } DiscordUser;

    typedef void (*readyPtr)(const DiscordUser* request);
    typedef void (*disconnectedPtr)(int errorCode, const char* message);
    typedef void (*erroredPtr)(int errorCode, const char* message);
    typedef void (*joinGamePtr)(const char* joinSecret);
    typedef void (*spectateGamePtr)(const char* spectateSecret);
    typedef void (*joinRequestPtr)(const DiscordUser* request);

    typedef struct DiscordEventHandlers {
        readyPtr ready;
        disconnectedPtr disconnected;
        erroredPtr errored;
        joinGamePtr joinGame;
        spectateGamePtr spectateGame;
        joinRequestPtr joinRequest;
    } DiscordEventHandlers;

    void Discord_Initialize(const char* applicationId,
                            DiscordEventHandlers* handlers,
                            int autoRegister,
                            const char* optionalSteamId);

    void Discord_Shutdown(void);
    void Discord_RunCallbacks(void);
    void Discord_UpdatePresence(const DiscordRichPresence* presence);
    void Discord_ClearPresence(void);
    void Discord_Respond(const char* userid, int reply);
    void Discord_UpdateHandlers(DiscordEventHandlers* handlers);
]]

--region DiscordRPC Config
DiscordRPC.cfg = {}

DiscordRPC.cfg.enable = Menu.Switch("Misc", "Discord RPC", "Enable", false, "", function(state)
        if state == true then
            DiscordRPC.internals.Initialize(DiscordRPC.internals.appID, false, "624820")
        else
            DiscordRPC.internals.Shutdown()
        end
    end)

DiscordRPC.cfg.description = Menu.Combo("Misc", "Discord RPC", "Description mode", { "Mode & Score" }, 0,
        "Choose the description mode", function(val)
        -- TODO: description changed; schedule update
    end)

DiscordRPC.cfg.status = Menu.Combo("Misc", "Discord RPC", "Status mode", { "None", "Custom" }, 0,
        "Choose the status mode", function(val)
        -- TODO: status changed; schedule update
    end)

DiscordRPC.cfg.smallIcon = Menu.Combo("Misc", "Discord RPC", "Small Icon", { "White", "Blue", "Purple" }, 0,
        "Choose the color of the small icon", function(val)
        if val == 0 then DiscordRPC.currentPresence.smallImageKey = "luawhite"
        elseif val == 1 then DiscordRPC.currentPresence.smallImageKey = "luablue"
        elseif val == 2 then DiscordRPC.currentPresence.smallImageKey = "luapurple"
        else error("Incorrect icon") end
        -- TODO: icon changed; schedule update
    end)
--endregion

--region DiscordRPC Internals
DiscordRPC.internals.functions = {}
DiscordRPC.internals.helperFunctions = {}

-- proxy to detect garbage collection of the module
DiscordRPC.internals.gcDummy = newproxy(true)

function DiscordRPC.internals.UnpackDiscordUser(request)
    return ffi.string(request.userId), ffi.string(request.username),
        ffi.string(request.discriminator), ffi.string(request.avatar)
end

-- callback proxies
DiscordRPC.internals.callbackProxies = {}

DiscordRPC.internals.callbackProxies.ready_proxy = ffi.cast("readyPtr", function(request)
        local internals = DiscordRPC.internals
        if internals.ready then
            internals.ready(internals.UnpackDiscordUser(request))
        end
    end)

DiscordRPC.internals.callbackProxies.disconnected_proxy = ffi.cast("disconnectedPtr", function(errorCode, message)
        local internals = DiscordRPC.internals
        if internals.disconnected then
            internals.disconnected(errorCode, ffi.string(message))
        end
    end)

DiscordRPC.internals.callbackProxies.errored_proxy = ffi.cast("erroredPtr", function(errorCode, message)
        local internals = DiscordRPC.internals
        if internals.errored then
            internals.errored(errorCode, ffi.string(message))
        end
    end)

DiscordRPC.internals.callbackProxies.joinGame_proxy = ffi.cast("joinGamePtr", function(joinSecret)
        local internals = DiscordRPC.internals
        if internals.joinGame then
            internals.joinGame(ffi.string(joinSecret))
        end
    end)

DiscordRPC.internals.callbackProxies.spectateGame_proxy = ffi.cast("spectateGamePtr", function(spectateSecret)
        local internals = DiscordRPC.internals
        if internals.spectateGame then
            internals.spectateGame(ffi.string(spectateSecret))
        end
    end)

DiscordRPC.internals.callbackProxies.joinRequest_proxy = ffi.cast("joinRequestPtr", function(request)
        local internals = DiscordRPC.internals
        if internals.joinRequest then
            internals.joinRequest(internals.UnpackDiscordUser(request))
        end
    end)


-- helpers
DiscordRPC.internals.helperFunctions.CheckArg = function(arg, argType, argName, func, maybeNil)
    assert(type(arg) == argType or (maybeNil and arg == nil),
        string.format("Argument \"%s\" to function \"%s\" has to be of type \"%s\"",
            argName, func, argType))
end

DiscordRPC.internals.helperFunctions.CheckStrArg = function(arg, maxLen, argName, func, maybeNil)
    if maxLen then
        assert(type(arg) == "string" and arg:len() <= maxLen or (maybeNil and arg == nil),
            string.format("Argument \"%s\" of function \"%s\" has to be of type string with maximum length %d",
                argName, func, maxLen))
    else
        DiscordRPC.internals.helperFunctions.CheckArg(arg, "string", argName, func, true)
    end
end

DiscordRPC.internals.helperFunctions.CheckIntArg = function(arg, maxBits, argName, func, maybeNil)
    maxBits = math.min(maxBits or 32, 52) -- lua number (double) can only store integers < 2^53
    local maxVal = 2 ^ (maxBits - 1) -- assuming signed integers, which, for now, are the only ones in use
    assert(type(arg) == "number" and math.floor(arg) == arg
        and arg < maxVal and arg >= -maxVal
        or (maybeNil and arg == nil),
        string.format("Argument \"%s\" of function \"%s\" has to be a whole number <= %d",
            argName, func, maxVal))
end

-- function wrappers
DiscordRPC.internals.Initialize = function(applicationId, autoRegister, optionalSteamId)
    local func = "DiscordRPC.internals.Initialize"
    DiscordRPC.internals.helperFunctions.CheckStrArg(applicationId, nil, "applicationId", func)
    DiscordRPC.internals.helperFunctions.CheckArg(autoRegister, "boolean", "autoRegister", func)
    if optionalSteamId ~= nil then
        DiscordRPC.internals.helperFunctions.CheckStrArg(optionalSteamId, nil, "optionalSteamId", func)
    end

    local eventHandlers = ffi.new("struct DiscordEventHandlers")
    eventHandlers.ready = DiscordRPC.internals.callbackProxies.ready_proxy
    eventHandlers.disconnected = DiscordRPC.internals.callbackProxies.disconnected_proxy
    eventHandlers.errored = DiscordRPC.internals.callbackProxies.errored_proxy
    eventHandlers.joinGame = DiscordRPC.internals.callbackProxies.joinGame_proxy
    eventHandlers.spectateGame = DiscordRPC.internals.callbackProxies.spectateGame_proxy
    eventHandlers.joinRequest = DiscordRPC.internals.callbackProxies.joinRequest_proxy

    DiscordRPC.internals.discordRPClib.Discord_Initialize(applicationId, eventHandlers,
        autoRegister and 1 or 0, optionalSteamId)
end

DiscordRPC.internals.Shutdown = function()
    DiscordRPC.internals.discordRPClib.Discord_Shutdown()
end

DiscordRPC.internals.RunCallbacks = function()
    DiscordRPC.internals.discordRPClib.Discord_RunCallbacks()
end

-- http://luajit.org/ext_ffi_semantics.html#callback
jit.off(DiscordRPC.internals.RunCallbacks)

DiscordRPC.internals.UpdatePresence = function(presence)
    local func = "DiscordRPC.internals.UpdatePresence"
    DiscordRPC.internals.helperFunctions.CheckArg(presence, "table", "presence", func)

    -- -1 for string length because of 0-termination
    DiscordRPC.internals.helperFunctions.CheckStrArg(presence.state, 127, "presence.state", func, true)
    DiscordRPC.internals.helperFunctions.CheckStrArg(presence.details, 127, "presence.details", func, true)

    DiscordRPC.internals.helperFunctions.CheckIntArg(presence.startTimestamp, 64, "presence.startTimestamp", func, true)
    DiscordRPC.internals.helperFunctions.CheckIntArg(presence.endTimestamp, 64, "presence.endTimestamp", func, true)

    DiscordRPC.internals.helperFunctions.CheckStrArg(presence.largeImageKey, 31, "presence.largeImageKey", func, true)
    DiscordRPC.internals.helperFunctions.CheckStrArg(presence.largeImageText, 127, "presence.largeImageText", func, true)
    DiscordRPC.internals.helperFunctions.CheckStrArg(presence.smallImageKey, 31, "presence.smallImageKey", func, true)
    DiscordRPC.internals.helperFunctions.CheckStrArg(presence.smallImageText, 127, "presence.smallImageText", func, true)
    DiscordRPC.internals.helperFunctions.CheckStrArg(presence.partyId, 127, "presence.partyId", func, true)

    DiscordRPC.internals.helperFunctions.CheckIntArg(presence.partySize, 32, "presence.partySize", func, true)
    DiscordRPC.internals.helperFunctions.CheckIntArg(presence.partyMax, 32, "presence.partyMax", func, true)

    DiscordRPC.internals.helperFunctions.CheckStrArg(presence.matchSecret, 127, "presence.matchSecret", func, true)
    DiscordRPC.internals.helperFunctions.CheckStrArg(presence.joinSecret, 127, "presence.joinSecret", func, true)
    DiscordRPC.internals.helperFunctions.CheckStrArg(presence.spectateSecret, 127, "presence.spectateSecret", func, true)

    DiscordRPC.internals.helperFunctions.CheckIntArg(presence.instance, 8, "presence.instance", func, true)

    local cpresence = ffi.new("struct DiscordRichPresence")
    cpresence.state = presence.state
    cpresence.details = presence.details
    cpresence.startTimestamp = presence.startTimestamp or 0
    cpresence.endTimestamp = presence.endTimestamp or 0
    cpresence.largeImageKey = presence.largeImageKey
    cpresence.largeImageText = presence.largeImageText
    cpresence.smallImageKey = presence.smallImageKey
    cpresence.smallImageText = presence.smallImageText
    cpresence.partyId = presence.partyId
    cpresence.partySize = presence.partySize or 0
    cpresence.partyMax = presence.partyMax or 0
    cpresence.matchSecret = presence.matchSecret
    cpresence.joinSecret = presence.joinSecret
    cpresence.spectateSecret = presence.spectateSecret
    cpresence.instance = presence.instance or 0

    DiscordRPC.internals.discordRPClib.Discord_UpdatePresence(cpresence)
end

DiscordRPC.internals.ClearPresence = function()
    DiscordRPC.internals.discordRPClib.Discord_ClearPresence()
end

DiscordRPC.internals.replyMap = {
    no = 0,
    yes = 1,
    ignore = 2
}

DiscordRPC.internals.Respond = function(userId, reply)
    DiscordRPC.internals.helperFunctions.CheckStrArg(userId, nil, "userId", "DiscordRPC.internals.Respond")
    assert(DiscordRPC.internals.replyMap[reply],
        "Argument 'reply' to discordRPC.respond has to be one of \"yes\", \"no\" or \"ignore\"")
    DiscordRPC.internals.discordRPClib.Discord_Respond(userId, DiscordRPC.internals.replyMap[reply])
end

-- garbage collection callback
getmetatable(DiscordRPC.internals.gcDummy).__gc = function()
    DiscordRPC.internals.Shutdown()
    DiscordRPC.internals.callbackProxies.ready_proxy:free()
    DiscordRPC.internals.callbackProxies.disconnected_proxy:free()
    DiscordRPC.internals.callbackProxies.errored_proxy:free()
    DiscordRPC.internals.callbackProxies.joinGame_proxy:free()
    DiscordRPC.internals.callbackProxies.spectateGame_proxy:free()
    DiscordRPC.internals.callbackProxies.joinRequest_proxy:free()
end
--endregion

--region DiscordRPC Interface
function DiscordRPC:Initialize()
    self.internals.Initialize(self.internals.appID, false, "624820")
    -- TODO: schedule updates
    self.internals.lastUpdate = Utils.UnixTime() + 5
end

function DiscordRPC:UpdatePresence(presence)
    local time = Utils.UnixTime()
    local lastTime = self:GetLastUpdateTime()
    if time - lastTime < self.internals.minTimeDelta then
        Delay(5, DiscordRPC.UpdatePresence, DiscordRPC)
        print("[DiscordRPC] Scheduling update")
        return
    end

    self.internals.lastUpdate = Utils.UnixTime()
    print("[DiscordRPC] Updating presence")
    if not presence then self.internals.UpdatePresence(self.currentPresence); return end

    self.internals.UpdatePresence(presence)
end

function DiscordRPC:GetLastUpdateTime()
    return self.internals.lastUpdate
end

function DiscordRPC:Shutdown()
    -- TODO: unschedule updates
    self.internals.Shutdown()
end
--endregion

DiscordRPC.currentPresence = {
    state = "",
    details = "Lua development",
    startTimestamp = math.floor(Utils.UnixTime() - GlobalVars.realtime), -- opt
    endTimestamp = 0, -- opt
    largeImageKey = "csgoicon1",
    largeImageText = "CS:GO",
    smallImageKey = "luawhite",
    smallImageText = "aimless.lua",
    partyId = "",
    partySize = 0, -- opt
    partyMax = 0, -- opt
    matchSecret = "",
    joinSecret = "",
    spectateSecret = "",
    instance = 0, -- opt
}

if DiscordRPC.cfg.enable:GetBool() then
    DiscordRPC:Initialize()
    DiscordRPC:UpdatePresence()
    Schedule(20, DiscordRPC.UpdatePresence, DiscordRPC)
end
--endregion

local screenSize = EngineClient:GetScreenSize()

Tag = { "           ", "#          ", "a          ", "a#         ", "ai         ", "ai#        ", "aim        ",
    "aim#       ", "aiml       ", "aiml#      ", "aimle      ", "aimle#     ", "aimles     ", "aimles#    ",
    "aimless    ", "aimless#   ", "aimless.   ", "aimless.#  ", "aimless.l  ", "aimless.l# ", "aimless.lu ",
    "aimless.lu#", "aimless.lua", "aimless.lua", "aimless.lu#", "aimless.lu ", "aimless.l# ", "aimless.l  ",
    "aimless.#  ", "aimless.   ", "aimless#   ", "aimless    ", "aimles#    ", "aimles     ", "aimle#     ",
    "aimle      ", "aiml#      ", "aiml       ", "aim#       ", "aim        ", "ai#        ", "ai         ",
    "a#         ", "a          ", "#          ", "           " }

--region DLights
ffi.cdef [[
    typedef struct
    {
        unsigned char r, g, b;
        signed char exponent;
    } ColorRGBExp32;

    typedef struct
    {
        float x;
        float y;
        float z;
    } vec3_t;

    typedef struct
    {
        int		flags;
        vec3_t	origin;
        float	radius;
        ColorRGBExp32	color;
        float	die;
        float	decay;
        float	minlight;
        int		key;
        int		style;
        vec3_t	m_Direction;
        float	m_InnerAngle;
        float	m_OuterAngle;
    } dlight_t, *dlight_ptr_t;

    typedef dlight_ptr_t(__thiscall* alloc_dlight_t)(void*, int);
    typedef dlight_ptr_t(__thiscall* alloc_elight_t)(void*, int);
    typedef dlight_ptr_t(__thiscall* get_elight_by_key_t)(void*, int);
]]

local engine_effects = Utils.CreateInterface("engine.dll", "VEngineEffects001")
local engine_effects_class = ffi.cast(ffi.typeof("void***"), engine_effects)
local engine_effects_vtbl = engine_effects_class[0]

local alloc_dlight = ffi.cast("alloc_dlight_t", engine_effects_vtbl[4])
local alloc_elight = ffi.cast("alloc_elight_t", engine_effects_vtbl[5])
local get_elight_by_key = ffi.cast("get_elight_by_key_t", engine_effects_vtbl[8])

local cfgLocalDlights = Menu.SwitchColor("Visuals", "Dlights", "Local", false, Color.new(1.0, 1.0, 1.0))
local cfgTeamDlights = Menu.SwitchColor("Visuals", "Dlights", "Team", false, Color.new(0, 0, 1.0))
local cfgEnemyDlights = Menu.SwitchColor("Visuals", "Dlights", "Enemy", false, Color.new(1.0, 0, 0))
local cfgDlightsRadius = Menu.SliderFloat("Visuals", "Dlights", "Dlights Radius", 1.0, 200.0, 500.0)
local cfgDlightsExponent = Menu.SliderInt("Visuals", "Dlights", "Dlights Exponent", 1, 1, 20)
local cfgDlightsYOffset = Menu.SliderFloat("Visuals", "Dlights", "Y offset", 1, 1, 40)

local isDlightAllocated = {}
local dLights = {}

function DrawDlights()
    local players = EntityList.GetPlayers()
    local localPlayer = EntityList.GetLocalPlayer()
    for i = 1, #players do
        local isLocal = players[i]:EntIndex() == localPlayer:EntIndex()
        local isTeam = players[i]:IsTeamMate()
        local isEnemy = not isTeam and not isLocal
        local netState = players[i]:GetNetworkState()
        if not players[i]:IsAlive() or players[i]:IsDormant() then goto continue end
        if isLocal and not cfgLocalDlights:GetBool() then goto continue end
        if not isLocal and isTeam and not cfgTeamDlights:GetBool() then goto continue end
        if isEnemy and not cfgEnemyDlights:GetBool() then goto continue end

        if not isDlightAllocated[i] then
            dLights[i] = alloc_dlight(engine_effects_class, players[i]:EntIndex())
            isDlightAllocated[i] = true
        end

        local playerOrigin = players[i]:GetProp("DT_BasePlayer", "m_vecOrigin")

        local color = Color.new(1, 1, 1)
        if isLocal then color = cfgLocalDlights:GetColor()
        elseif isTeam then color = cfgTeamDlights:GetColor()
        else color = cfgEnemyDlights:GetColor() end

        local position = ffi.new("vec3_t")

        position.x = playerOrigin.x
        position.y = playerOrigin.y
        position.z = playerOrigin.z + cfgDlightsYOffset:GetFloat()

        dLights[i].flags = 0x2
        dLights[i].style = 0 -- 0-11
        dLights[i].key = players[i]:EntIndex()
        dLights[i].radius = cfgDlightsRadius:GetFloat()
        dLights[i].decay = 200 -- 200-500
        dLights[i].origin = position
        dLights[i].m_Direction = position
        dLights[i].die = GlobalVars.curtime + 0.05
        dLights[i].color.r = color.r * 255
        dLights[i].color.g = color.g * 255
        dLights[i].color.b = color.b * 255
        dLights[i].color.exponent = cfgDlightsExponent:GetInt()

        ::continue::
    end
    for i = #players, #dLights do
        dLights[i] = nil
        isDlightAllocated[i] = nil
    end
end

--endregion

--region Side Panel
local function hslToRgb(h, s, l)
    h = h / 360
    s = s / 100
    l = l / 100

    local r, g, b;

    if s == 0 then
        r, g, b = l, l, l;  -- achromatic
    else
        local function hue2rgb(p, q, t)
            if t < 0 then t = t + 1 end
            if t > 1 then t = t - 1 end
            if t < 1 / 6 then return p + (q - p) * 6 * t end
            if t < 1 / 2 then return q end
            if t < 2 / 3 then return p + (q - p) * (2 / 3 - t) * 6 end
            return p;
        end

        local q = l < 0.5 and l * (1 + s) or l + s - l * s;
        local p = 2 * l - q;
        r = hue2rgb(p, q, h + 1 / 3);
        g = hue2rgb(p, q, h);
        b = hue2rgb(p, q, h - 1 / 3);
    end
    local a = 1
    if not a then a = 1 end
    return Color.new(r, g, b, a)
end

function DrawRGBLine(p1, width, c1, c2)
    Render.GradientBoxFilled(p1, Vector2.new(p1.x + width, p1.y - 5), c1, c2, c1, c2) -- 5 pixels height (up)
end

local animSt = 0
function Panel1()
    animSt = animSt + GlobalVars.frametime * 10
    animSt = animSt % 360
    local animSt2 = (animSt + 60) % 360
    local p1, p2 = Vector2.new(screenSize.x - 320, 2), Vector2.new(screenSize.x - 320, screenSize.y + 3)
    Render.Blur(p1, Vector2.new(screenSize.x, screenSize.y))
    Render.BoxFilled(p1, screenSize, Color.new(0, 0, 0, 0.3))
    DrawRGBLine(p1, 320, hslToRgb(animSt, 100, 50), hslToRgb(animSt2, 100, 50))
    DrawRGBLine(p2, 320, hslToRgb(animSt, 100, 50), hslToRgb(animSt2, 100, 50))
end

function FadeBox(p1, p2, c1, c2, size, onlyTop)
    size = size or 2
    onlyTop = onlyTop or false
    Render.GradientBoxFilled(p1, Vector2.new(p2.x, p1.y + size), c1, c2, c1, c2)
    if onlyTop then return end
    Render.GradientBoxFilled(Vector2.new(p1.x, p2.y - size), p2, c1, c2, c1, c2)
end

Panel2 = {}
Panel2.cfg = {}
Panel2.cfg.enable = Menu.Switch("Misc", "Info Panel", "Enable", true)
Panel2.cfg.height = Menu.SliderInt("Misc", "Info Panel", "Height", 600, 200, 1000, "Height of the info panel")
Panel2.cfg.darkness = Menu.SliderFloat("Misc", "Info Panel", "Darkness", 0.7, 0, 1, "Darkness")
Panel2.cfg.fadeSpeed = Menu.SliderFloat("Misc", "Info Panel", "Fade Speed", 20, 10, 60, "Speed of the fade animation")
Panel2.cfg.fadeWide = Menu.SliderInt("Misc", "Info Panel", "Fade Wide", 60, 40, 100, "Wide of the fade")
Panel2.cfg.onlyTop = Menu.Switch("Misc", "Info Panel", "Only Top", false)
Panel2.cfg.bludDisable = Menu.Switch("Misc", "Info Panel", "Disable blur", false)
Panel2.font = Render.InitFont("Calibri Light", 24)

--region Sheet Print
local testSheet = {
    { "Player Name", "Team damage" },
    { "Player 1", 126 },
    { "Player 2", 215 },
    { "Player 3", 13 },
    { "Player 4", 0 },
    { "Player 5", 2 }
}

local textHeight = 18

function PrintDamageSheet(p1, p2, data)
    Render.Box(p1, p2, Color.new(1, 1, 1, 0.6))
    local panWidth, panHeight = p2.x - p1.x, p2.y - p1.y
    local rowH = (panHeight - textHeight) / (#data - 1)
    for i, v in ipairs(testSheet) do
        Render.Box(Vector2.new(p1.x, p1.y + (i - 1) * rowH), Vector2.new(p1.x + textWidth + 10, p1.y + (i * rowH)), Color.new(1, 1, 1, 1))
        Render.Text(v[1], Vector2.new(p1.x, p1.y + (i - 1) * rowH), Color.new(1, 1, 1, 1), 18)
    end
    for i, v in ipairs(testSheet) do
        local textWidth = Render.CalcTextSize(tostring(v[2]), 18).x + 5
        Render.Box(Vector2.new(p2.x - textWidth, p1.y + (i - 1) * rowH), Vector2.new(p2.x, p1.y + (i * rowH)), Color.new(1, 1, 1, 1))
        Render.Text(tostring(v[2]), Vector2.new(p2.x - textWidth, p1.y + (i - 1) * rowH), Color.new(1, 0.1, 0, 0.8), 18)
    end
end
--endregion

function Panel2Main()
    local cfg = Panel2.cfg
    if not cfg.enable:Get() then return end
    animSt = animSt + GlobalVars.frametime * cfg.fadeSpeed:Get()
    animSt = animSt % 360
    local animSt2 = (animSt + cfg.fadeWide:Get()) % 360
    local p1, p2 = Vector2.new(screenSize.x - 320, screenSize.y / 2 - cfg.height:Get() / 2),
        Vector2.new(screenSize.x, screenSize.y / 2 + cfg.height:Get() / 2)
    if not cfg.bludDisable:Get() then Render.Blur(p1, p2) end
    Render.BoxFilled(p1, p2, Color.new(0, 0, 0, cfg.darkness:Get()))
    FadeBox(p1, p2, hslToRgb(animSt, 100, 50), hslToRgb(animSt2, 100, 50), 2, cfg.onlyTop:Get())
    Render.Text("TEAM DAMAGE", p1 + Vector2.new(10, 10), Color.new(1, 1, 1, 1), 21, Panel2.font)
    PrintDamageSheet(p1, p2, testSheet)
end

function DrawSidePanel()
    Panel2Main()
end
--endregion

--region ChatTranslation
LanguageCodes = {
    'en', 'pl', 'es'
}

ChatTranslator = {}

--region Config
ChatTranslator.cfg = {}
ChatTranslator.cfg.enable = Menu.Switch("In-Game", "Chat Translation", "Enable", false, "Enable in-game chat translation")
ChatTranslator.cfg.outputTarget = Menu.MultiCombo("In-Game", "Chat Translation", "Output to:",
    { "Console", "Notifications", "Chat" }, 1, "Choose where to display translation results")
ChatTranslator.cfg.chatMode = Menu.Combo("In-Game", "Chat Translation", "Chat mode:", { "Local", "Team", "All" }, 0,
    "Choose on which chat the translation result will be displayed")
ChatTranslator.cfg.translateTo = Menu.Combo("In-Game", "Chat Translation", "Translate to: ",
    { "English", "Polish", "Spanish" }, 0, "Choose the translation target language")
--endregion

ChatTranslator.vars = {}
ChatTranslator.vars.apiKey = "-- SECRET --"

local charToHex = function(c)
    return string.format("%%%02X", string.byte(c))
end

local function urlEncode(url)
    if url == nil then
        return
    end
    url = url:gsub("\n", "\r\n")
    url = url:gsub("([^%w ])", charToHex)
    url = url:gsub(" ", "+")
    return url
end

local hexToChar = function(x)
    return string.char(tonumber(x, 16))
end

local urldecode = function(url)
    if url == nil then
        return
    end
    url = url:gsub("+", " ")
    url = url:gsub("%%(%x%x)", hexToChar)
    return url
end

ChatTranslator.vars.lastUpdate = 0

ChatTranslator.callbacks = {
    { "player_chat", function(e)
        if Utils.UnixTime() - ChatTranslator.vars.lastUpdate < 5 then
            print("Anti spam")
            return
        end
        ChatTranslator.vars.lastUpdate = Utils.UnixTime()
        local teamOnly, userID, text = e:GetBool("teamonly", true), e:GetInt("userid", -1), e:GetString("text", "")
        local player = EntityList.GetPlayerForUserId(userID)
        if not player then print("Translation player error"); return end

        ChatTranslator.HandleTranlation(player:GetName(), text)
    end },
}

function TCallback(e)
    if Utils.UnixTime() - ChatTranslator.vars.lastUpdate < 5 then
        print("Anti spam")
        return
    end
    ChatTranslator.vars.lastUpdate = Utils.UnixTime()
    local teamOnly, userID, text = e:GetBool("teamonly", true), e:GetInt("userid", -1), e:GetString("text", "")
    local player = EntityList.GetPlayerForUserId(userID)
    if not player then print("Translation player error"); return end

    ChatTranslator.HandleTranlation(player:GetName(), text)
end

function ChatTranslator.HandleTranlation(sender, text)
    local req = string.format("https://translation.googleapis.com/language/translate/v2?key=%s&q=%s&target=%s",
        ChatTranslator.vars.apiKey, urlEncode(text), LanguageCodes[ChatTranslator.cfg.translateTo:Get() + 1])
    Http.GetAsync(req, function(url_content)
        local res = JSON.parse(url_content)
        local fromL, toL = string.upper(res.data.translations[0].detectedSourceLanguage),
            string.upper(LanguageCodes[ChatTranslator.cfg.translateTo:Get() + 1])

        local translatedText = res.data.translations[0].translatedText
        Output.PrintChat("[%sTranslator%s] [%s>%s] %s: %s", Colors.Blue, Colors.White, fromL, toL, sender or "null",
            translatedText)
    end)
end

EventDispatcher:RegisterCallback("player_chat", TCallback)
--endregion

--region Memory Management
local C = ffi.C
local kernel32 = ffi.load("kernel32")

ffi.cdef([[
// Redefinitions for WinAPI conventions
typedef void VOID;
typedef VOID* LPVOID;
typedef uintptr_t ULONG_PTR;
typedef ULONG_PTR SIZE_T;
typedef unsigned long DWORD;
typedef unsigned long* PDWORD;
typedef int BOOL;
// Property flags for functions below
enum{
    MEM_COMMIT = 0x1000,
    MEM_RESERVE = 0x2000
};
enum{
    PAGE_EXECUTE_READ       = 0x20,
    PAGE_EXECUTE_READWRITE  = 0x40
};
enum{
    MEM_RELEASE = 0x8000
};
// Function headers for correct Lua->C->Lua conversions
LPVOID __stdcall VirtualAlloc(LPVOID, SIZE_T, DWORD, DWORD);
BOOL __stdcall VirtualFree(LPVOID, SIZE_T, DWORD);
BOOL VirtualProtect(LPVOID lpAddress, SIZE_T dwSize, DWORD flNewProtect, PDWORD lpflOldProtect);
]])

Memory = {}
-- Metatable for C function wrapping
Memory.internals = {}
Memory.internals.func_mt = {
    __call = function(obj, ...)
        return obj[1](...)
    end,
    __tostring = function(obj)
        return tostring(obj[1])
    end
}

--region Helper Functions
H = {
    enableArgChecks = false
}

function H.CheckArg(value, expectedType, message)
    if not H.enableArgChecks then return end
    if type(value) == expectedType then return end
    local msg = "[TypeError] Expected " .. expectedType .. "... got " .. type(value)
    if message and type(message) == "string" then msg = msg .. "\n\t=>\t" .. message end
    error(msg)
end

function H.CheckArgs(checks, message)
    for k, v in pairs(checks) do
        H.CheckArg(v[1], v[2], message)
    end
end
--endregion

function Memory.CreateBuffer(byteCount)
    local allocMemory = kernel32.VirtualAlloc(nil, byteCount, C.MEM_COMMIT + C.MEM_RESERVE, C.PAGE_EXECUTE_READWRITE) -- TODO: change page privs
    if not allocMemory then error("[MemoryAllocationError] Memory allocation failed\n\t=> Memory.GetBuffer") end
    ffi.gc(allocMemory, function(memory) kernel32.VirtualFree(memory, 0, C.MEM_RELEASE) end)
    return allocMemory
end

function Memory.DestroyBuffer(buffer)
    if buffer then
        kernel32.VirtualFree(buffer, 0, C.MEM_RELEASE)
    end
    return nil
end

-- Conversion between Byte Array and C Buffer
function Memory.Array2Buffer(buffer, array, bufferSize)
    if bufferSize and bufferSize > #array then error("[BufferOverflow] Buffer is too small\n\t=>\tMemory.Array2Buffer") end
    H.CheckArgs({ { array, "table" }, { array[1], "number" }, { buffer, "cdata" } }, "Memory.Array2Buffer")
    ffi.copy(buffer, ffi.new("char[?]", #array, array), #array)
end

function Memory.Array2Func(header, code)
    H.CheckArgs({ { header, "string" }, { code, "table" } }, "Memory.Array2Func")
    local buffer = Memory.CreateBuffer(#code)
    Memory.Array2Buffer(buffer, code, #code)

    -- make it non writable
    local oldProt = ffi.new('uint32_t[1]')
    kernel32.VirtualProtect(buffer, #code, C.PAGE_EXECUTE_READ, oldProt)

    -- Return executable memory as function (packed in table with memory to keep her safe from garbage collection)
    return setmetatable(
        { ffi.cast(header, buffer), buffer },
        Memory.internals.func_mt
    )
end

function Memory.CBuffer2Func(header, buffer, bufferSize)
    H.CheckArgs({ { header, "string" }, { buffer, "cdata" } }, "Memory.CBuffer2Func")

    if bufferSize then
        local oldProt = ffi.new('uint32_t[1]')
        kernel32.VirtualProtect(buffer, bufferSize, C.PAGE_EXECUTE_READ, oldProt)
    end

    return setmetatable(
        { ffi.cast(header, buffer), buffer },
        Memory.internals.func_mt
    )
end

function Memory.FillBuffer(buffer, bufferSize, ...)
    -- calculate needed size of the buffer
    local neededSize = 0
    local args = { ... }
    for k, v in pairs(args) do
        H.CheckArg(v, "table", "[FillBuffer] Wrong argument types")
        if type(v[1]) == "number" then -- byte array
            neededSize = neededSize + #v
        elseif type(v[1]) == "cdata" then -- c buffer
            neededSize = neededSize + v[2]
        end
    end

    -- check whether it will fit into buffer
    if neededSize > bufferSize then error("[BufferOverflow] Buffer is too small") end

    -- save original type
    local origType = ffi.typeof(buffer)
    buffer = ffi.cast("char*", buffer)

    -- Copy code into writable memory
    local bytesWritten = 0
    for k, v in pairs(args) do
        if type(v[1]) == "number" then
            Memory.Array2Buffer(buffer + bytesWritten, v, bufferSize)
            bytesWritten = bytesWritten + #v
        elseif type(v[1]) == "cdata" then
            -- size v[2]
            local t1 = ffi.cast("char*", v[1])
            ffi.copy(buffer + bytesWritten, t1, v[2])
            bytesWritten = bytesWritten + v[2]
        end
    end

    -- restore original type
    buffer = ffi.cast(origType, buffer)
    return setmetatable(
        { buffer },
        Memory.internals.func_mt
    )
end

function Memory.OverwriteBytes(address, byteArray)
    H.CheckArgs({ { address, "cdata" }, { byteArray, "table" } }, "Memory.OverwriteBytes[with Byte Array]")
    local arrSize = #byteArray

    -- save current perms
    local oldProt = ffi.new("DWORD[1]")
    local res = kernel32.VirtualProtect(address, #byteArray, C.PAGE_EXECUTE_READWRITE, oldProt)

    -- convert & copy array into the buffer
    Memory.Array2Buffer(address, byteArray)

    -- restore old perms
    res = kernel32.VirtualProtect(address, #byteArray, oldProt[0], oldProt)
end

function Memory.OverwriteBytes(address, sourceBuffer, byteCount)
    H.CheckArgs({ { address, "cdata" }, { sourceBuffer, "cdata" }, { byteCount, "number" } },
        "Memory.OverwriteBytes[with C Buffer]")

    -- save & change current protection
    local oldProt = ffi.new("DWORD[1]")
    kernel32.VirtualProtect(address, byteCount, C.PAGE_EXECUTE_READWRITE, oldProt)

    -- copy bytes
    ffi.copy(address, sourceBuffer, byteCount)

    -- restore to the old protection
    kernel32.VirtualProtect(address, byteCount, oldProt[0], oldProt)
end

-- Test

--local func = Memory.Array2Func("int (*)(int, int)", {0x8b, 0x44, 0x24, 0x08, 0x03, 0x44, 0x24, 0x04, 0xc3})
--[[
   0:	8b 44 24 08          	mov    0x8(%esp),%eax
   4:	03 44 24 04          	add    0x4(%esp),%eax
   8:	c3                   	ret
--]]
--print(func(-1, 4))	-- 3

--endregion

--region Hooking Playground
ffi.cdef [[
    typedef bool(__thiscall *tDispatchUserMessage)(void*, int type, unsigned int a3, unsigned int length, const void *msg_data);
]]

function PrintBytes(arr, n)
    for i = 0, n - 1 do
        print(string.format("%X", arr[i]))
    end
end

local replacedBytes = '\x55\x8B\xEC\x83\xE4\xF8'
local sigDUM = '55 8B EC 83 E4 F8 83 EC 4C 53 56 8D 44 24 34'

local match = Utils.PatternScan("client.dll", sigDUM) or error("Couldn't find DispatchUserMessage")
local dumAddr = ffi.cast("char*", match) -- DispatchUserMessage address

local origDispatchUserMessage = ffi.cast("tDispatchUserMessage", dumAddr)

-- Trampoline Prep [6 bytes saved + 5 bytes to jump]
local trampoline = ffi.new("char[11]")
ffi.copy(trampoline, dumAddr, 6)
local tmp = trampoline + 6
tmp[0] = 0xE9 -- jmp opcode
tmp = ffi.cast("int*", tmp+1)
local offset = trampoline - dumAddr - 6
tmp[0] = offset

function DUM(ths, type, a3, length, msgData)
    print(msgData)
end
local castedCallback = ffi.cast("tDispatchUserMessage", DUM)
castedCallback = ffi.cast("char*", castedCallback)

offset = dumAddr - castedCallback - 5
local jumpBuffer = ffi.new("char[5]")
jumpBuffer[0] = 0xE9
local temp = ffi.cast("int*", jumpBuffer + 1)
temp[0] = offset; temp = nil

ffi.copy(dumAddr, jumpBuffer, 5)
-- function should be hooked at this point
--endregion

Cheat.RegisterCallback("draw", function()
        if Cheat.IsMenuVisible() then end

        -- Spectators:draw()
        DrawDlights()
        Scheduler:OnDraw()
        -- Panel:OnDraw()
        DrawSidePanel()
    end)

-- LUA Unload Callback
Cheat.RegisterCallback("destroy", function()
        if DiscordRPC.cfg.enable:GetBool() then
         DiscordRPC:Shutdown()
        end
    end)
