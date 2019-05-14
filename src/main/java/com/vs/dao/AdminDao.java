package com.vs.dao;

import com.vs.entity.Admin;
import org.apache.ibatis.annotations.Param;

public interface AdminDao {

    Admin getAdmin(@Param("username") String username, @Param("password") String password);
}
