package com.neuedu.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.neuedu.entity.Dept;
import com.neuedu.entity.Emp;
import com.neuedu.service.DeptService;
import com.neuedu.service.EmpService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class TestController {
    @Autowired
    private EmpService empService;
    @Autowired
    private DeptService deptService;
    @RequestMapping(value = "/hello",produces = "text/html;charset=utf-8")
    @ResponseBody
    public String hello(){
        return "长得帅不是我的错";
    }

    @RequestMapping("/emplist")
    public String getEmpListView(ModelMap map,@RequestParam(name = "pageNum",defaultValue = "1") int pageNum){
        PageHelper.startPage(pageNum,5);
        List<Emp> emps = empService.selectAll();
        PageInfo<Emp> pageInfo = new PageInfo<>(emps,10);
        map.put("pageInfo",pageInfo);
        return "emplist";
    }

    @RequestMapping("/addempview")
    public String getAddEmpView(ModelMap map){
        List<Dept> depts = deptService.selectAll();
        map.put("depts",depts);
        return "addemp";
    }

    @RequestMapping("/addemp")
    public String getAddEmp(Emp emp){
        empService.saveOne(emp);
        List<Emp> emps = empService.selectAll();
        int pageNum = emps.size()/5;
        pageNum = emps.size() % 5 == 0 ? pageNum : pageNum + 1;
        return "redirect:emplist?pageNum="+pageNum;
    }


    @RequestMapping("/deleteOne")
    public String deleteOne(int[] id){
        empService.deleteOne(id);
        return "redirect:emplist";
    }
}
