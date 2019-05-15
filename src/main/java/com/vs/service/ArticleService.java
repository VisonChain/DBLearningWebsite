package com.vs.service;

import com.vs.dao.ArticleDao;
import com.vs.entity.Article;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class ArticleService {
  @Resource private ArticleDao articleDao;
  private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

  public Article getArticleById(int id) {
    return articleDao.getArticleById(id);
  }

  public List<Article> getFirst10Article() {
    return articleDao.getFirst10Article();
  }

  public List<Article> getAllArticles() {
    return articleDao.getAllArticles();
  }

  public void insertArticle(Article article) {
    article.setDate(sdf.format(new Date()));
    if (article.getSummary() == null || "".equals(article.getSummary())) {
      if (article.getContent().length() > 40) {
        article.setSummary(article.getContent().substring(0, 40));
      } else {
        article.setSummary(article.getContent().substring(0, article.getContent().length()));
      }
    }
    articleDao.insertArticle(article);
  }

  public void deleteArticleById(int id) {
    articleDao.deleteArticleById(id);
  }

  public void updateArticle(Article article) {
    article.setDate(sdf.format(new Date()));
    if (article.getSummary() == null || "".equals(article.getSummary())) {
      if (article.getContent().length() > 40) {
        article.setSummary(article.getContent().substring(0, 40));
      } else {
        article.setSummary(article.getContent().substring(0, article.getContent().length()));
      }
    }
    articleDao.updateArticleById(article);
  }
}
