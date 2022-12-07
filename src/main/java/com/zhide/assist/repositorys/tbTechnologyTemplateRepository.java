package com.zhide.assist.repositorys;

import com.zhide.assist.models.tbTechnologyTemplate;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface tbTechnologyTemplateRepository extends JpaRepository<tbTechnologyTemplate, Integer> {
    tbTechnologyTemplate findAllByTechnologyId(Integer TechnologyID);
}
