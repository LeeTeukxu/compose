package com.zhide.assist.repositorys;

import com.zhide.assist.models.tbAbstractAttached;
import com.zhide.assist.models.tbAttached;
import org.apache.ibatis.annotations.Param;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;

@Repository
public interface tbAbstractAttachedRepository extends JpaRepository<tbAbstractAttached,Integer> {
    Optional<tbAbstractAttached> findByRowValue(Integer RowValue);
    List<tbAbstractAttached> findAllByRowValue(Integer RowValue);
    int deleteAllByRowValue(Integer RowValue);
    int deleteAllByRowValueIn(List<Integer> ids);
    tbAbstractAttached findAllByAttidAndRowValue(String AttID, Integer RowValue);

    int deleteAllByAttidAndRowValue(String AttID,Integer RowValue);
}
