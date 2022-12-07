package com.zhide.assist.services.implement;

import com.zhide.assist.models.tbTypo;
import com.zhide.assist.repositorys.tbTypoRepository;
import com.zhide.assist.services.define.ItbTypoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class tbTypoServiceImpl implements ItbTypoService {
    @Autowired
    tbTypoRepository typoRep;

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean SaveAll(List<tbTypo> items) {
        for (int i = 0; i < items.size(); i++) {
            tbTypo item = items.get(i);
            if (item.getCreateTime() == null) {
                item.setCreateTime(new Date());
            }
            typoRep.save(item);
        }
        return true;
    }

    @Override
    public boolean Remove(Integer UserID, Integer ID) {
        Optional<tbTypo> findOnes = typoRep.findFirstByUseridAndId(UserID, ID);
        if (findOnes.isPresent()) {
            typoRep.delete(findOnes.get());
            return true;
        } else return false;
    }

}
