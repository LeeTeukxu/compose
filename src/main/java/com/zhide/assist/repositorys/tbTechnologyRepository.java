package com.zhide.assist.repositorys;

import com.zhide.assist.models.tbTechnology;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface tbTechnologyRepository extends JpaRepository<tbTechnology, Integer> {
    @Query(value = "SELECT MAX(ISNULL(TechnologyID,0))+1 AS Num FROM tbTechnology", nativeQuery = true)
    Integer getMax();

    List<tbTechnology> findAllByTechnologyId(int TechnologyId);
}
