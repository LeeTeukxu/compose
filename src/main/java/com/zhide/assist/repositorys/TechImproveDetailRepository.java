package com.zhide.assist.repositorys;

import com.zhide.assist.models.TechImproveDetail;
import com.zhide.assist.models.TechImproveMain;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface TechImproveDetailRepository extends JpaRepository<TechImproveDetail,Integer> {
    Optional<TechImproveDetail> findByMainId(Integer MainID);
    Optional<TechImproveDetail> findByTinyId(Integer TinyID);
    List<TechImproveDetail> findByMainIdIn(Integer MainID);
    List<TechImproveDetail> findAllByMainIdOrderByCode(Integer MainID);
    int deleteAllByMainIdIn(List<Integer> ids);
    List<TechImproveDetail> findAllByMainIdIn(List<Integer> MainID);
}
