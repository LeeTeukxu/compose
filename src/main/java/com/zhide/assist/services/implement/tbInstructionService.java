package com.zhide.assist.services.implement;

import com.zhide.assist.common.EntityHelper;
import com.zhide.assist.models.LoginUserInfo;
import com.zhide.assist.models.tbInstruction;
import com.zhide.assist.multitenancy.CompanyContext;
import com.zhide.assist.repositorys.tbInstructionRepository;
import com.zhide.assist.services.define.ItbInstructionService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class tbInstructionService implements ItbInstructionService {

    @Autowired
    tbInstructionRepository tbInstructionRepository;

    @Override
    public tbInstruction Save(@Param("Data") tbInstruction tbInstruction, String Instruction) throws Exception {
        LoginUserInfo Info = CompanyContext.get();
        if (tbInstruction == null) throw new Exception("数据为空！");
        if (tbInstruction.getId() == null){
            tbInstruction.setInstruction(Instruction);
            tbInstruction.setRowValue(Info.getRowValue());
            tbInstruction.setUserId(Integer.parseInt(Info.getUserId()));
        }else {
            Optional<tbInstruction> find = tbInstructionRepository.findById(tbInstruction.getId());
            if (find.isPresent()){
                tbInstruction.setInstruction(Instruction);
                EntityHelper.copyObject(tbInstruction,find.get());
            }else throw new Exception("数据异常:"+Integer.toString(tbInstruction.getId())+"无法获取到数据");
        }
        tbInstruction instruction = tbInstructionRepository.save(tbInstruction);
        return instruction;
    }
}
