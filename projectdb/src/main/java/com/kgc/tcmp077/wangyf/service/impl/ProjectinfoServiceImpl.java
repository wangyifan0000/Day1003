package com.kgc.tcmp077.wangyf.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kgc.tcmp077.wangyf.entity.Projectinfo;
import com.kgc.tcmp077.wangyf.entity.ProjectinfoExample;
import com.kgc.tcmp077.wangyf.mapper.ProjectinfoMapper;
import com.kgc.tcmp077.wangyf.service.ProjectService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author wangyf
 * @create 2020-10-03 8:58
 */
@Service("projectservice")
public class ProjectinfoServiceImpl implements ProjectService {
    @Resource
    ProjectinfoMapper projectinfoMapper;
    @Override
    public PageInfo<Projectinfo> selectByStatus(int pageNum, Integer Status) {
        ProjectinfoExample projectinfoExample = new ProjectinfoExample();
        ProjectinfoExample.Criteria criteria = projectinfoExample.createCriteria();
        if(Status!=null){
            criteria.andStatusEqualTo(Status);
        }
        int pageSize=3;
        PageHelper.startPage(pageNum,pageSize);
        PageHelper.orderBy("id desc");
        List<Projectinfo> projectinfos = projectinfoMapper.selectByExample(projectinfoExample);
        PageInfo<Projectinfo>pageInfo=new PageInfo(projectinfos);
        return pageInfo;
    }

    @Override
    public Projectinfo selectById(int id) {
        Projectinfo projectinfo = projectinfoMapper.selectByPrimaryKey(id);
        return projectinfo;
    }

    @Override
    public int updateProject(Projectinfo projectinfo) {
        int i = projectinfoMapper.updateByPrimaryKeySelective(projectinfo);
        return i;
    }
}
