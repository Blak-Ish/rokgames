package com.rokgames.controller;

import com.rokgames.dao.CommentDao;
import com.rokgames.dao.GameDao;
import com.rokgames.model.Comment;
import com.rokgames.model.Game;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

/**
 * Created by Dare on 11/03/2016.
 */

@Controller
public class HomeController {



    @Autowired
    private GameDao gameDao;

    @Autowired
    private CommentDao commentDao;


    @RequestMapping("/")
    public String home() {
        return "home";
    }

    @RequestMapping("/category")
    public String Category()
    {
        return "gameCategory";
    }


    @RequestMapping("/gamelist")
    public String getAllGames(Model model) {

        List<Game> glist = gameDao.getallgames();

        model.addAttribute("game", glist);
        return "gamelist";
    }

    @RequestMapping("/gamelist/viewgame/{gameID}")
    public String viewGame(@PathVariable String gameID, Model model) throws IOException {
        Game game = gameDao.getgamebyID(gameID);
        Comment comment = new Comment();
        comment.setGameID(game.getGameID());
        List<Comment> commentList = commentDao.getallcommentForGame(gameID);
        model.addAttribute(game);
        model.addAttribute("commentList",commentList);
        model.addAttribute("comment" ,comment);


        return "gamedetails";
    }
    @RequestMapping( value = "/gamelist/viewgame/{gameID}/addcomment" , method = RequestMethod.POST)
    public String addComment(@ModelAttribute("comment") Comment comment  ,HttpServletRequest request)
    {
        commentDao.addComment(comment);
        return "redirect:/gamelist/viewgame/"+comment.getGameID();
    }

    @RequestMapping(value = "*")
    public  String fallbackMethod()
    {
        return"error404";
    }


}
