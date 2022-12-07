package com.zhide.assist.repositorys;

import com.zhide.assist.models.TechBackground;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface TechBackgroundRepository extends JpaRepository<TechBackground,Integer> {
    Optional<TechBackground> findById(Integer Id);
    Optional<TechBackground> findByTechMainId(Integer TechMainID);
    int deleteAllByTechMainIdIn(List<Integer> ids);
    List<TechBackground> findAllByTechMainIdIn(List<Integer> TechMainID);
}
