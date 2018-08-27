package com.neuedu.service.impl;

import com.neuedu.entity.Emp;
import com.neuedu.mapper.EmpMapper;
import com.neuedu.service.EmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class EmpServiceImpl implements EmpService {
    @Autowired
    private EmpMapper empMapper;

    @Override
    public List<Emp> selectAll() {
        return empMapper.selectAll();
    }

    @Override
    public int deleteOne(int[] id) {
        return empMapper.deleteOne(id);
    }

    @Override
    public int saveOne(Emp emp) {
        return empMapper.saveOne(emp);
    }
}
