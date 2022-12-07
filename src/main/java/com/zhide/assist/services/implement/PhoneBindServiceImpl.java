package com.zhide.assist.services.implement;

import com.zhide.assist.common.MD5Util;
import com.zhide.assist.common.RedisUtils;
import com.zhide.assist.models.LoginUserInfo;
import com.zhide.assist.models.tbLoginUser;
import com.zhide.assist.multitenancy.CompanyContext;
import com.zhide.assist.repositorys.tbLoginUserRepository;
import com.zhide.assist.services.define.IAllUserListService;
import com.zhide.assist.services.define.IphoneBindService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;

@Service
public class PhoneBindServiceImpl implements IphoneBindService {
    @Autowired
    tbLoginUserRepository tbLoginUserRepository;
    @Resource
    IAllUserListService iAllUserListService;
    @Resource
    RedisTemplate<String,Object> redisTemplate;

    @Override
    public tbLoginUser BindLogin(tbLoginUser tbLoginUser, String OpenID, String Type) throws Exception {
        String NickName = RedisUtils.getFromRedis("NickName",redisTemplate);
        System.out.println(NickName);
        tbLoginUser result = null;
        RedisUtils utils = new RedisUtils();
        tbLoginUser existUser = null;

        String Key = tbLoginUser.getLoginCode() + "::Bind::Code";
        String value = utils.getFromRedis(Key, redisTemplate);

        String PicCodeKey = "VerifyCode";
        String PicCodeValue = utils.getFromRedis(PicCodeKey, redisTemplate);

        if (value.equals("") || !value.equals(tbLoginUser.getPhoneCode())) {
            throw new Exception("手机验证码输入错误");
        }else {
            if (tbLoginUser.getUserId() == null){
                tbLoginUser.setCreateTime(new Date());
                tbLoginUser.setCanLogin(true);
                if (Type.equals("QQ")){
                    tbLoginUser.setQqNickName(NickName);
                    tbLoginUser.setQqOpenId(OpenID);
                    existUser = tbLoginUserRepository.findAllByLoginCodeAndQqOpenId(tbLoginUser.getLoginCode(),OpenID);
                }else {
                    tbLoginUser.setWxNickName(NickName);
                    tbLoginUser.setWxOpenId(OpenID);
                    existUser = tbLoginUserRepository.findAllByLoginCodeAndWxOpenId(tbLoginUser.getLoginCode(),OpenID);
                }
            }
            tbLoginUser user = tbLoginUserRepository.findAllByLoginCode(tbLoginUser.getLoginCode());
            if (existUser == null && user == null) {
                result = tbLoginUserRepository.save(tbLoginUser);
            }else if (result == null && existUser == null){
                if (Type.equals("WX")){
                    tbLoginUserRepository.UpdateWxOpenID(OpenID, NickName, tbLoginUser.getLoginCode());
                    result = tbLoginUser;
                }else if (Type.equals("QQ")){
                    tbLoginUserRepository.UpdateQQOpenID(OpenID, NickName, tbLoginUser.getLoginCode());
                    result = tbLoginUser;
                }
            }else throw new Exception("手机号码已绑定,请勿重复绑定");
        }
        return result;
    }

    @Override
    public void UpdatePasswordYZ(tbLoginUser tbLoginUser) throws Exception {
        RedisUtils utils = new RedisUtils();

        String Key = tbLoginUser.getLoginCode() + "::Bind::Code";
        String value = utils.getFromRedis(Key, redisTemplate);

        String PicCodeKey = "VerifyCode";
        String PicCodeValue = utils.getFromRedis(PicCodeKey, redisTemplate);

        if (value.equals("") || !value.equals(tbLoginUser.getPhoneCode())) {
            throw new Exception("手机验证码输入错误");
        }
    }

    @Override
    public tbLoginUser UpdatePassword(tbLoginUser tbLoginUser) throws Exception {
        LoginUserInfo Info = CompanyContext.get();
        MD5Util md5Util = new MD5Util("zhifubang");
        tbLoginUserRepository.UpdatePasswordByUserID(md5Util.EnCode(tbLoginUser.getPassword()), Info.getUserIdValue());
        return tbLoginUser;
    }

    @Override
    public void UpdatePasswordByLoginCode(String Password, String LoginCode) throws Exception {
        MD5Util md5Util = new MD5Util("zhifubang");
        tbLoginUserRepository.UpdatePasswordByLoginCode(md5Util.EnCode(Password),LoginCode);
    }

    @Override
    public tbLoginUser Save(tbLoginUser tbLoginUser, String Type, HttpServletRequest request) throws Exception {
        RedisUtils utils = new RedisUtils();

        LoginUserInfo Info = CompanyContext.get();

        String PhoneCodeKey = tbLoginUser.getLoginCode() + "::Reg::Code";
        String PhoneCodeValue = utils.getFromRedis(PhoneCodeKey, redisTemplate);

        String PicCodeKey = "VerifyCode";
        String PicCodeValue = utils.getFromRedis(PicCodeKey, redisTemplate);

        if (PhoneCodeValue.equals("") || !PhoneCodeValue.toLowerCase().equals(tbLoginUser.getPhoneCode())) {
            throw new Exception ("手机验证码输入错误!");
        }

        if (Type.equals("Bind")){
            if (Info != null){
                tbLoginUserRepository.UpdateLoginCodeByUserID(tbLoginUser.getLoginCode(),Info.getUserIdValue());;
            }
        }else {
            RedisUtils.saveToRedis("LoginType","PhoneLogin",redisTemplate);
            tbLoginUser loginUser = tbLoginUserRepository.findAllByLoginCode(tbLoginUser.getLoginCode());
            if (loginUser != null) {
                NoPwdLogin(loginUser, request);
            }else {
                //手机登录时数据库不存在则先新增手机号再绕过密码登录
                tbLoginUserRepository.save(tbLoginUser);
                tbLoginUser login = tbLoginUserRepository.findAllByLoginCode(tbLoginUser.getLoginCode());
                NoPwdLogin(login, request);
            }
        }

        return tbLoginUser;
    }

    private void NoPwdLogin(tbLoginUser loginUser, HttpServletRequest request){
        LoginUserInfo info = iAllUserListService.findUserInfoByAccount(loginUser.getLoginCode());
        String username = loginUser.getLoginCode();
        String password = "BindLoginPwd";
        UsernamePasswordToken token = new UsernamePasswordToken(username, password);
        Subject user = SecurityUtils.getSubject();
        user.login(token);
        if (user.isAuthenticated()) {
            user.getSession().setAttribute("loginUser", info);
            request.getSession().setAttribute("loginUser", info);
        }
    }
}
