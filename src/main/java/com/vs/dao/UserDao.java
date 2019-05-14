package com.vs.dao;

import com.vs.entity.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserDao {
  User getUser(@Param("username") String username, @Param("password") String password);

  User getUserById(@Param("id") int id);

  List<User> isUserEmpty(@Param("username") String username);

  User registerUser(
      @Param("username") String username,
      @Param("password") String password,
      @Param("nickname") String nickname);


}
