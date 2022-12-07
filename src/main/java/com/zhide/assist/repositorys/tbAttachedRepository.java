package com.zhide.assist.repositorys;

import com.zhide.assist.models.ListDrag;
import com.zhide.assist.models.tbAttached;
import org.apache.ibatis.annotations.Param;
import org.omg.CORBA.INTERNAL;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Repository
public interface tbAttachedRepository extends JpaRepository<tbAttached,Integer> {
    List<tbAttached> getAllByRowValueOrderBySort(Integer RowValue);
    List<tbAttached> getAllByRowValueAndTypeOrderBySort(Integer RowValue, String Type);
    List<tbAttached> findAllByRowValue(Integer RowValue);
    List<tbAttached> findAllByRowValueIn(List<Integer> ids);
    List<tbAttached> getAllByRowValueAndType(Integer RowValue, String Type);
    tbAttached getAllBySortAndRowValue(Integer Sort,Integer RowValue);
    tbAttached getAllByAttIdAndRowValue(String AttID, Integer RowValue);
    tbAttached getAllByPathAndRowValue(String AttID, Integer RowValue);
    int deleteAllByRowValue(Integer RowValue);
    int deleteAllByRowValueIn(List<Integer> ids);
    int deleteAllBySortAndRowValue(Integer Sort,Integer RowValue);
    int deleteAllByAttIdAndRowValue(String AttID,Integer RowValue);
    int deleteAllByPathAndRowValue(String Path,Integer RowValue);
    Optional<tbAttached> findFirstByAttId(String AttID);
    void deleteAllByAttId(String AttID);
    Optional<tbAttached> findAllByAttIdAndType(String AttID, String Type);

    @Query(value = "SELECT MAX(ISNULL(Sort,0))+ 1 AS Sort FROM tbAttached WHERE RowValue=:RowValue",nativeQuery = true)
    Integer getMaxSortByRowValue(Integer RowValue);

    @Query(value = "SELECT Sort FROM tbAttached WHERE RowValue=:RowValue AND Sort>:Sort",nativeQuery = true)
    List<Integer> getSortByRowValueANDSort(String RowValue,Integer Sort);

    @Transactional
    @Modifying
    @Query(value = "UPDATE tbAttached SET Sort=:upSort,CnSort=:CnSort WHERE RowValue=:RowValue AND Sort=:Sort",nativeQuery = true)
    int updateSortByRowValue(@Param("upSort") Integer upSort,
                         @Param("CnSort") String CnSort,
                         @Param("RowValue") Integer RowValue,
                         @Param("Sort") Integer Sort);

    @Transactional
    @Modifying
    @Query(value = "UPDATE tbAttached SET PictureDescription=:PictureDescription WHERE AttID=:AttID",nativeQuery = true)
    int UpdatePictureDescription(@Param("PictureDescription") String PictureDescription,
                                 @Param("AttID") String AttID);

    @Transactional
    @Modifying
    @Query(value = "UPDATE tbAttached SET Path=:Path WHERE AttID=:AttID",nativeQuery = true)
    int UpdatePathByAttID(@Param("Path") String Path,
                          @Param("AttID") String AttID);
}
