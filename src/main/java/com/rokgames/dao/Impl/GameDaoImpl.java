package com.rokgames.dao.Impl;

import com.rokgames.dao.GameDao;
import com.rokgames.model.Game;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


import java.util.List;

/**
 * Created by Dare on 13/03/2016.
 */
@Repository
@Transactional
public class GameDaoImpl implements GameDao {

    @Autowired
    private SessionFactory sessionFactory;

    public void addGame(Game game) {

        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(game);
        session.flush();

    }

    public Game getgamebyID(String ID) {
        Session session = sessionFactory.getCurrentSession();
        Game game = (Game)session.get(Game.class,Integer.parseInt(ID));
        session.flush();
        return game;
    }

    public List<Game> getallgames() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Game");
        List<Game> glist = query.list();
        session.flush();
        return glist;
    }

    public void deleteGame(String ID) {
        Session session = sessionFactory.getCurrentSession();
        session.delete(getgamebyID(ID));
        session.flush();

    }
}
