package com.vs.controller;

import com.vs.entity.Res;
import com.vs.service.ResService;
import com.vs.util.functions;
import org.springframework.stereotype.Controller;
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
public class ResController {

  private static String docUploadPath =
      "C:\\Users\\46100\\Videos\\DBLearning\\resource" + File.separator;

  @Resource private ResService resService;

  @RequestMapping("/upload/resUpload")
  public String resUpload(@RequestParam("upload_resfile") MultipartFile multipartFile) {

    if (multipartFile != null && !multipartFile.isEmpty()) {

      String originalFilename = multipartFile.getOriginalFilename();

      if (resService.getAddressByName(originalFilename) == null) {

        String fileNamePrefix = originalFilename.substring(0, originalFilename.lastIndexOf("."));

        String fileNameSuffix = originalFilename.substring(originalFilename.lastIndexOf(".") + 1);

        String newPath = docUploadPath + originalFilename;

        File file = new File(newPath);

        try {
          multipartFile.transferTo(file);
        } catch (IOException e) {
          e.printStackTrace();
        }

        Res res = new Res();
        res.setName(originalFilename);
        res.setPrefix(fileNamePrefix);
        res.setSuffix(fileNameSuffix);
        res.setAddress(newPath);
        res.setSize(functions.checkFileSize(multipartFile.getSize()));

        resService.insertResById(res);
      }
    }
    return "redirect:/ad/resManger";
  }

  @RequestMapping("/download/resDownload")
  public String resDownload(HttpServletRequest request, HttpServletResponse response)
      throws IOException {

    // 获取文件名称
    String name = request.getParameter("filename");

    //        3、判断它是否存在
    if (resService.getAddressByName(name) != null) {

      Path path = Paths.get(resService.getAddressByName(name));

      String fileSuffix = name.substring(name.lastIndexOf(".") + 1);

      response.setContentType("application/" + fileSuffix);

      try {
        response.addHeader(
            "Content-Disposition",
            "attachment;filename=" + new String(name.getBytes("UTF-8"), "ISO8859-1"));
      } catch (UnsupportedEncodingException e) {
        e.printStackTrace();
      }

      try {
        Files.copy(path, response.getOutputStream());
      } catch (IOException e) {
        e.printStackTrace();
      }
    }

    return null;
  }
}
