package com.zhide.assist.controllers.Instruction;

import com.alibaba.fastjson.JSON;
import com.zhide.assist.common.DocUtils;
import com.zhide.assist.common.successResult;
import com.zhide.assist.mapper.InstructionMapper;
import com.zhide.assist.models.*;
import com.zhide.assist.multitenancy.CompanyContext;
import com.zhide.assist.repositorys.*;
import com.zhide.assist.services.define.ItbInstructionService;
import org.apache.logging.log4j.util.Strings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.print.Doc;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Controller
@RequestMapping("/Instruction")
public class InstructionController {

    @Autowired
    tbInstructionRepository instructionRepository;

    @Autowired
    tbAttachedRepository attachedRepository;

    @Autowired
    tbDigitalSignRepository digitalSignRepository;

    @Autowired
    InstructionMapper instructionMapper;

    @Autowired
    ItbInstructionService instructionService;

    @Autowired
    tbTemplateConfigRepository templateConfigRepository;

    @Autowired
    tbAssistNameRepository assistNameRepository;

    @Autowired
    tbTypoRepository typoRepository;

    String GUID = "";
    @RequestMapping("/index")
    public String Index(Map<String,Object> model){
        LoginUserInfo Info = CompanyContext.get();
        List<tbAttached> list = new ArrayList<>();
        Optional<tbInstruction> findInstruction = null;
        Optional<tbDigitalSign> findDigitalSign = null;
        if (Info.getRowValue() != 0){
            list = attachedRepository.getAllByRowValueOrderBySort(Info.getRowValue());
            findDigitalSign = digitalSignRepository.findByRowValue(Info.getRowValue());
            findInstruction = instructionRepository.findByRowValue(Info.getRowValue());
        }
        model.put("RowValue", Info.getRowValue());
        model.put("Pictuers",list);
        if (findDigitalSign!=null && findDigitalSign.isPresent()) {
            model.put("DigitalSign", JSON.toJSONString(findDigitalSign.get()));
            model.put("DigitalSignid", findDigitalSign.get().getId());
        }else {
            model.put("DigitalSign", "{}");
            model.put("DigitalSignid", "{}");
        }
        if (findInstruction!=null && findInstruction.isPresent()){
            model.put("Instruction",JSON.toJSONString(findInstruction.get()));
        }else model.put("Instruction","{}");
        model.put("PicNum",list.size());
        model.put("ListPic",JSON.toJSONString(list));
        model.put("userid", Info.getUserId());
        List<Map<String,Object>> findTypo = typoRepository.finByUID(Info.getUserIdValue());
        if (findTypo.size() > 0){
            model.put("TypoData",JSON.toJSONString(findTypo));
        }else model.put("TypoData","{}");
        return "/Instruction/index";
    }

    @ResponseBody
    @RequestMapping("/findTechAndInde")
    public successResult FindTechAndInde(HttpSession session){
        LoginUserInfo Info = CompanyContext.get();
        successResult result = new successResult();
        String CheckOne = "true";
        String CheckTwo = "true";
        String CheckThree = "true";
        String CheckFour = "true";
        try {
            tbAssitName assitName = assistNameRepository.getById(Info.getRowValue());
            List<tbTemplateConfig> listTemplateConfig = templateConfigRepository.findAllByTemplateId(assitName.getTemplateId());
            if (listTemplateConfig.size() > 0) {
                for (tbTemplateConfig config : listTemplateConfig){
                    if (config.getField().equals("CheckOne")){
                        CheckOne = config.getFieldContent();
                    }else if (config.getField().equals("CheckTwo")){
                        CheckTwo = config.getFieldContent();
                    }else if (config.getField().equals("CheckThree")){
                        CheckThree = config.getFieldContent();
                    }else if (config.getField().equals("CheckFour")){
                        CheckFour = config.getFieldContent();
                    }
                }
            }
            String content = instructionMapper.FindTechAndInde(CheckOne, CheckTwo, CheckThree, CheckFour, Info.getRowValue());
            if (content.indexOf("其特征在于") > -1){
                String GetDeleteKey = GetDeleteKey(content, "其特征在于");
                String DelKeyContent = DeleteDqKey(content,GetDeleteKey);
                content = DelKeyContent;
            }
            content = ClearBracket(content);
            result.setData(content);
        }catch (Exception ax){
            result.setMessage(ax.getMessage());
            result.setSuccess(false);
        }
        return result;
    }


    @RequestMapping("/delkey")
    @ResponseBody
    public successResult DelKey(HttpServletRequest request){
        successResult result = new successResult();
        String Data = request.getParameter("Data");
        if (Data.indexOf("其特征在于") > -1) {
            String GetDeleteKey = GetDeleteKey(Data, "其特征在于");
            String DelKeyContent = DeleteDqKey(Data,GetDeleteKey);
            result.setData(DelKeyContent);
        }else result.setSuccess(false);
        return result;
    }

    private String GetDeleteKey(String Content, String Key){
        String Result = "";
        if (Content.indexOf(Key) > -1) {
            Integer Index = Content.indexOf(Key);
            Integer KeyIndex = Index + Key.length();
            String AfterResult = Content.substring(KeyIndex, KeyIndex + 1);
            if (AfterResult.trim().replaceAll("\\p{P}", "").length() == 0) {
                Result = Key + AfterResult;
            }else Result = Key;
        }
        return Result;
    }

    private String DeleteDqKey(String Content,String Key){
        //独权删除其特征在于
        String result = "";
        if (Content.indexOf(Key) > -1) {
            Integer Index = Content.indexOf(Key);
            result =  Content.substring(0, Index) + Content.substring(Index + Key.length());
        }
        return result;
    }

    @RequestMapping("/save")
    @ResponseBody
    public successResult Save(HttpServletRequest request){
        successResult result = new successResult();
        tbInstruction res = null;
        try {
            String Instruction = request.getParameter("Instruction");
            String Data = request.getParameter("Data");
            if (Strings.isEmpty(Data) == false){
                tbInstruction instruction = JSON.parseObject(Data,tbInstruction.class);
                res = instructionService.Save(instruction, Instruction);
                result.setData(res);
            }else throw new Exception("数据格式不正确!");
        }catch (Exception ax){
            result.raiseException(ax);
        }
        return result;
    }

    private String ClearBracket(String context) {
        context = context.replace('(','（').replace(')','）');
        int head = context.indexOf('（'); // 标记第一个使用左括号的位置

        if (head == -1) {
            return context; // 如果context中不存在括号，什么也不做，直接跑到函数底端返回初值str

        } else {
            int next = head + 1; // 从head+1起检查每个字符

            int count = 1; // 记录括号情况

            do {
                if (context.charAt(next) == '（')

                    count++;

                else if (context.charAt(next) == '）')

                    count--;

                next++; // 更新即将读取的下一个字符的位置

                if (count == 0) // 已经找到匹配的括号

                {
                    String temp = context.substring(head, next); // 将两括号之间的内容及括号提取到temp中

                    context = context.replace(temp, ""); // 用空内容替换，复制给context

                    head = context.indexOf('（'); // 找寻下一个左括号

                    next = head + 1; // 标记下一个左括号后的字符位置

                    count = 1; // count的值还原成1

                }

            } while (head != -1); // 如果在该段落中找不到左括号了，就终止循环

        }

        return context; // 返回更新后的context
    }
}
