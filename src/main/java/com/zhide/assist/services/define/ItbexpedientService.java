package com.zhide.assist.services.define;
import com.zhide.assist.models.tbIndependence;
import com.zhide.assist.models.tbexpedient;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import java.util.Optional;

public interface ItbexpedientService {
    tbexpedient Save(tbexpedient tbexpedient, HttpSession session) throws Exception;

    Optional<tbexpedient> findByGuidAndCqexpedientorder(String GUID, String CqExclusiveorder) throws Exception;

/*    void UpdateByGUIDANDCqexpedientorder(int InId,String GUID, String CqTechnicalsolutions,
                                         String CqBeneficialeffect, String CqExamples, String Cqexpedientorder) throws Exception;*/

    boolean deleteAllByGuid(String GUID) throws Exception;
}
