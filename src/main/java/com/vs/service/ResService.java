package com.vs.service;

import com.vs.dao.ResDao;
import com.vs.entity.Res;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


@Service
public class ResService {

    @Resource
    private ResDao resDao;

    public List<Res> getFirst10Res() {
        return resDao.getFirst10Res();
    }

    public Res getResById(@Param("id") Long id){
        return resDao.getResById(id);
    }

    public List<Res> getAllRes() {
        return resDao.getAllRes();
    }

    public void updateResById(Res res){
        resDao.updateResById(res);
    }

    public void deleteResById(Long id){
        resDao.deleteResById(id);
    }

    public void insertResById(Res res){
        resDao.insertResById(res);
    }

    public String getAddressByName(String name){
        return resDao.getAddressByName(name);
    }
}
