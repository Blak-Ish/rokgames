package com.rokgames.dao;

import com.rokgames.model.Comment;
import com.rokgames.model.Game;

import java.util.List;

/**
 * Created by Dare on 17/03/2016.
 */
public interface CommentDao {


    void addComment(Comment comment);

    List<Comment> getallcommentForGame(String gameID);

    void deleteGame(String ID);
}
