package com.zhide.assist.services.implement;

import com.zhide.assist.models.LoginUserInfo;
import com.zhide.assist.models.tbMemo;
import com.zhide.assist.multitenancy.CompanyContext;
import com.zhide.assist.repositorys.memoRepository;
import com.zhide.assist.services.define.IMemoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class MemoServiceImpl implements IMemoService {
    @Autowired
    memoRepository memoRep;

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean SaveAll(List<tbMemo> items) {
        for (int i = 0; i < items.size(); i++) {
            tbMemo item = items.get(i);
            if (item.getCreateTime() == null) {
                item.setCreateTime(new Date());

            } else {
                item.setUpdateTime(new Date());
            }
            memoRep.save(item);
        }
        return true;
    }

    @Override
    public boolean Remove(String ProductID, Integer ID) {
        Optional<tbMemo> findOnes = memoRep.findFirstByProductidAndId(ProductID, ID);
        if (findOnes.isPresent()) {
            memoRep.delete(findOnes.get());
            return true;
        } else return false;
    }

}
