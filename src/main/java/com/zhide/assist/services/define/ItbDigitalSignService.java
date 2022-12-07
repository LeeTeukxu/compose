package com.zhide.assist.services.define;

import com.zhide.assist.models.tbAssitName;
import com.zhide.assist.models.tbDigitalSign;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface ItbDigitalSignService {
    tbDigitalSign Save(tbDigitalSign tbDigitalSign, HttpSession session) throws Exception;
}
