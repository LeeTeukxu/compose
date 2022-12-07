package com.zhide.assist.controllers.systems;

import com.alibaba.fastjson.JSON;
import com.zhide.assist.common.successResult;
import com.zhide.assist.models.LoginUserInfo;
import com.zhide.assist.models.tbLoginUser;
import com.zhide.assist.multitenancy.CompanyContext;
import com.zhide.assist.repositorys.tbLoginUserRepository;
import com.zhide.assist.services.define.IRegisteredService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/systems/loginUser")
public class tbLoginController {

    @Autowired
    IRegisteredService iRegisteredService;

    @Autowired
    tbLoginUserRepository repository;

    @ResponseBody
    @RequestMapping("/saveAll")
    public successResult saveAll(HttpServletRequest request) {
        successResult result = new successResult();
        try {
            String Data = request.getParameter("Data");
            tbLoginUser user = JSON.parseObject(Data, tbLoginUser.class);
            result.setData(iRegisteredService.Save(user));
        } catch (Exception ax) {
            result.raiseException(ax);
            result.setMessage(ax.getMessage());
        }
        return result;
    }

    @RequestMapping("/cancelBindPhone")
    @ResponseBody
    public successResult CancelBindPhone(){
        successResult result = new successResult();
        LoginUserInfo Info = CompanyContext.get();
        try {
            repository.CancelBindPhone(Info.getUserIdValue());
        }catch (Exception ax){
            result.setSuccess(false);
            result.raiseException(ax);
        }
        return result;
    }
}
