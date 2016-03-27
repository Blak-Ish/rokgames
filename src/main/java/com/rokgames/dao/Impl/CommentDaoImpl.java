package com.rokgames.dao.Impl;

import com.rokgames.dao.CommentDao;
import com.rokgames.model.Comment;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.TypedQuery;
import java.util.List;

/**
 * Created by Dare on 17/03/2016.
 */
@Repository
@Transactional
public class CommentDaoImpl implements CommentDao {

    @Autowired
    private SessionFactory sessionFactory;

    public void addComment(Comment comment) {

        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(comment);
        session.flush();

    }

    public List<Comment> getallcommentForGame(String gameID) {

        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Comment where gameID=:ID");
        query.setInteger("ID", Integer.parseInt(gameID));
        List<Comment> clist = query.list();


        return clist;
    }

    public void deleteGame(String ID) {



    }
}
