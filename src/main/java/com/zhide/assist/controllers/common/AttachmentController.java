package com.zhide.assist.controllers.common;

import com.zhide.assist.common.PathUtils;
import com.zhide.assist.common.successResult;
import com.zhide.assist.models.LoginUserInfo;
import com.zhide.assist.models.tbAttachment;
import com.zhide.assist.multitenancy.CompanyContext;
import com.zhide.assist.repositorys.tbAttachmentRepository;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileInputStream;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/attachment")
public class AttachmentController {
    @Autowired
    tbAttachmentRepository attachmentRep;

    @RequestMapping("/getAttachmentByIDS")
    public @ResponseBody
    successResult GetAttachmentByIDS(String IDS) {
        successResult result = new successResult();
        try {
            List<Map<String, Object>> rr = new ArrayList<>();
            if (StringUtils.isEmpty(IDS) == false) {
                String[] IDX = IDS.split(",");
                SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                List<tbAttachment> atts = attachmentRep.findAllByGuidInOrderByUploadTime(Arrays.asList(IDX));
                for (int i = 0; i < atts.size(); i++) {
                    tbAttachment att = atts.get(i);
                    Integer Type = att.getType();
                    if (Type == null) Type = 1;
                    Map<String, Object> r = new HashMap<>();
                    r.put("ATTID", att.getGuid());
                    r.put("FILENAME", att.getName());
                    r.put("FILESIZE", att.getSize());
                    r.put("FTYPE", Type);
                    r.put("UPLOADTIME", simple.format(att.getUploadTime()));
                    r.put("UPLOADMAN", att.getUploadManName());
                    rr.add(r);
                }
                result.setData(rr);
            }
        } catch (Exception ax) {
            result.raiseException(ax);
        }
        return result;
    }
}
