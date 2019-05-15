package com.vs.controller;

import com.vs.entity.Video;
import com.vs.service.VideoService;
import com.vs.util.functions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@Controller
public class VideoController {

  private static String videoUploadPath =
      "C:\\Users\\46100\\Videos\\DBLearning\\video" + File.separator;

  @Resource private VideoService videoService;

  @RequestMapping("/upload/videoUpload")
  public String videoUpload(@RequestParam("upload_videofile") MultipartFile multipartFile ,Model model) {

    if (multipartFile != null && !multipartFile.isEmpty()) {

      String originalFilename = multipartFile.getOriginalFilename();

      if (videoService.getAddressByName(originalFilename) == null) {

        String fileNamePrefix = originalFilename.substring(0, originalFilename.lastIndexOf("."));

        String fileNameSuffix = originalFilename.substring(originalFilename.lastIndexOf(".") + 1);

        if(fileNameSuffix.equals("mp4")){
          String newPath = videoUploadPath + originalFilename;

          File file = new File(newPath);

          try {
            multipartFile.transferTo(file);
          } catch (IOException e) {
            e.printStackTrace();
          }

          Video video = new Video();
          video.setName(originalFilename);
          video.setPrefix(fileNamePrefix);
          video.setSuffix(fileNameSuffix);
          video.setAddress(newPath);
          video.setSize(functions.checkFileSize(multipartFile.getSize()));

          videoService.insertVideoById(video);
          model.addAttribute("success","上传成功");
        }else {
          model.addAttribute("error","视频格式必须为MP4");
        }
      }
    }
    return "redirect:/ad/videoManger";
  }

  @RequestMapping("/download/videoDownload")
  public String videoDownload(HttpServletRequest request, HttpServletResponse response)
      throws IOException {

    // 获取文件名称
    String name = request.getParameter("filename");

    //        3、判断它是否存在
    if (videoService.getAddressByName(name) != null) {
      Path path = Paths.get(videoService.getAddressByName(name));
      //  4、获取文件的后缀
      String fileSuffix = name.substring(name.lastIndexOf(".") + 1);
      //      5、添加头信息

      //      6、设置contentType，只有指定它才能去下载
      response.setContentType("application/" + fileSuffix);

      try {
        response.addHeader(
            "Content-Disposition",
            "attachment;filename=" + new String(name.getBytes("UTF-8"), "ISO8859-1"));
      } catch (UnsupportedEncodingException e) {
        e.printStackTrace();
      }

      //            7、通过Path写出去就OK
      try {
        Files.copy(path, response.getOutputStream());
      } catch (IOException e) {
        e.printStackTrace();
      }
    }

    return null;
  }


  @RequestMapping("/videoPlay/{id}")
  public String detail(@PathVariable("id") int id, Model model) {
    Video video = videoService.getVideoById(id);
    model.addAttribute("video",video);
    return "views/videoPlay";
  }
}
