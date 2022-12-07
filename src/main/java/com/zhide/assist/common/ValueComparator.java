package com.zhide.assist.common;

import java.util.Comparator;
import java.util.HashMap;
import java.util.Map;

public class ValueComparator implements Comparator<String> {
    Map<String, String> map = new HashMap<String, String>();

    public ValueComparator(Map<String, String> map){
        this.map = map;
    }

    @Override
    public int compare(String s1, String s2) {
        return map.get(s1).compareTo(map.get(s2));
    }

}
