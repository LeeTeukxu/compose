package com.zhide.assist.services.define;

import com.zhide.assist.models.LoginUserInfo;
import com.zhide.assist.models.tbIndependence;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import com.zhide.assist.models.tbDqExamples;

import java.util.List;
import java.util.Map;
import java.util.Optional;

@Service
public interface ItbDqExamplesService {

      void UpdateDqExamplesName(int EpId, String DqExamples);
      tbDqExamples Save(tbDqExamples tbDqExamples);
      void deleteByEpId(Integer EpId);
}
