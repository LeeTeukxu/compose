package com.zhide.assist.repositorys;

import com.zhide.assist.models.ListDrag;
import com.zhide.assist.models.tbAssitName;
import com.zhide.assist.models.tbDigitalSign;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface tbDigitalSignRepository extends JpaRepository<tbDigitalSign,Integer> {
    Optional<tbDigitalSign> findByRowValue(Integer RowValue);
    List<tbDigitalSign> findAllByRowValue(Integer RowValue);
}
