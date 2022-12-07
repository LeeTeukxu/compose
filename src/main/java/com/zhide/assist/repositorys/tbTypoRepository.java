package com.zhide.assist.repositorys;

import com.zhide.assist.models.tbTypo;
import org.apache.ibatis.annotations.Param;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;
import java.util.Optional;

@Repository
public interface tbTypoRepository extends JpaRepository<tbTypo, Integer> {
    Optional<tbTypo> findFirstByUseridAndId(Integer UserID, Integer ID);

    @Query(value = "SELECT Correct,Mistake FROM tbTypo WHERE UserID=:UserID",nativeQuery = true)
    List<Map<String,Object>> finByUID(@Param("UserID") Integer UserID);
}
