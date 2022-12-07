package com.zhide.assist.repositorys;

import com.zhide.assist.models.tbMemo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface memoRepository extends JpaRepository<tbMemo, Integer> {
    Optional<tbMemo> findFirstByProductidAndId(String AssistID, Integer ID);

    int removeAllByProductid(String productId);
    int removeAllByProductidIn(List<String> ids);
}
