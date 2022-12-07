package com.zhide.assist.repositorys;

import com.zhide.assist.models.tbIndependence;
import com.zhide.assist.models.tbexpedient;
import org.apache.ibatis.annotations.Param;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.Optional;

@Repository
public interface tbexpedientRepository extends JpaRepository<tbexpedient,Integer> {
    int deleteAllByGuid(String GUID);
    Optional<tbexpedient> findByGuidAndCqexpedientorder(String GUID, String Cqexpedientorder);

    @Transactional
    @Modifying
    @Query(value = "UPDATE tbexpedient" +
            " SET CqTechnicalsolutions=:CqTechnicalsolutions,CqBeneficialeffect=:CqBeneficialeffect,CqExamples=:CqExamples" +
            " WHERE GUID=:GUID AND Cqexpedientorder=:Cqexpedientorder",nativeQuery = true)
    int UpdateByGUIDANDCqexpedientorder(@Param("GUID") String GUID,
                                             @Param("CqTechnicalsolutions") String CqTechnicalsolutions,
                                             @Param("CqBeneficialeffect") String CqBeneficialeffect,
                                             @Param("CqExamples") String CqExamples,
                                             @Param("Cqexpedientorder") String Cqexpedientorder
    );
}
