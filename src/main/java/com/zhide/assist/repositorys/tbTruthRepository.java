package com.zhide.assist.repositorys;

import com.zhide.assist.models.tbMemo;
import com.zhide.assist.models.tbTruth;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface tbTruthRepository extends JpaRepository<tbTruth, Integer> {

    Optional<tbTruth> findAllByTechMainId(Integer TechMainID);
    List<tbTruth> findAllByTechMainIdIn(List<Integer> ids);
    List<tbTruth> findAllByTruthIdIn(List<Integer> ids);

    int deleteAllByTechMainIdIn(List<Integer> ids);
}
