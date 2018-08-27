package com.neuedu.mapper;

import com.neuedu.entity.Emp;

import java.util.List;

public interface EmpMapper {
    List<Emp> selectAll();
    int deleteOne(int[] id);
    int saveOne(Emp emp);
}
