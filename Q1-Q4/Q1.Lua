-- Variables
local storageIndex = 1000
local logoutDelayMS = 1000

-- Function to reset storage value when player logs out
local function releaseStorage(player)
    if not player then -- Error Check to make sure player passed into function is valid
        print("Error: player is null")
        return
    end
    player:setStorageValue(storageIndex, -1)
end

-- Function that gets called when a player logs out
function onLogout(player)
    if not player then
        print("Error: player is null")
        return
    end
    if player:getStorageValue(storageIndex) == 1 then -- Checks if its valid
        addEvent(releaseStorage, logoutDelayMS, player) -- Im assuming addEvent is a coroutine function from a library
    end
    return true -- Makes sure the player is logged out properly
end

--[[
    Documentation (changes):
    - Replaced numbers inside functions with variables to make the code clearer, easier to debug, understand and change
    - Added comments to understand what parts of the function do
    - Added Error checking to see if the value of player passed in is valid. However, I am not sure if I need it for both functions and it may be redundant
    - Hope your having a good day :D
]]
