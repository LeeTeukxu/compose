package com.zhide.assist.repositorys;

import com.zhide.assist.models.TechMain;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface TechMainRepository extends JpaRepository<TechMain,Integer> {

    int deleteAllByIdIn(List<Integer> ids);

    List<TechMain> findAllByIdIn(List<Integer> ids);
}
