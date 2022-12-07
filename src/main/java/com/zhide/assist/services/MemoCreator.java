package com.zhide.assist.services;

import com.zhide.assist.models.tbMemo;
import org.apache.logging.log4j.util.Strings;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class MemoCreator {
    List<tbMemo> rows;

    public MemoCreator(List<tbMemo> ms) {
        rows = ms;
    }

    public List<String> Build(String productid) {
        List<String> SS = new ArrayList<String>();
        if (rows.size() == 0) return SS;
        for (int i = 0; i < rows.size(); i++) {
            tbMemo row = rows.get(i);
            if (row.getProductid().equals(productid)) {
                String VK = createSingle(i + 1, row);
                SS.add(VK);
            }
        }
        return SS;
    }

    private String createSingle(int RowNum, tbMemo row) {
        SimpleDateFormat simple = new SimpleDateFormat("yyyy年MM月dd日HH时mm分ss秒");
        String Action = "添加";
        String ActionDate = simple.format(row.getCreateTime());
        if (row.getUpdateTime() != null) {
            ActionDate = simple.format(row.getUpdateTime());
            Action = "更新";
        }
        String Part = "";
        String All = "";
        String Memo = row.getMemo();
        Part = "%s:%s备注:【%s】";
        All = Integer.toString(RowNum) + "、" + String.format(Part, ActionDate, Action, Memo);
        return All;
    }
}
