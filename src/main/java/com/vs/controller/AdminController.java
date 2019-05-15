package com.vs.controller;

import com.google.gson.Gson;
import com.vs.entity.Admin;
import com.vs.entity.Article;
import com.vs.entity.Testpaper;
import com.vs.service.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
public class AdminController {
  @Resource private ArticleService articleService;
  @Resource private AdminService adminService;
  @Resource private ResService resService;
  @Resource private VideoService videoService;
  @Resource private TestpaperService testpaperService;

  // 后台主页
  @RequestMapping("/ad")
  public String admin(Model model) {
    model.addAttribute("articles", articleService.getFirst10Article());
    return "admin/index";
  }

  //  后台登录
  @RequestMapping("/ad/adminLogin")
  public String adminLogin() {
    return "admin/login";
  }

  @RequestMapping(value = "/ad/adminLoginAction", method = RequestMethod.POST)
  public String adminLoginAction(HttpServletRequest request, Admin admin, Model model) {
    if (adminService.login(admin.getUsername(), admin.getPassword())) {
      request.getSession().setAttribute("admin", admin);
      model.addAttribute("admin", admin);

      return "redirect:/ad";

    } else {
      model.addAttribute("error", "用户名或密码错误");
      return "admin/login";
    }
  }

  @RequestMapping(method = RequestMethod.GET, value = "/ad/adminLoginAction")
  public String adminLoginAction(HttpServletRequest request, Model model) {
    if (request.getSession().getAttribute("admin") == null) {
      return "admin/login";
    }
    return "redirect:/ad";
  }

  //  文章管理
  @RequestMapping("/ad/articleManger")
  public String articleManger(Model model) {
    model.addAttribute("articles", articleService.getAllArticles());
    return "admin/articleManger";
  }

  @RequestMapping("/ad/articleInsert")
  public String write() {
    return "admin/articleEdit";
  }

  @RequestMapping(value = "/ad/write", method = RequestMethod.POST)
  public String write(Article article) {
    System.out.println("article:" + new Gson().toJson(article));
    if (article.getId() == 0l) {
      articleService.insertArticle(article);
    } else {
      articleService.updateArticle(article);
    }
    return "redirect:/ad/articleManger";
  }

  @RequestMapping("/ad/delete/{id}")
  public String delete(@PathVariable("id") int id) {
    articleService.deleteArticleById(id);
    return "redirect:/ad/articleManger";
  }

  @RequestMapping("/ad/update/{id}")
  public String update(@PathVariable("id") int id, Model model) {
    Article article = articleService.getArticleById(id);
    model.addAttribute("article", article);
    return "admin/articleEdit";
  }

  //  资源管理
  @RequestMapping("/ad/resManger")
  public String uploadRes(Model model) {
    model.addAttribute("resources", resService.getAllRes());
    return "admin/resManger";
  }

  @RequestMapping("/ad/resourceDelete/{id}")
  public String resourceDelete(@PathVariable("id") int id) {
    resService.deleteResById(id);
    return "redirect:/ad/resManger";
  }

  //  视频管理
  @RequestMapping("/ad/videoManger")
  public String uploadVideos(Model model) {
    model.addAttribute("videos", videoService.getAllVideo());
    return "admin/videoManger";
  }

  @RequestMapping("/ad/videoDelete/{id}")
  public String videoDelete(@PathVariable("id") int id) {
    videoService.deleteVideoById(id);
    return "redirect:/ad/videoManger";
  }

  //  试题管理
  @RequestMapping("/ad/testpaperManger")
  public String uploadTestPaper(Model model) {
    model.addAttribute("testpapers", testpaperService.getAllTestpaper());
    return "admin/testpaperManger";
  }

  @RequestMapping("/ad/testpaperDelete/{id}")
  public String testpaperDelete(@PathVariable("id") int id) {
    testpaperService.deleteTestpaperById(id);
    return "redirect:/ad/testpaperManger";
  }

  @RequestMapping("/ad/testpaperUpdate/{id}")
  public String testpaperUpdate(@PathVariable("id") int id, Model model) {
    model.addAttribute("testpaper", testpaperService.getTestpaperById(id));
    return "admin/testpaperEdit";
  }

  @RequestMapping("/ad/testpaperInsert")
  public String testpaperInsert() {
    return "admin/testpaperEdit";
  }


  @RequestMapping(value = "/ad/testpaperwrite", method = RequestMethod.POST)
  public String testpaperwrite(Testpaper testpaper) {
    System.out.println("testpaper:" + new Gson().toJson(testpaper));
    if (testpaper.getId() == 0l) {
      testpaperService.insertTestpaper(testpaper);
    } else {
      testpaperService.updateTestpaper(testpaper);
    }
    return "redirect:/ad/testpaperManger";
  }
}
