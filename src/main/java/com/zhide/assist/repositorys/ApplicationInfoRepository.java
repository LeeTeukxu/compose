package com.zhide.assist.repositorys;

import com.zhide.assist.models.TechMain;
import com.zhide.assist.models.tbAssitName;
import org.apache.ibatis.annotations.Param;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Repository
public interface ApplicationInfoRepository extends JpaRepository<TechMain,Integer> {
    Optional<TechMain> findById(Integer Id);
    int deleteAllByIdIn(List<Integer> ids);
}
