package com.zhide.assist.services.implement;

import com.alibaba.fastjson.JSONObject;
import com.zhide.assist.common.FTPUtil;
import com.zhide.assist.mapper.AttachedMapper;
import com.zhide.assist.models.LoginUserInfo;
import com.zhide.assist.models.tbAttached;
import com.zhide.assist.multitenancy.CompanyContext;
import com.zhide.assist.repositorys.tbAbstractAttachedRepository;
import com.zhide.assist.repositorys.tbAttachedRepository;
import com.zhide.assist.services.define.ItbAttachedService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class tbAttachedService implements ItbAttachedService {

    @Autowired
    tbAttachedRepository attachedRepository;

    @Autowired
    tbAbstractAttachedRepository abstractAttachedRepository;

    @Autowired
    AttachedMapper attachedMapper;

    @Override
    @Transactional(rollbackOn = Exception.class)
    public boolean remove(List<Integer> ids, HttpSession session) {
        LoginUserInfo Info = CompanyContext.get();
        for (int i=0;i<ids.size();i++){
            Integer id = ids.get(i);
            tbAttached attached = attachedRepository.getAllBySortAndRowValue(id,Info.getRowValue());
            if (attached!=null){
                FTPUtil util = new FTPUtil();
                String FilePath = util.getPath() + "/Assist/";
                File file = new File(attached.getPath().trim());
                String FileName  = file.getName();
                DelFile(FilePath,FileName);
                abstractAttachedRepository.deleteAllByAttidAndRowValue(attached.getPath(),Info.getRowValue());
            }
            attachedRepository.deleteAllBySortAndRowValue(id,Info.getRowValue());
        }
        List<tbAttached> list = attachedRepository.getAllByRowValueOrderBySort(Info.getRowValue());
        for (int j=0;j<list.size();j++){
            tbAttached attached = list.get(j);
            String CnSort = "图" + (j + 1);
            attachedRepository.updateSortByRowValue(j+1,CnSort,Info.getRowValue(),attached.getSort());
        }
        return  true;
    }

    @Override
    @Transactional(rollbackOn = Exception.class)
    public boolean NewRemove(List<String> ids) {
        LoginUserInfo Info = CompanyContext.get();
        for (int i=0;i<ids.size();i++){
            String id = ids.get(i);
            tbAttached attached = attachedRepository.getAllByPathAndRowValue(id,Info.getRowValue());
            if (attached != null) {
                FTPUtil util = new FTPUtil();
                String FilePath = util.getPath() + "/Assist/";
                File file = new File(attached.getPath().trim());
                String FileName = file.getName();
                abstractAttachedRepository.deleteAllByAttidAndRowValue(id,Info.getRowValue());
                attachedRepository.deleteAllByPathAndRowValue(id,Info.getRowValue());
                DelFile(FilePath,FileName);
            }
        }
        List<tbAttached> list = attachedRepository.getAllByRowValueOrderBySort(Info.getRowValue());
        for (int j=0;j<list.size();j++){
            tbAttached attached = list.get(j);
            String CnSort = "图" + (j + 1);
            attachedRepository.updateSortByRowValue(j+1,CnSort,Info.getRowValue(),attached.getSort());
        }
        return true;
    }

    public static void DelFile(String FilePath, String FileName){
        FTPUtil util = new FTPUtil();
        File folder = new File(util.getPath() + "/Assist");
        File[] files = folder.listFiles();
        for (File file:files){
            if (file.getName().equals(FileName)){
                file.delete();
            }
        }
    }
}
