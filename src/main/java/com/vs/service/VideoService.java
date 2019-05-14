package com.vs.service;

import com.vs.dao.VideoDao;
import com.vs.entity.Video;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


@Service
public class VideoService {

    @Resource
    private VideoDao videoDao;

    public List<Video> getFirst10Video() {
        return videoDao.getFirst10Video();
    }

    public Video getVideoById(@Param("id") Long id){
        return videoDao.getVideoById(id);
    }

    public List<Video> getAllVideo() {
        return videoDao.getAllVideo();
    }

    public void deleteVideoById(Long id){
        videoDao.deleteVideoById(id);
    }

    public void insertVideoById(Video video){
        videoDao.insertVideoById(video);
    }

    public String getAddressByName(String name){
        return videoDao.getAddressByName(name);
    }

}
