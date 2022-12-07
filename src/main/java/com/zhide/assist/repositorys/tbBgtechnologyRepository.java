package com.zhide.assist.repositorys;

import com.zhide.assist.models.tbBgtechnology;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface tbBgtechnologyRepository extends JpaRepository<tbBgtechnology,Integer> {
    Optional<tbBgtechnology> findByRowValue(Integer RowValue);
    List<tbBgtechnology> findAllByRowValue(Integer RowValue);
    int deleteAllByRowValue(Integer RowValue);
    int deleteAllByRowValueIn(List<Integer> ids);
}
