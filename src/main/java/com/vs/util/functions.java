package com.vs.util;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class functions {


  //文件大小单位换算
  public static String checkFileSize(long size) {
    if (size >0 && size < 1024) {
      return new String(size + "B");
    } else if (size >= 1024 && size < 1048576) {

      return new String(size / 1024 + "KB");
    } else if (size >= 1048576 && size < 1073741824) {
      return new String(size / 1048576 + "MB");
    } else{
        return new String(size / 1073741824 + "GB");
    }
  }


  //随机抽取count个随机数
  public static List<Long> getRangeNum(List<Long> num,int count){
    if(!num.isEmpty()){
      if(num.size()<=count){
        return num;
      }else {
        List<Long> list = new ArrayList<Long>();
        Random random = new Random();
        for(int i=0;i<count;i++){
          int target = random.nextInt(num.size());
          list.add(num.get(target));
          num.remove(target);
        }
        return list;
      }
    }else {
      return null;
    }
  }
}
