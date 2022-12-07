package com.zhide.assist.repositorys;

import com.zhide.assist.models.tbDqExamples;
import org.apache.ibatis.annotations.Param;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Map;
import java.util.Optional;

public interface tbDqExamplesRepository extends JpaRepository<tbDqExamples,Integer> {
    List<tbDqExamples> findByRowValue(Integer RowValue);
    int deleteAllByRowValue(Integer RowValue);
    int deleteAllByRowValueIn(List<Integer> ids);
    List<tbDqExamples> findByRowValueAndInIdOrderByOrderNumAsc(Integer RowValue,Integer InId);

    @Query(value = " SELECT * FROM tbDqExamples WHERE InId=:InId",nativeQuery = true)
    List<Map<String,Object>> findByInid(Integer InId);

    @Transactional
    @Modifying
    @Query(value = "delete from tbDqExamples where EpId=:EpId",nativeQuery = true)
    int deleteByEpId(Integer EpId);


/*    @Query(value = "select * from tbDqExamples where RowValue=: and OrderNum>:OrderNum",nativeQuery = true)
    List<tbDqExamples> finddeleorder(Integer RowValue,Integer OrderNum);

    @Query(value = "UPDATE tbDqExamples SET OrderNum=:xgOrderNum WHERE OrderNum=:OrderNum and RowValue=:RowValue",nativeQuery = true)
    int Updatedelhssl(Integer xgOrderNum,Integer OrderNum,Integer RowValue);*/

    @Query(value = " SELECT TOP 1 * FROM tbDqExamples order by EpId desc",nativeQuery = true)
    List<Map<String,Object>> findDqexampleszhyt();

    @Transactional
    @Modifying
    @Query(value = "delete from tbDqExamples where InId=:InId",nativeQuery = true)
    int deleteAllByInid(Integer InId);

    @Transactional
    @Modifying
    @Query(value = "UPDATE tbDqExamples SET DqExamples=:DqExamples WHERE EpId=:EpId",nativeQuery = true)
    int UpdateDqExamplesName(@Param("EpId") int EpId, @Param("DqExamples") String DqExamples);

    @Query(value = "Select max(isnull(OrderNum,0))+1 as OrderNum from tbDqExamples where UserID=:UserID and RowValue=:RowValue",nativeQuery = true)
    Integer getMax(Integer UserID,Integer RowValue);

    @Transactional
    @Modifying
    @Query(value = "UPDATE tbDqExamples SET DqExamples=:DqExamples WHERE EpId=:EpId",nativeQuery = true)
    int updateExa(@Param("DqExamples") String DqExamples,
                  @Param("EpId") Integer EpId);
}
