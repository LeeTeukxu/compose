package com.zhide.assist.services.implement;

import com.zhide.assist.configs.IndexActionInterceptor;
import com.zhide.assist.models.tbMenuList;
import com.zhide.assist.models.tbTruthMenuList;
import com.zhide.assist.repositorys.tbMenuListRepository;
import com.zhide.assist.repositorys.tbTruthMenuListRepository;
import com.zhide.assist.services.define.ItbMenuListService;
import org.apache.logging.log4j.util.Strings;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.awt.*;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class tbMenuListServiceImpl implements ItbMenuListService {

    @Autowired
    tbMenuListRepository tbMenuListRepository;

    @Autowired
    tbTruthMenuListRepository tbTruthMenuListRepository;

    public List<tbMenuList> getAllByCanUse() throws Exception {
        List<tbMenuList> menus = tbMenuListRepository.findAllByCanUseTrueOrderBySn();
        int count = menus.size();
        for (int i = 0; i < count; i++) {
            tbMenuList item = menus.get(i);
            String url = item.getUrl();
            if (StringUtils.isEmpty(url)) continue;
            if (url.indexOf("?") > -1) {
                String[] texts = url.split("\\?");
                String baseUrl = texts[0];
                String paramters = texts[1];
                String newParamter = urlDecode(paramters);
                item.setUrl(baseUrl + "?" + newParamter);
            }
        }
        return menus;
    }

    public List<tbTruthMenuList> getTruthAllByCanUse() throws Exception {
        List<tbTruthMenuList> menus = tbTruthMenuListRepository.findAllByCanUseTrueOrderBySn();
        int count = menus.size();
        for (int i = 0; i < count; i++) {
            tbTruthMenuList item = menus.get(i);
            String url = item.getUrl();
            if (StringUtils.isEmpty(url)) continue;
            if (url.indexOf("?") > -1) {
                String[] texts = url.split("\\?");
                String baseUrl = texts[0];
                String paramters = texts[1];
                String newParamter = urlDecode(paramters);
                item.setUrl(baseUrl + "?" + newParamter);
            }
        }
        return menus;
    }

    @Override
    public List<tbMenuList> getVisibleMenus() {
        List<tbMenuList> res = new ArrayList<>();
        List<tbMenuList> menus = null;
        List<Integer> allMenus = new ArrayList<>();
        try {
            menus = getAllByCanUse();
        } catch (Exception e) {
            e.printStackTrace();
        }
        List<Integer> noPages = menus.stream()
                .filter(f -> StringUtils.isEmpty(f.getPageName()) == false && StringUtils.isEmpty(f.getUrl()) == false)
                .map(x -> x.getFid())
                .collect(Collectors.toList());
        allMenus.addAll(noPages);
        for (int i = 0; i < allMenus.size(); i++) {
            Integer MenuID = allMenus.get(i);
            Optional<tbMenuList> Fx = menus.stream().filter(f -> f.getFid().equals(MenuID)).findFirst();
            if (Fx.isPresent()){
                tbMenuList F = Fx.get();
                res.add(F);
//                Optional<tbMenuList> FPS = menus.stream().filter(f -> f.getFid().equals(F.getFid())).findFirst();
//                if (FPS.isPresent()){
//                    tbMenuList P = FPS.get();
//                    List<tbMenuList> ps = res.stream().filter(f -> f.getFid().equals(P.getFid())).collect(Collectors.toList());
//                    if (ps.size() > 0){
//                        res.add(P);
//                    }
//                }
            }
        }
        res.sort((a,b) -> Integer.compare(Integer.parseInt(a.getSn()), Integer.parseInt(b.getSn())));
        return res;
    }

    @Override
    public List<tbTruthMenuList> getVisibleTruthMenus() {
        List<tbTruthMenuList> res = new ArrayList<>();
        List<tbTruthMenuList> menus = null;
        List<Integer> allMenus = new ArrayList<>();
        try {
            menus = getTruthAllByCanUse();
        } catch (Exception e) {
            e.printStackTrace();
        }
        List<Integer> noPages = menus.stream()
                .filter(f -> StringUtils.isEmpty(f.getPageName()) == false && StringUtils.isEmpty(f.getUrl()) == false)
                .map(x -> x.getFid())
                .collect(Collectors.toList());
        allMenus.addAll(noPages);
        for (int i = 0; i < allMenus.size(); i++) {
            Integer MenuID = allMenus.get(i);
            Optional<tbTruthMenuList> Fx = menus.stream().filter(f -> f.getFid().equals(MenuID)).findFirst();
            if (Fx.isPresent()){
                tbTruthMenuList F = Fx.get();
                res.add(F);
            }
        }
        res.sort((a,b) -> Integer.compare(Integer.parseInt(a.getSn()), Integer.parseInt(b.getSn())));
        return res;
    }

    private String urlDecode(String paramText) throws UnsupportedEncodingException {
        String[] VS = paramText.split("&");
        List<String> ps = new ArrayList<>();
        for (int i = 0; i < VS.length; i++) {
            String V = VS[i];
            String[] values = V.split("=");
            String newText = values[0] + '=' + URLEncoder.encode(values[1], "utf-8");
            ps.add(newText);
        }
        return Strings.join(ps, '&');
    }
}
