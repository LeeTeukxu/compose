package com.zhide.assist.controllers.Product;

import com.alibaba.fastjson.JSON;
import com.zhide.assist.common.*;
import com.zhide.assist.mapper.MemoMapper;
import com.zhide.assist.models.*;
import com.zhide.assist.multitenancy.CompanyContext;
import com.zhide.assist.repositorys.*;
import com.zhide.assist.services.define.IMemoService;
import com.zhide.assist.services.define.ItbAssistNameService;
import org.apache.logging.log4j.util.Strings;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.URLEncoder;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Controller
@RequestMapping("/Product")
public class ProductNameController {

    Logger logger = LoggerFactory.getLogger(ProductNameController.class);

    @Autowired
    ItbAssistNameService itbAssistNameService;

    @Autowired
    tbAssistNameRepository assistNameRepository;

    @Autowired
    MemoMapper memoMapper;

    @Autowired
    IMemoService memoService;

    @Autowired
    tbTypoRepository typoRepository;

    @RequestMapping("/selecttemplate")
    public String SelectTemplate(Map<String,Object> map){
        LoginUserInfo Info = CompanyContext.get();
        map.put("UserID",Info.getUserIdValue());
        map.put("RowValue", "");
        map.put("Type", "select");
        return "/Template/downloadtemplate";
    }

    @RequestMapping("index")
    public String Index(Map<String,Object> model, String Mode, HttpServletRequest request){
        LoginUserInfo Info = CompanyContext.get();
        int rowValue = 0;
        if (Info.getRowValue()==null){
            rowValue = 0;
        }else rowValue = Info.getRowValue();
        Optional<tbAssitName> find = assistNameRepository.findById(rowValue);
        if (find.isPresent()){
            model.put("LoadData",JSON.toJSONString(find.get()));
        }else model.put("LoadData","{}");
        List<Map<String,Object>> findTypo = typoRepository.finByUID(Info.getUserIdValue());
        if (findTypo.size() > 0){
            model.put("TypoData",JSON.toJSONString(findTypo));
        }else model.put("TypoData","{}");
        if (Mode == null){
            if (rowValue != 0){
                Mode = "Edit";
            }else Mode = "Add";
        }
        model.put("Mode",Mode);
        return "/Product/index";
    }

//    @RequestMapping("/editAssistName")
//    public String EditAssistName(int ID,Map<String,Object> model){
//        model.put("Mode","Edit");
//        Optional<tbAssitName> findtb = assistNameRepository.findById(ID);
//        if (findtb.isPresent()){
//            model.put("LoadData",JSON.toJSONString(findtb.get()));
//        }else model.put("LoadData","{}");
//        return "index";
//    }

    @RequestMapping("/save")
    @ResponseBody
    public successResult Save(String AssistName, HttpServletRequest request,HttpSession session){
        successResult result = new successResult();
        tbAssitName res=null;
        try {
            String Data = request.getParameter("Data");
            if (Strings.isEmpty(Data)==false){
                tbAssitName tbAssitName = JSON.parseObject(Data,tbAssitName.class);
                tbAssitName.setAssistName(AssistName);
                res = itbAssistNameService.Save(tbAssitName);
                result.setData(res);
                session.setAttribute("AssistID",res.getId());
            } else throw new Exception("数据格式不正确！");
        }
        catch (Exception ax){
            result.raiseException(ax);
        }
        return result;
    }

    @RequestMapping("/getData")
    @ResponseBody
    public pageObject getData(HttpServletRequest request){
        pageObject result = new pageObject();
        try {
            result = itbAssistNameService.getData(request);
        }catch (Exception ax){
            logger.info(ax.getMessage());
        }
        return result;
    }
    @RequestMapping("/upload")
    @ResponseBody
    public String Upload(@RequestParam("file")MultipartFile file){
        if (file.isEmpty()){
            System.out.println("上传失败，请选择文件");
            return "上传失败，请选择文件";
        }
        FTPUtil util = new FTPUtil();
        String filePath = util.getPath() + "/doc/zlsqsTemplate.docx";
        File dest = new File(filePath);
        try {
            file.transferTo(dest);
            logger.info("上传成功");
        }catch (IOException e){
            logger.info(e.getMessage());
        }
        return "上传失败";
    }

