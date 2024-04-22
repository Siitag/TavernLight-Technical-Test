void Game::addItemToPlayer(const std::string& recipient, uint16_t itemId)
{
    Player* player = g_game.getPlayerByName(recipient);
    if (!player) {
        player = new Player(nullptr);
        if (!IOLoginData::loadPlayerByName(player, recipient)) {
            delete player; // delete player if loadPlayerByName function fails as no saved data for the player
            return;
        }
    }

    Item* item = Item::CreateItem(itemId);
    if (!item) {
        delete player; // free the memory allocated as player object is not needed anymore if CreateItem fails
        return;
    }

    g_game.internalAddItem(player->getInbox(), item, INDEX_WHEREEVER, FLAG_NOLIMIT);

    if (player->isOffline()) {
        IOLoginData::savePlayer(player);
    }
    else {
        delete player; // if player is online we dont need the player object here as this function only uses it if the player is offline so we can delete it here
    }
}

/*
    Documentation:
    - Added delete player to the 3 functions to where I think will fix the memory leak issues
    - Thanks for reading this far :)
*/
