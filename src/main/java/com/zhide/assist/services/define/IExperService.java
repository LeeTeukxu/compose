package com.zhide.assist.services.define;

import com.zhide.assist.models.tbAttached;
import com.zhide.assist.models.TreeNode;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface IExperService {
    tbAttached AddFile(MultipartFile file, String TechMainID, List<String> FileNames, String FileType) throws Exception;

    tbAttached ReplaceAtt(MultipartFile file, String AttID) throws Exception;

    tbAttached UpdatePicDes(String Value, String AttID) throws Exception;

    void BatchDeleteById(List<String> listAttIds, List<String> listPaths, String TechMainID, String Type);
    void DeleteById(String AttID, String TechMainID, String Type, String Path);

    List<TreeNode> GetAllAttachedByRowValueAndType(Integer TechMainID, String Type);
}
