package com.zhide.assist.repositorys;

import com.zhide.assist.models.tbAssitName;
import org.apache.ibatis.annotations.Param;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Repository
public interface tbAssistNameRepository extends JpaRepository<tbAssitName,Integer> {
    List<tbAssitName> findAllById(Integer Id);
    Optional<tbAssitName> findById(Integer Id);
    tbAssitName getById(Integer Id);
    List<tbAssitName> findAllByIdIn(List<Integer> ids);
    int deleteAllByIdIn(List<Integer> ids);

    @Transactional
    @Modifying
    @Query(value = "UPDATE tbAssitName SET UpdateTime=:UpdateTime WHERE ID=:ID",nativeQuery = true)
    int UpdateTime(@Param("UpdateTime") Date UpdateTime,
                   @Param("ID") Integer ID);

    @Query(value = "SELECT TemplateID from tbAssitName where ID=:ID",nativeQuery = true)
    int findbyId(@Param("ID") Integer ID);


    @Transactional
    @Modifying
    @Query(value = "UPDATE tbAssitName SET Fontsize=:Fontsize WHERE ID=:ID",nativeQuery = true)
    int UpdateFontsize(@Param("Fontsize") Integer Fontsize,
                    @Param("ID") Integer ID);

}
