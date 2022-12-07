package com.zhide.assist.services.define;

import com.zhide.assist.models.tbAttached;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface IDrawingSpecificationService {
    List<tbAttached> DragSort(List<String> listAttID, String Type, String RowValue) throws Exception;

    tbAttached SubmitDrawing(@RequestParam("file") MultipartFile file, String des, String cnsort) throws Exception;
    tbAttached SubmitReplaceDrawing(@RequestParam("file") MultipartFile file, String AttID) throws Exception;
}
