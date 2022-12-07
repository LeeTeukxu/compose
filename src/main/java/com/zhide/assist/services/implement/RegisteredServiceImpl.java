package com.zhide.assist.services.implement;

import com.zhide.assist.common.EntityHelper;
import com.zhide.assist.common.MD5Util;
import com.zhide.assist.common.RedisUtils;
import com.zhide.assist.models.tbLoginUser;
import com.zhide.assist.repositorys.tbLoginUserRepository;
import com.zhide.assist.services.define.IRegisteredService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Date;
import java.util.Optional;

@Service
public class RegisteredServiceImpl implements IRegisteredService {
    @Autowired
    tbLoginUserRepository loginUserRepository;
    @Resource
    RedisTemplate<String,Object> redisTemplate;

    @Transactional(rollbackFor = Exception.class)
    @Override
    public tbLoginUser Save(tbLoginUser user) throws Exception {
        tbLoginUser result = null;
        RedisUtils utils = new RedisUtils();
        MD5Util md5Util = new MD5Util("zhifubang");
        tbLoginUser existUser = null;

        String PhoneCodeKey = user.getLoginCode() + "::Reg::Code";
        String PhoneCodeValue = utils.getFromRedis(PhoneCodeKey, redisTemplate);

        String PicCodeKey = "VerifyCode";
        String PicCodeValue = utils.getFromRedis(PicCodeKey, redisTemplate);

        if (PhoneCodeValue.equals("") || !PhoneCodeValue.toLowerCase().equals(user.getPhoneCode())) {
            throw new Exception ("手机验证码输入错误!");
        }else {
            if (user.getUserId() == null) {
                user.setPassword(md5Util.EnCode(user.getPassword()));
                user.setCreateTime(new Date());
                user.setCanLogin(true);
                existUser = loginUserRepository.findAllByLoginCode(user.getLoginCode());
            } else {
                Optional<tbLoginUser> ftbLoginUser = loginUserRepository.findById(user.getUserId());
                if (ftbLoginUser.isPresent()) {
                    tbLoginUser nowOne = ftbLoginUser.get();
                    if (nowOne.getPassword().equals(user.getPassword()) == false) {
                        user.setPassword(md5Util.EnCode(user.getPassword()));
                    }
                    user.setLastLoginTime(new Date());
                    EntityHelper.copyObject(user, nowOne);
                }
                existUser = loginUserRepository.findAllByLoginCodeAndUserIdIsNot(user.getLoginCode(), user.getUserId());
            }
            if (existUser != null) throw new Exception(existUser.getLoginCode() + "已存在，不能重复使用。");
            result = loginUserRepository.save(user);
        }
        return result;
    }
}
