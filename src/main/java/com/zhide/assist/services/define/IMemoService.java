package com.zhide.assist.services.define;

import com.zhide.assist.models.tbMemo;

import java.util.List;

public interface IMemoService {
    boolean SaveAll(List<tbMemo> items);

    boolean Remove(String ProductID, Integer ID);
}
