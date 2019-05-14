package com.vs.dao;

import com.vs.entity.Res;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ResDao {

    Res getResById(@Param("id") Long id);

    List<Res> getFirst10Res();

    List<Res> getAllRes();

    void deleteResById(Long id);

    void updateResById(Res resource);

    void insertResById(Res resource);

    String getAddressByName(String name);

}
