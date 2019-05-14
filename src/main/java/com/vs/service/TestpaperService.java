package com.vs.service;

import com.vs.dao.TestpaperDao;
import com.vs.entity.Testpaper;
import com.vs.util.functions;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service
public class TestpaperService {

  @Resource private TestpaperDao testpaperDao;

  public List<Testpaper> getFirst10Testpaper() {
    return testpaperDao.getFirst10Testpaper();
  }

  public Testpaper getTestpaperById(@Param("id") Long id) {
    return testpaperDao.getTestpaperById(id);
  }

  public List<Testpaper> getAllTestpaper() {
    return testpaperDao.getAllTestpaper();
  }

  public void deleteTestpaperById(Long id) {
    testpaperDao.deleteTestpaperById(id);
  }

  public void insertTestpaper(Testpaper testpaper) {
    testpaperDao.insertTestpaper(testpaper);
  }

  public void updateTestpaper(Testpaper testpaper) {
    testpaperDao.updateTestpaperById(testpaper);
  }

  public List<Long> getAllTestpaperIds(){return testpaperDao.getAllIds();}

  public List<Testpaper> getTestpaperByIds(List<Long> list){
    List<Testpaper> l = new ArrayList<Testpaper>();
    for (int i=0;i<list.size();i++){
      l.add(getTestpaperById(list.get(i)));
    }
    return l;
  }

  public List<Testpaper> getRandomTestpaper(int count){
    List<Long> num = functions.getRangeNum(getAllTestpaperIds(),count);
    return getTestpaperByIds(num);
  }
}
