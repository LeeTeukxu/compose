package com.zhide.assist.repositorys;

import com.zhide.assist.models.tbAssitName;
import com.zhide.assist.models.tbDigitalSign;
import com.zhide.assist.models.tbIndependence;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Map;
import java.util.Optional;

public interface tbIndependenceRepository extends JpaRepository<tbIndependence,Integer> {
    int deleteAllByRowValue(Integer RowValue);
    int deleteAllByRowValueIn(List<Integer> ids);

    @Query(value = " SELECT * FROM tbIndependence WHERE UserID=:UserID and RowValue=:RowValue ORDER BY DqExclusiveorder",nativeQuery = true)
    List<Map<String,Object>> findByRowValue(Integer UserID,Integer RowValue);

    @Query(value = "select * FROM tbIndependence WHERE UserID=:UserID and RowValue=:RowValue  ORDER BY  CAST(DqExclusiveorder as decimal)  asc",nativeQuery = true)
    List<Map<String,Object>> getDataWindow(Integer UserID,Integer RowValue);

    List<tbIndependence> findAllByRowValueAndDqNum(Integer RowValue,String DqNum);

    List<tbIndependence> findAllByRowValue(Integer RowValue);

    List<tbIndependence> findAllByRowValueOrderByDqExclusiveorderAsc(Integer RowValue);

    List<tbIndependence> findAllByRowValueAndUserIdOrderByDqExclusiveorderAsc(Integer RowValue, Integer UserId);

    Optional<tbIndependence> findByuserIdAndDqExclusiveorderAndRowValue(int UserID,String DqExclusiveorder,int RowValue);

    List<tbIndependence> findAllByRowValueAndDqExclusiveorder(Integer RowValue,String DqExclusiveorder);

    Optional<tbIndependence> deleteByUserIdAndDqExclusiveorderAndRowValue(int UserID,String DqExclusiveorder,int RowValue);

    @Query(value = "SELECT * FROM tbIndependence WHERE UserID=:UserID AND RowValue=:RowValue AND DqExclusiveorder>:DqExclusiveorder order by DqExclusiveorder asc",nativeQuery = true)
    List<tbIndependence> getDqExclusiveorderByUserIDANDRowValueAndRowValue(int UserID,int DqExclusiveorder,int RowValue);

    @Query(value = "SELECT * FROM tbIndependence WHERE UserID=:UserID AND RowValue=:RowValue AND DqExclusiveorder>:DqExclusiveorder ORDER BY DqExclusiveorder ASC",nativeQuery = true)
    List<Map<String,Object>> getDqExorderdy(int UserID,int DqExclusiveorder,int RowValue);

    @Query(value = "SELECT * FROM tbIndependence WHERE DqExclusiveorder>=:DqExclusiveorder AND RowValue=:RowValue  AND UserID=:UserID ORDER BY DqExclusiveorder ASC",nativeQuery = true)
    List<Map<String,Object>> getDqExorderlq(int UserID,int DqExclusiveorder,int RowValue);

    @Transactional
    @Modifying
    @Query(value = " update tbIndependence set DqExclusiveorder=:Pa where DqExclusiveorder=:DqExclusiveorder and Rowvalue=:RowValue and UserID=:UserID and OnlyId=:OnlyId",nativeQuery = true)
    int UpDqExclusiveorder(@Param("UserID") int UserID,@Param("DqExclusiveorder")String DqExclusiveorder,
                           @Param("RowValue") int RowValue,@Param("Pa") String Pa,@Param("OnlyId")int OnlyId);

    @Query(value = "SELECT MAX(OnlyId)+1 FROM tbIndependence WHERE UserID=:UserID AND RowValue=:RowValue",nativeQuery = true)
    Integer MaxOnlyId(@Param("UserID")Integer UserID,@Param("RowValue") Integer RowValue);

    @Transactional
    @Modifying
    @Query(value = "UPDATE tbIndependence" +
            " SET DqExclusiveorder=:pa" +
            " WHERE userId=:UserID AND DqExclusiveorder=:DqExclusiveorder AND RowValue=:RowValue ",nativeQuery = true)
    int UpdateDqExclusiveorderByUserIDANDDqExclusiveorder(
            @Param("UserID") int UserID,
            @Param("pa")int pa,
            @Param("DqExclusiveorder") String DqExclusiveorder,
            @Param("RowValue") int RowValue
    );

    @Transactional
    @Modifying
    @Query(value = "UPDATE tbIndependence  " +
            "SET DqExclusiveorder=:XGDqExclusiveorder " +
            "WHERE userId=:UserID AND DqExclusiveorder=:DqExclusiveorder AND RowValue=:RowValue AND InId=:InId ",nativeQuery = true)
    int UpdateDqExclusiveorderByUserIDANDInId(
            @Param("UserID") int UserID,
            @Param("InId") int InId,
            @Param("XGDqExclusiveorder")int XGDqExclusiveorder,
            @Param("DqExclusiveorder") String DqExclusiveorder,
            @Param("RowValue") int RowValue
    );


/*    @Transactional
    @Modifying
    @Query(value = "DELETE FROM tbIndependence WHERE userId=:UserID AND DqExclusiveorder=:DqExclusiveorder AND RowValue=:RowValue",nativeQuery = true)
    int deleteqlyq(@Param("UserID") int UserID, @Param("DqExclusiveorder") String DqExclusiveorder, @Param("RowValue") int RowValue);*/

    @Transactional
    @Modifying
    @Query(value = "UPDATE tbIndependence" +
            " SET DqObjectinvention=:DqObjectinvention,DqTechnicalsolutions=:DqTechnicalsolutions,DqBeneficialeffect=:DqBeneficialeffect,DqNum=:DqNum" +
            " WHERE userId=:UserID AND DqExclusiveorder=:DqExclusiveorder AND RowValue=:RowValue ",nativeQuery = true)
    int UpdateSortByUserIDANDDqExclusiveorder(
                          @Param("UserID") int UserID,
                          @Param("DqObjectinvention")String DqObjectinvention,
                          @Param("DqTechnicalsolutions") String DqTechnicalsolutions,
                          @Param("DqBeneficialeffect") String DqBeneficialeffect,
                          @Param("DqExclusiveorder") String DqExclusiveorder,
                          @Param("DqNum") String DqNum,
                          @Param("RowValue") int RowValue
                          );

    @Transactional
    @Modifying
    @Query(value = "UPDATE tbIndependence SET DqObjectinvention=:DqObjectinvention WHERE InId=:InId",nativeQuery = true)
    int updateObj(@Param("DqObjectinvention") String DqObjectinvention,
                  @Param("InId") Integer InId);

    @Transactional
    @Modifying
    @Query(value = "UPDATE tbIndependence SET DqTechnicalsolutions=:DqTechnicalsolutions WHERE InId=:InId",nativeQuery = true)
    int updateTec(@Param("DqTechnicalsolutions") String DqTechnicalsolutions,
                  @Param("InId") Integer InId);

    @Transactional
    @Modifying
    @Query(value = "UPDATE tbIndependence SET DqBeneficialeffect=:DqBeneficialeffect WHERE InId=:InId",nativeQuery = true)
    int updateBen(@Param("DqBeneficialeffect") String DqBeneficialeffect,
                  @Param("InId") Integer InId);
}
