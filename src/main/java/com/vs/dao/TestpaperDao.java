package com.vs.dao;

import com.vs.entity.Testpaper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TestpaperDao {

  Testpaper getTestpaperById(@Param("id") Long id);

  List<Testpaper> getFirst10Testpaper();

  List<Testpaper> getAllTestpaper();

  List<Long> getAllIds();

  void deleteTestpaperById(Long id);

  void insertTestpaper(Testpaper testpaper);

  void updateTestpaperById(Testpaper testpaper);
}
