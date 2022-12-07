package com.zhide.assist.repositorys;

import com.zhide.assist.models.tbTemplate;
import io.lettuce.core.dynamic.annotation.Param;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import javax.swing.text.html.Option;
import javax.transaction.Transactional;
import java.util.Collection;
import java.util.List;
import java.util.Optional;

@Repository
public interface tbTemplateRepository extends JpaRepository<tbTemplate, Integer> {
    tbTemplate findAllById(Integer Id);

    @Modifying
    @Transactional
    @Query(value = "UPDATE tbTemplate set IsShare=:IsShare where ID in (:collection)")
    int update(@Param("IsShare") Integer IsShare, @Param("collection") Collection<Integer> collection);

}