    @RequestMapping(value = "/updateTime",method = RequestMethod.POST)
    @ResponseBody
    public successResult UpdateTime(){
        LoginUserInfo Info = CompanyContext.get();
        successResult res = new successResult();
        res.setSuccess(false);
        try {
            Integer result = assistNameRepository.UpdateTime(new Date(),Info.getRowValue());
            if (result>0){
                res.setSuccess(true);
            }
        }catch (Exception ex){
            res.raiseException(ex);
        }
        return res;
    }

    @RequestMapping("/updatedowncount")
    @ResponseBody
    public successResult UploadDownloadCount(HttpServletRequest request){
        successResult result = new successResult();
        tbAssitName assitName = new tbAssitName();
        try {
            String ID = request.getParameter("ID");
            Optional<tbAssitName> findOne = assistNameRepository.findById(Integer.parseInt(ID));
            if (findOne.isPresent()){
                assitName = findOne.get();
                Integer OldCount = assitName.getDownloadNum();
                assitName.setDownloadNum(OldCount + 1);
                assitName.setDownloadTime(new Date());
                EntityHelper.copyObject(assitName, findOne.get());
            }
            assistNameRepository.save(assitName);
        }catch (Exception ax){
            result.setSuccess(false);
            result.setMessage(ax.getMessage());
        }
        return result;
    }

    @RequestMapping("/updateFiveDownCount")
    @ResponseBody
    public successResult UpdateFiveDownCount(HttpServletRequest request){
        successResult result = new successResult();
        tbAssitName assitName = new tbAssitName();
        try {
            String ID = request.getParameter("ID");
            Optional<tbAssitName> findOne = assistNameRepository.findById(Integer.parseInt(ID));
            if (findOne.isPresent()){
                assitName = findOne.get();
                Integer OldCount = assitName.getDownloadFiveNum();
                assitName.setDownloadFiveNum(OldCount + 1);
                assitName.setDownloadTime(new Date());
                EntityHelper.copyObject(assitName, findOne.get());
            }
            assistNameRepository.save(assitName);
        }catch (Exception ax){
            result.setSuccess(false);
            result.setMessage(ax.getMessage());
        }
        return result;
    }

    @RequestMapping(value = "/remove",method = RequestMethod.POST)
    @ResponseBody
    public successResult Remove(@RequestBody List<Integer> ids, HttpServletRequest request){
        successResult result = new successResult();
        try {
            String State = request.getParameter("State");
            itbAssistNameService.remove(ids, State);
        }catch (Exception ax){
            result.setSuccess(false);
            result.raiseException(ax);
        }
        return result;
    }

    @RequestMapping(value = "/reback",method = RequestMethod.POST)
    @ResponseBody
    public successResult ReBack(@RequestBody List<Integer> ids){
        successResult result = new successResult();
        try {
            itbAssistNameService.reback(ids);
        }catch (Exception ax){
            result.setSuccess(false);
            result.raiseException(ax);
        }
        return result;
    }

    @RequestMapping("/addMemo")
    public String AddMemo(String ProductID, Map<String, Object> model) {
        model.put("ProductID", ProductID);
        return "/Product/addMemo";
    }

    @RequestMapping("/getMemoData")
    @ResponseBody
    public List<Map<String, Object>> getMemoData(String ProductID) {
        return memoMapper.getData(ProductID);
    }

    @RequestMapping("/saveMemo")
    @ResponseBody
    public successResult SaveMemo(String Data) {
        successResult result = new successResult();
        try {
            List<tbMemo> items = JSON.parseArray(Data, tbMemo.class);
            memoService.SaveAll(items);
        } catch (Exception ax) {
            result.raiseException(ax);
        }
        return result;
    }

    @ResponseBody
    @RequestMapping("/removeMemo")
    public successResult RemoveMemo(String ProductID, Integer ID) {
        successResult result = new successResult();
        try {
            boolean X = memoService.Remove(ProductID, ID);
            result.setSuccess(X);
        } catch (Exception ax) {
            result.raiseException(ax);
        }
        return result;
    }

    @RequestMapping(value = "/copy",method = RequestMethod.POST)
    @ResponseBody
    public successResult Copy(@RequestBody List<Integer> ids, HttpServletRequest request){
        successResult result = new successResult();
        try {
            itbAssistNameService.copy(ids);
        }catch (Exception ax){
            result.setSuccess(false);
            result.raiseException(ax);
        }
        return result;
    }
}
