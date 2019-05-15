package com.vs.controller;

import com.vs.entity.Article;
import com.vs.entity.Testpaper;
import com.vs.entity.User;
import com.vs.service.*;
import com.vs.util.functions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class UserController {
  @Resource private ArticleService articleService;
  @Resource private UserService userService;
  @Resource private VideoService videoService;
  @Resource private ResService resService;
  @Resource private TestpaperService testpaperService;

  //  首页
  @RequestMapping("/")
  public String index(Model model) {
    List<Article> articles = articleService.getFirst10Article();
    model.addAttribute("articles", articles);
    return "views/index";
  }

  //  聊天
  @RequestMapping("/chatRoom")
  public String chat(Model model,HttpSession session) {
    model.addAttribute("nickname",((User)session.getAttribute("user")).getNickname());
    return "views/chatRoom";
  }

  //    注册页面
  @RequestMapping("/userRegister")
  public String userRegister() {
    return "user/register";
  }

  @RequestMapping("/userRegisterAction")
  public String userRegisterAction(HttpServletRequest request, User user, Model model) {
    if (userService.register(user.getUsername(), user.getPassword(), user.getNickname())) {
      request.getSession().setAttribute("user", user);
      model.addAttribute("user", user);
      return "redirect:/";
    } else {
      model.addAttribute("error", "用户名已被注册");
      return "user/register";
    }
  }

  @RequestMapping("/userLogin")
  public String userLogin() {
    return "user/login";
  }

  @RequestMapping(value = "/userLoginAction", method = RequestMethod.POST)
  public String userLoginAction(HttpSession session, User user, Model model) {
    if (userService.login(user.getUsername(), user.getPassword())) {
      session.setAttribute("user",userService.getUser(user.getUsername(), user.getPassword()));
      return "redirect:/";
    } else {
      model.addAttribute("error", "用户名或密码错误");
      return "user/login";
    }
  }

  @RequestMapping(method = RequestMethod.GET, value = "/userLoginAction")
  public String userLoginAction(HttpServletRequest request, Model model) {
    if (request.getSession().getAttribute("user") == null) {
      return "user/login";
    }
    return "redirect:/";
  }

  @RequestMapping("/articlePage")
  public String ArticlePage(Model model) {
    model.addAttribute("articles", articleService.getAllArticles());
    return "views/articlePage";
  }

  @RequestMapping("/videoPage")
  public String VideoPage(Model model) {
    model.addAttribute("videos", videoService.getAllVideo());
    return "views/videoPage";
  }

  @RequestMapping("/resDownloadPage")
  public String ResDownloadPage(Model model) {
    model.addAttribute("resources", resService.getAllRes());
    return "views/resDownloadPage";
  }

  @RequestMapping("/paperTestPage")
  public String PaperTestPage(Model model,HttpSession session) {
    User user = (User) session.getAttribute("user");
    model.addAttribute("nickname",user.getNickname());
    model.addAttribute("averageNum",user.getAverageNum());
    model.addAttribute("total",user.getTotal());
    model.addAttribute("errorNum",functions.stringToList(user.getErrorList()).size());
    return "views/paperTestPage";
  }

  @RequestMapping("/paperTestStart")
  public String paperTestStart(Model model){
    model.addAttribute("testpapers",testpaperService.getRandomTestpaper(20));
    return "views/paperTestStart";
  }

  @RequestMapping("/paperTestReview")
  public String paperTestReview(Model model,HttpSession session){
    User user = (User) session.getAttribute("user");
    List<Integer> list = functions.stringToList(user.getErrorList());
    model.addAttribute("testpapers",testpaperService.getTestpaperByIds(list));
    model.addAttribute("size",testpaperService.getTestpaperByIds(list).size());
    return "views/paperTestReview";
  }



}
