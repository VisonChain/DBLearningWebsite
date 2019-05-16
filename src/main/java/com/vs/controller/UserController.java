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
    User u =userService.getUser(user.getUsername(),user.getPassword());
    model.addAttribute("nickname",u.getNickname());
    model.addAttribute("averageNum",u.getAverageNum());
    model.addAttribute("total",u.getTotal());
    model.addAttribute("errorNum",u.getErrorNum());
    return "views/paperTestPage";
  }

  @RequestMapping("/paperTestStart")
  public String paperTestStart(Model model,HttpSession session){
    List<Testpaper> testpapers = testpaperService.getRandomTestpaper(20);
    model.addAttribute("testpapers",testpapers);
    session.setAttribute("testpapers",testpapers);
    return "views/paperTestStart";
  }

  @RequestMapping("/paperTestReview")
  public String paperTestReview(Model model,HttpSession session){
    User user = (User) session.getAttribute("user");
    User u = userService.getUser(user.getUsername(),user.getPassword());
    List<Integer> list = functions.stringToList(u.getErrorList());
    for (int i =0;i<list.size();i++){
      if (list.get(i)==0){
        list.remove(i);
      }
    }
    model.addAttribute("testpaperReview",testpaperService.getTestpaperByIds(list));
    model.addAttribute("size",testpaperService.getTestpaperByIds(list).size());
    return "views/paperTestReview";
  }

  @RequestMapping("/paperTestResult")
  public String paperTestResult(HttpServletRequest request,Model model){
    int count = 0;
    List<Integer> list1 = new ArrayList<Integer>();
    User user = (User) request.getSession().getAttribute("user");
    User u = userService.getUser(user.getUsername(),user.getPassword());
    List<Testpaper> testpapers = (List<Testpaper>) request.getSession().getAttribute("testpapers");
    for (int i=0;i<20;i++){
      if (testpapers.get(i).getAnswer().equals(request.getParameter("answer"+String.valueOf(i)))){
        count++;
      }else {
        list1.add(testpapers.get(i).getId());
      }
    }
    u.setErrorList(functions.listAppend(functions.stringToList(u.getErrorList()),list1));
    u.setTotal(u.getTotal()+20);
    u.setErrorNum(u.getErrorNum()+20-count);
    u.setAverageNum(100.0*(u.getTotal()-u.getErrorNum())/u.getTotal());
    userService.updateUser(u);
    model.addAttribute("errorTestpapers",testpaperService.getTestpaperByIds(list1));
    model.addAttribute("count",5*count);
    return "views/paperTestResult";
  }


}
