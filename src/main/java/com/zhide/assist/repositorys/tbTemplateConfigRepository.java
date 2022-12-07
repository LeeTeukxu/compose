package com.zhide.assist.repositorys;

import com.zhide.assist.models.tbTemplate;
import com.zhide.assist.models.tbTemplateConfig;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface tbTemplateConfigRepository extends JpaRepository<tbTemplateConfig,Integer> {
    List<tbTemplateConfig> findAllByTemplateId(Integer TemplateID);

    int deleteAllByTemplateId(Integer TemplateID);
}
