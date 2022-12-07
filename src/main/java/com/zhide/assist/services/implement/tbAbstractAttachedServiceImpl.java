package com.zhide.assist.services.implement;

import com.zhide.assist.common.EntityHelper;
import com.zhide.assist.models.LoginUserInfo;
import com.zhide.assist.models.tbAbstractAttached;
import com.zhide.assist.multitenancy.CompanyContext;
import com.zhide.assist.repositorys.tbAbstractAttachedRepository;
import com.zhide.assist.services.define.ItbAbstractAttachedService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import javax.swing.text.html.parser.Entity;
import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;

@Service
public class tbAbstractAttachedServiceImpl implements ItbAbstractAttachedService {
    @Autowired
    tbAbstractAttachedRepository abstractAttachedRepository;

    @Override
    public tbAbstractAttached zhaiyao(List<String> ids, HttpSession session) {
        LoginUserInfo Info = CompanyContext.get();
        tbAbstractAttached abstractAttached = new tbAbstractAttached();
        String id = ids.get(0);
        Optional<tbAbstractAttached> findAbstractAttached = null;
        findAbstractAttached = abstractAttachedRepository.findByRowValue(Info.getRowValue());
        tbAbstractAttached tbAbstractAttached = new tbAbstractAttached();
        if (findAbstractAttached!=null && findAbstractAttached.isPresent()){
            Optional<tbAbstractAttached> findOne = abstractAttachedRepository.findByRowValue(Info.getRowValue());
            tbAbstractAttached abs = new tbAbstractAttached();
            if (findOne.isPresent()) {
                abs = findOne.get();
                abs.setAttid(id);
            }
            abstractAttachedRepository.save(abs);
        }else {
            tbAbstractAttached.setAttid(id);
            tbAbstractAttached.setRowValue(Info.getRowValue());
            abstractAttached = abstractAttachedRepository.save(tbAbstractAttached);
        }
        return abstractAttached;
    }
}
