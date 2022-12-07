package com.zhide.assist.repositorys;

import com.zhide.assist.models.tbAssitName;
import com.zhide.assist.models.tbTechnicalField;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface tbTechnicalFieldRepository extends JpaRepository<tbTechnicalField,Integer> {
    List<tbTechnicalField> findAllByRowValue(Integer RowValue);
    Optional<tbTechnicalField> findByRowValue(Integer RowValue);
    int deleteAllByRowValue(Integer RowValue);
    int deleteAllByRowValueIn(List<Integer> ids);
}
