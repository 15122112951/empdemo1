package com.neuedu.service;

import com.neuedu.entity.Emp;

import java.util.List;

public interface EmpService {
    List<Emp> selectAll();
    int deleteOne(int[] id);
    int saveOne(Emp emp);
}
