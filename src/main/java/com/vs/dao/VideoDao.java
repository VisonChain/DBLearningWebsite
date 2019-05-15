package com.vs.dao;

import com.vs.entity.Video;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface VideoDao {

    Video getVideoById(@Param("id") int id);

    List<Video> getFirst10Video();

    List<Video> getAllVideo();

    void deleteVideoById(int id);

    void insertVideoById(Video video);

    String getAddressByName(String name);


}
