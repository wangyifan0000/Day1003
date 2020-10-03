package com.kgc.tcmp077.wangyf.service;

import com.github.pagehelper.PageInfo;
import com.kgc.tcmp077.wangyf.entity.Projectinfo;

/**
 * @author wangyf
 * @create 2020-10-03 8:56
 */
public interface ProjectService {
    PageInfo<Projectinfo> selectByStatus(int pageNum,Integer Status);
    Projectinfo selectById(int id);
    int updateProject(Projectinfo projectinfo);
}
