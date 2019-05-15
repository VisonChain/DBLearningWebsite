package com.vs.util;


import java.util.*;

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
  public static List<Integer> getRangeNum(List<Integer> num,int count){
    if(!num.isEmpty()){
      if(num.size()<=count){
        return num;
      }else {
        List<Integer> list = new ArrayList<Integer>();
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


  //list转String
  public static String listToString(List<Integer> list){
    if(list!=null){
      StringBuilder result = new StringBuilder();
      result.append(list.get(0));
      for (int i=1;i<list.size();i++){
        result.append(",").append(list.get(i));
      }
      return result.toString();
    }else {
      return null;
    }
  }

  //string转list
  public static List<Integer> stringToList(String strs){
    if(strs!=null){
      String str[] = strs.split(",");
      List<Integer> list = new ArrayList<Integer>();
      for (String s : str){
        list.add(Integer.parseInt(s));
      }
      return list;
    }else {
      return null;
    }

  }

}
