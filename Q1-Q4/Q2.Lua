function printSmallGuildNames(memberCount)
    -- this method is supposed to print names of all guilds that have less than memberCount max members

    -- Error Check
    if type(memberCount) ~= "number" then -- checks if memberCount is not a number
        print("Erorr: memberCount must be a number")
        return
    end

    -- The SQL Query
    local selectGuildQuery = string.format("SELECT name FROM guilds WHERE max_members < %d;", memberCount)
    local result = db.storeQuery(selectGuildQuery) -- Executres the query and stores the reseult

    -- Prints the guild names
    while db.cycle(result) do -- abstracted/psuedocode instead of using LuaSQL cursor or SQLite3 step functions which just goes to the next guildName from the query
        local guildName = db.getString(result,"name")
        print(guildName)
    end
end

--[[
    Documentation:
    - Added an Error check to make sure the variable passed to the function is valid to avoid database leaks
    - Improved the SQL Query using string.format for simplicity
    - Used a while loop so it can print all of the guild names instead of just one
    - Used a abstracted/pseudocode function db.cycle which acts like an array[i+1] for the db query
]]