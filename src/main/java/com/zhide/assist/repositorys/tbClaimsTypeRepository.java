package com.zhide.assist.repositorys;

import com.zhide.assist.models.tbClaimsType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface tbClaimsTypeRepository extends JpaRepository<tbClaimsType,Integer> {

/*    @Transactional
    @Modifying
    @Query(value = "UPDATE tbAssitName SET UpdateTime=:UpdateTime WHERE ID=:ID",nativeQuery = true)
    int UpdateTime(@Param("UpdateTime") Date UpdateTime,
                   @Param("ID") Integer ID);*/
   /*@Query(value = "select * FROM tbIndependence WHERE UserID=:UserID and RowValue=:RowValue  ORDER BY DqExclusiveorder",nativeQuery = true)
   List<tbClaimsType> findAll();*/

}
