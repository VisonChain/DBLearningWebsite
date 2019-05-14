package com.vs.config;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginInterceptors implements HandlerInterceptor {
  public boolean preHandle(
      HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o)
      throws Exception {
    httpServletRequest.setCharacterEncoding("UTF-8");
    StringBuffer requestURL = httpServletRequest.getRequestURL();
    if (requestURL.toString().contains("/ad")
        && !requestURL.toString().contains("/ad/adminLogin")
        && !requestURL.toString().contains("/ad/adminLoginAction")) {
      Object admin = httpServletRequest.getSession().getAttribute("admin");
      if (admin == null) {
        httpServletResponse.sendRedirect("/ad/adminLogin");
        return false;
      } else {
        return true;
      }
    } else if (requestURL.toString().contains("/chatRoom") || requestURL.toString().contains("/paperTestPage")) {
      Object user = httpServletRequest.getSession().getAttribute("user");
      if (user == null) {
        httpServletResponse.sendRedirect("/userLogin");
        return false;
      } else {
        return true;
      }
    } else {
      return true;
    }
  }

  public void postHandle(
      HttpServletRequest httpServletRequest,
      HttpServletResponse httpServletResponse,
      Object o,
      ModelAndView modelAndView)
      throws Exception {}

  public void afterCompletion(
      HttpServletRequest httpServletRequest,
      HttpServletResponse httpServletResponse,
      Object o,
      Exception e)
      throws Exception {}
}
