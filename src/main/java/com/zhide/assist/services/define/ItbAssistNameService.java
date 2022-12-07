package com.zhide.assist.services.define;

import com.zhide.assist.common.pageObject;
import com.zhide.assist.models.tbAssitName;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

public interface ItbAssistNameService {
    tbAssitName Save(tbAssitName tbAssitName) throws Exception;

    pageObject getData(HttpServletRequest request) throws Exception;

    boolean remove(List<Integer> ids, String State);

    boolean reback(List<Integer> ids);

    boolean copy(List<Integer> ids) throws Exception;
}
