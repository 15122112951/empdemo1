package com.neuedu.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Emp {
    private Integer id;
    private String name;
    private String phone;
    private String sex;
    private Integer salary;
    private Integer dept_id;
    private Dept dept;
}
