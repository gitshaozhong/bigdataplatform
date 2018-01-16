/**
 *  Copyright (c) 2012-2015 dhc
 *
 *  Licensed under the Apache License, Version 2.0 (the "License"); 
 */
package com.dhc.modules.sys.web;

import com.dhc.common.model.Datagrid;
import com.dhc.common.model.Menu;
import com.dhc.common.model.Result;
import com.dhc.common.model.TreeNode;
import com.dhc.common.orm.Page;
import com.dhc.common.orm.entity.StatusState;
import com.dhc.common.orm.hibernate.DefaultEntityManager;
import com.dhc.common.utils.IpUtils;
import com.dhc.common.utils.StringUtils;
import com.dhc.common.utils.encode.Encrypt;
import com.dhc.common.web.springmvc.SimpleController;
import com.dhc.common.web.springmvc.SpringMVCHolder;
import com.dhc.common.web.utils.WebUtils;
import com.dhc.core.security.SecurityConstants;
import com.dhc.core.security.SecurityType;
import com.dhc.core.security.SecurityUtils;
import com.dhc.core.security.SessionInfo;
import com.dhc.core.security.annotation.RequiresUser;
import com.dhc.modules.sys._enum.ResourceType;
import com.dhc.modules.sys.entity.Resource;
import com.dhc.modules.sys.entity.User;
import com.dhc.modules.sys.service.ResourceManager;
import com.dhc.modules.sys.service.UserManager;
import com.dhc.utils.AppConstants;
import com.google.common.collect.Lists;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.Iterator;
import java.util.List;

/**
 * 用户登录/注销等前端交互入口
 *  
 *  
 */
@Controller
@RequestMapping(value = "${adminPath}/login")
public class LoginController extends SimpleController {

    @Autowired
    private UserManager userManager;


    /**
     * 登录验证
     *
     * @param loginName 用户名
     * @param password  密码
     * @param theme     主题
     * @param request
     * @return
     */
    @RequiresUser(required = false)
    @ResponseBody
    @RequestMapping(value = {"login"})
    public Result login(@RequestParam(required = true) String loginName, @RequestParam(required = true) String password,
                        String theme, HttpServletRequest request) {
        Result result = null;
        String msg = null;
        // 获取用户信息
        User user = userManager.getUserByLNP(loginName, Encrypt.e(password));
        if (user == null) {
            msg = "用户名或密码不正确!";
        } else if (user.getStatus().intValue() == StatusState.lock.getValue()) {
            msg = "该用户已被锁定，暂不允许登陆!";
        }
        if (msg != null) {
            result = new Result(Result.ERROR, msg, "jump");
        } else {
            if(AppConstants.getIsSecurityOn()){
                List<SessionInfo> userSessionInfos = SecurityUtils.getSessionUser(loginName);
                if(AppConstants.getUserSessionSize() > 0 &&  userSessionInfos.size() >= AppConstants.getUserSessionSize() ){
                    result = new Result(Result.ERROR, "已达到用户最大会话登录限制["+AppConstants.getUserSessionSize()+"，请注销其它登录信息后再试！]", AppConstants.getUserSessionSize());
                    return result;
                }
            }

            //将用户信息放入session中
            SecurityUtils.putUserToSession(request, user);
            logger.info("用户{}登录系统,IP:{}.", user.getLoginName(), IpUtils.getIpAddr(request));
            System.out.print(user.getLoginName());
            //设置调整URL 如果session中包含未被授权的URL 则跳转到该页面
            String resultUrl = request.getContextPath() +AppConstants.getAdminPath()+ "/index";
            Object unAuthorityUrl = request.getSession().getAttribute(SecurityConstants.SESSION_UNAUTHORITY_URL);
            if (unAuthorityUrl != null) {
                resultUrl = unAuthorityUrl.toString();
                //清空未被授权的URL
                request.getSession().setAttribute(SecurityConstants.SESSION_UNAUTHORITY_URL, null);
            }
            //返回
            result = new Result(Result.SUCCESS, "用户验证通过!", resultUrl);
        }

        return result;
    }


    /**
     * 用户注销
     * @param request
     * @return
     */
    @RequestMapping(value = {"logout"})
    public String logout(HttpServletRequest request) {
        SessionInfo sessionInfo = SecurityUtils.getCurrentSessionInfo();
        if (sessionInfo != null) {
            // 退出时清空session中的内容
            String sessionId = request.getSession().getId();
            //由监听器更新在线用户列表
            SecurityUtils.removeUserFromSession(sessionId, false, SecurityType.logout);
            System.out.print("推出");
            logger.info("用户{}退出系统.", sessionInfo.getLoginName());
        }
        return "redirect:/";
    }



    /**
     * 当前在线用户
     *
     * @throws Exception
     */
    @RequestMapping(value = {"onlineDatagrid"})
    @ResponseBody
    public Datagrid<SessionInfo> onlineDatagrid() throws Exception {
        return SecurityUtils.getSessionUser();
    }

    /**
     * 异步方式返回session信息
     */
    @RequestMapping(value = {"sessionInfo"})
    @ResponseBody
    public Result sessionInfo() {
        Result result = Result.successResult();
        SessionInfo sessionInfo = SecurityUtils.getCurrentSessionInfo();
        result.setObj(sessionInfo);
        if (logger.isDebugEnabled()) {
            logger.debug(result.toString());
        }
        return result;
    }


}
