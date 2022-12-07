package com.zhide.assist.repositorys;

import com.zhide.assist.models.TechImproveMain;
import com.zhide.assist.models.TechSubject;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface TechImproveMainRepository extends JpaRepository<TechImproveMain,Integer> {
    Optional<TechImproveMain> findByTechMainId(Integer TechMainID);
    Optional<TechImproveMain> findBySubId(Integer SubID);
    int deleteAllByTechMainIdIn(List<Integer> ids);
    List<TechImproveMain> getAllByTechMainIdIn(List<Integer> ids);
}
