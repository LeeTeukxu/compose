package com.zhide.assist.models;

import java.io.Serializable;
import java.util.List;

public class ListDrag implements Serializable {
    public ListDrag(){

    }

    public List<Integer> sortItem;
    public List<String> sortAttID;
    public String type;
    public String rowValue;

    public List<Integer> getSortItem() {
        return sortItem;
    }
    public void setSortItem(List<Integer> sortItem){this.sortItem=sortItem;}
    public List<String> getSortAttID(){return sortAttID;}
    public void setSortAttID(List<String> sortAttID){this.sortAttID=sortAttID;}

    public String getType() {
        return type;
    }
    public void setType(String type) {
        this.type = type;
    }

    public String getRowValue() {
        return rowValue;
    }

    public void setRowValue(String rowValue) {
        this.rowValue = rowValue;
    }
}
