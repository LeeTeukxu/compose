package com.zhide.assist.repositorys;

import com.zhide.assist.models.TechMain;
import com.zhide.assist.models.TechSubject;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface TechSubjectRepository extends JpaRepository<TechSubject,Integer> {
    Optional<TechSubject> findById(Integer Id);
    Optional<TechSubject> findByTechMainId(Integer TechMainID);
    int deleteAllByTechMainIdIn(List<Integer> ids);
    List<TechSubject> findAllByTechMainIdIn(List<Integer> TechMainID);
}
