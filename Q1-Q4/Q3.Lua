function RemovePlayerFromPlayerParty(playerId, memberName)
    local player = Player(playerId)
    if not player then
        print("Player not found")
        return false
    end

    local party = player:getParty()
    if not party then
        print("Player is not in a party")
        return false
    end

    local memberToRemove = Player(memberName)
    if not memberToRemove then
        print("Member to remove not found")
        return false
    end
    
    -- for loop to check all members in the party to check if it any match with the member to remove
    for _, member in pairs(party:getMembers()) do
        if member == memberToRemove then
            party:removeMember(memberToRemove)
            return true
        end
    end
    return false
end

--[[
    Documentation:
    - Changed function name to RemovePlayerFromPlayerParty to make it clear what the function does and changed membername to memberName (camelcase)
    - Added Error Handling to all variables to make sure the loop doesnt break
    - Added memberToRemove variable as it was used multiple times and to make the code clearer
    - Improved the end result of the functon by returning true or false to know if the operation was successful
    - Improved loop call as one variable was not needed and gave a clearer variable name
]]