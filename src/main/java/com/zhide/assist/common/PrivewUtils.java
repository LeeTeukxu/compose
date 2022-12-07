package com.zhide.assist.common;

import com.zhide.assist.models.IndeTypo;
import org.springframework.stereotype.Component;

import java.util.*;

@Component
public class PrivewUtils {

    public Comparator<IndeTypo> order(){
        Comparator<IndeTypo> comparator = new Comparator<IndeTypo>() {
            @Override
            public int compare(IndeTypo o1, IndeTypo o2) {
                if (o1.getDqExclusiveorder() != o2.getDqExclusiveorder()){
                    return Integer.parseInt(o1.getDqExclusiveorder()) - Integer.parseInt(o2.getDqExclusiveorder());
                }
                return 0 ;
            }
        };
        return comparator;
    }

    public Map<String,Object> findTree(List<IndeTypo> list){
        Map<String,Object> data = new HashMap<String,Object>();
        try {
            //根节点
            List<IndeTypo> rootMenu = new ArrayList<IndeTypo>();
            for (IndeTypo nav : list) {
                if (nav.getPid().equals( "0" )){ //父节点是0的，为根节点。
                    rootMenu.add(nav);
                }
            }
            /* 根据Menu类的order排序 */
            Collections.sort(rootMenu, order());
            //为根菜单设置子菜单，getClild是递归调用的
            for (IndeTypo nav : rootMenu) {
                /* 获取根节点下的所有子节点 使用getChild方法*/
                List<IndeTypo> childList = getChild(nav.getInId().toString(), list);
                nav.setJs(childList);//给根节点设置子节点
            }
            /**
             * 输出构建好的菜单数据。
             *
             */
            data.put( "success" , "true" );
            data.put( "list" , rootMenu);
            return data;
        } catch (Exception e) {
            data.put( "success" , "false" );
            data.put( "list" , new ArrayList());
            return data;
        }
    }

    /**
     * 获取子节点
     * @param id 父节点id
     * @param allMenu 所有菜单列表
     * @return 每个根节点下，所有子菜单列表
     */
    public List<IndeTypo> getChild(String id,List<IndeTypo> allMenu){
        //子菜单
        List<IndeTypo> childList = new ArrayList<IndeTypo>();
        for (IndeTypo nav : allMenu) {
            // 遍历所有节点，将所有菜单的父id与传过来的根节点的id比较
            //相等说明：为该根节点的子节点。
            if (nav.getPid().equals(id)){
                childList.add(nav);
            }
        }
        //递归
        for (IndeTypo nav : childList) {
            nav.setJs(getChild(nav.getInId().toString(), allMenu));
        }
        Collections.sort(childList,order()); //排序
        //如果节点下没有子节点，返回一个空List（递归退出）
        if (childList.size() == 0 ){
            return new ArrayList<IndeTypo>();
        }
        return childList;
    }
}
