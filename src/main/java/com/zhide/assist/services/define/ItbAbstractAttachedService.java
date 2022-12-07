package com.zhide.assist.services.define;

import com.zhide.assist.models.tbAbstractAttached;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface ItbAbstractAttachedService {
    tbAbstractAttached zhaiyao(List<String> ids, HttpSession session);
}
