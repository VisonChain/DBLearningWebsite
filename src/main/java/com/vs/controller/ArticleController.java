package com.vs.controller;

import com.vs.entity.Article;
import com.vs.service.ArticleService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.tautua.markdownpapers.Markdown;
import org.tautua.markdownpapers.parser.ParseException;

import javax.annotation.Resource;
import java.io.StringReader;
import java.io.StringWriter;

@Controller
public class ArticleController {
  @Resource private ArticleService articleService;

  @RequestMapping("/detail/{id}")
  public String detail(@PathVariable("id") int id, Model model) {
    Article article = articleService.getArticleById(id);
    Markdown markdown = new Markdown();
    try {
      StringWriter out = new StringWriter();
      markdown.transform(new StringReader(article.getContent()), out);
      out.flush();
      article.setContent(out.toString());
      System.out.println("------------------");
      System.out.println(article.getContent());
    } catch (ParseException e) {
      e.printStackTrace();
    }
    model.addAttribute("article", article);
    return "views/detail";
  }
}
