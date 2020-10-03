package com.kgc.tcmp077.wangyf.controller;

import com.github.pagehelper.PageInfo;
import com.kgc.tcmp077.wangyf.entity.Projectinfo;
import com.kgc.tcmp077.wangyf.service.impl.ProjectinfoServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.Date;

/**
 * @author wangyf
 * @create 2020-10-03 9:20
 */
@Controller
public class ProjectinfoController {
    @Resource
    ProjectinfoServiceImpl projectinfoService;

    @RequestMapping("/select")
    public String toSelectByStatus(Model model, @RequestParam(value = "pageNum", required = false, defaultValue = "0") Integer pageNum, int status) {
        PageInfo<Projectinfo> projectinfoPageInfo = projectinfoService.selectByStatus(pageNum, status);
        model.addAttribute("pageInfo", projectinfoPageInfo);
        return "main";
    }

    @RequestMapping("/selectById")
    public String toselectById(Model model,int id) {
        Projectinfo projectinfo = projectinfoService.selectById(id);
        model.addAttribute("projectdb",projectinfo);
        return "toselect";
    }
    @RequestMapping("/")
    public  String toupdateProject(Date startdate,Date enddate,String projectname,int id,int status,Model model){
        Projectinfo projectinfo = new Projectinfo();
        projectinfo.setId(id);
        projectinfo.setProjectname(projectname);
        projectinfo.setEnddate(enddate);
        projectinfo.setStartdate(startdate);
        projectinfo.setStatus(status);
        int i = projectinfoService.updateProject(projectinfo);
        if (i>0){
            model.addAttribute("success","审核成功");
        }else{
            model.addAttribute("fail","审核失败");
        }
        return "redirect:select";
    }
}
