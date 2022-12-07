package com.zhide.assist.repositorys;

import com.zhide.assist.models.tbMenuList;
import com.zhide.assist.models.tbTruthMenuList;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface tbTruthMenuListRepository extends JpaRepository<tbTruthMenuList,Integer> {
    List<tbTruthMenuList> findAllByCanUseTrueOrderBySn();

    @Query(value = "Select Title from tbTruthMenuList  Where FID=:Fid",nativeQuery = true)
    String getTitleByFid(Integer Fid);
}
