package com.zhide.assist.repositorys;

import com.zhide.assist.models.tbAbstractAttached;
import com.zhide.assist.models.tbInstruction;
import org.apache.ibatis.annotations.Param;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;

@Repository
public interface tbInstructionRepository extends JpaRepository<tbInstruction,Integer> {
    Optional<tbInstruction> findByRowValue(Integer RowValue);
    List<tbInstruction> findAllByRowValue(Integer RowValue);
    int deleteAllByRowValue(Integer RowValue);
    int deleteAllByRowValueIn(List<Integer> ids);
}
