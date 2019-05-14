package com.vs.dao;

import com.vs.entity.Video;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface VideoDao {

    Video getVideoById(@Param("id") Long id);

    List<Video> getFirst10Video();

    List<Video> getAllVideo();

    void deleteVideoById(Long id);

    void insertVideoById(Video video);

    String getAddressByName(String name);


}
