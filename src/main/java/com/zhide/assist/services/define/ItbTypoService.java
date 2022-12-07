package com.zhide.assist.services.define;

import com.zhide.assist.models.tbTypo;

import java.util.List;

public interface ItbTypoService {
    boolean SaveAll(List<tbTypo> items);

    boolean Remove(Integer UserID, Integer ID);
}
