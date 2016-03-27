package com.rokgames.dao;

import com.rokgames.model.Game;

import java.util.List;

/**
 * Created by Dare on 13/03/2016.
 */
public interface GameDao {

    void addGame(Game game);

    Game getgamebyID(String ID);

    List<Game> getallgames();

    void deleteGame(String ID);
}
