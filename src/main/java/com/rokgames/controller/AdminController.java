package com.rokgames.controller;

import com.rokgames.dao.GameDao;
import com.rokgames.model.Game;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

/**
 * Created by Dare on 16/03/2016.
 */

@Controller
public class AdminController {
    private Path path;

    @Autowired
    private GameDao gameDao;


    @RequestMapping("/login")
    public String login(@RequestParam( value = "error" ,required = false) String error,
                        @RequestParam(value = "logout",required = false) String logout, Model model
                        )
    {

        if(error!=null)
        {
            model.addAttribute("error", "Invalid Username and Password Combination");
        }
        if (logout!=null)
        {
            model.addAttribute("msg", "You Have Been Logout Successfuly");

        }

        return "login";
    }

    @RequestMapping("/admin")
    public String adminPage(Model model) {
        return "admin";
    }

    @RequestMapping("/admin/gameInventory")
    public String admingameInventory(Model model) {
        List<Game> glist = gameDao.getallgames();

        model.addAttribute("game", glist);
        return "gameInventory";
    }

    @RequestMapping("/admin/gameInventory/addGame")
    public String addGamePage(Model model) {
        Game game = new Game();
        model.addAttribute("game", game);

        return "addGame";
    }

    @RequestMapping(value = "/admin/gameInventory/addGame", method = RequestMethod.POST)
    public String addGamePost(@ModelAttribute("game") Game game  ,HttpServletRequest request) {
        System.out.print(game.getCategory());
        System.out.print(game.getName());
        System.out.print(game.getManufacturer());System.out.print(game);

        gameDao.addGame(game);

        MultipartFile gameimage = game.getGameImage();
        String rootDirectory = request.getSession().getServletContext().getRealPath("/");
        path = Paths.get(rootDirectory + "\\WEB-INF\\resources\\images\\" + game.getGameID() + ".png");

        if(gameimage != null && !gameimage.isEmpty())
        {
            try {

                gameimage.transferTo(new File(path.toString()));

            }catch (Exception e)
            {
                e.printStackTrace();
                throw  new RuntimeException("Image Saving Failed",e);


            }

        }

        return "redirect:/admin/gameInventory";
    }

    @RequestMapping("/admin/gameInventory/deleteGame/{ID}")
    public String deleteGame(@PathVariable String ID, Model model,HttpServletRequest request) {

        String rootDirectory = request.getSession().getServletContext().getRealPath("/");
        path = Paths.get(rootDirectory + "\\WEB-INF\\resources\\images\\" + ID+".png");

        if(Files.exists(path)){

            try {

                Files.delete(path);

            }catch (Exception e)
            {
                e.printStackTrace();
            }

        }
        gameDao.deleteGame(ID);

        return "redirect:/admin/gameInventory";
    }
}
