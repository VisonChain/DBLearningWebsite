package com.vs.dao;

import com.vs.entity.Article;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ArticleDao {
  Article getArticleById(@Param("id") Long id);

  List<Article> getFirst10Article();

  List<Article> getAllArticles();

  void insertArticle(Article article);

  void deleteArticleById(Long id);

  void updateArticleById(Article article);
}
