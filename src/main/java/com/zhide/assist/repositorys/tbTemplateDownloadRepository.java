package com.zhide.assist.repositorys;

import com.zhide.assist.models.tbTemplateDownload;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface tbTemplateDownloadRepository extends JpaRepository<tbTemplateDownload,Integer> {

}
