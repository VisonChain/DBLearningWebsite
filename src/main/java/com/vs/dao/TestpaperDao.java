package com.vs.dao;

import com.vs.entity.Testpaper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TestpaperDao {

  Testpaper getTestpaperById(@Param("id") int id);

  List<Testpaper> getFirst10Testpaper();

  List<Testpaper> getAllTestpaper();

  List<Integer> getAllIds();

  void deleteTestpaperById(int id);

  void insertTestpaper(Testpaper testpaper);

  void updateTestpaperById(Testpaper testpaper);
}
