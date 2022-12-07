package com.zhide.assist.services.define;

import com.zhide.assist.common.pageObject;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface ITruthService {

    pageObject getData(HttpServletRequest request) throws Exception;

    void UpdateTime() throws Exception;

    boolean remove(List<Integer> ids, String State) throws Exception;

    boolean Copy(List<Integer> ids, List<Integer> TechMainIDS) throws Exception;

    boolean reback(List<Integer> ids);
}
