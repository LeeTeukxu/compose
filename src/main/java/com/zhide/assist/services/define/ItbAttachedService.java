package com.zhide.assist.services.define;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface ItbAttachedService {
    boolean remove(List<Integer> ids, HttpSession session);

    boolean NewRemove(List<String> ids);
}
