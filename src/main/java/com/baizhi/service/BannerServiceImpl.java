package com.baizhi.service;

import com.baizhi.entity.Banner;
import com.baizhi.entity.BannerDto;
import com.baizhi.mapper.BannerMapper;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;

@Service
@Transactional
public class BannerServiceImpl implements BannerService {
    @Autowired
    private BannerMapper bannerMapper;

    @Override
    public BannerDto queryAll(int curPage, int pageSize) {
        BannerDto dto = new BannerDto();
        dto.setTotal(bannerMapper.selectCount(new Banner()));
        PageHelper.startPage(curPage, pageSize);
        List<Banner> list = bannerMapper.selectAll();
        dto.setRows(list);
        return dto;
    }

    @Override
    public void changeMessage(Banner banner) {
        bannerMapper.updateByPrimaryKey(banner);
    }

    @Override
    public void dropBanner(Integer id) {
        bannerMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void addBanner(Banner banner, MultipartFile file) {
        String filename = file.getOriginalFilename();
        banner.setImgPath("/" + filename);
        String realPath = "F:\\IDEAProject\\final\\cmfz\\src\\main\\webapp\\image";
        File desc = new File(realPath + "/" + filename);
        try {
            file.transferTo(desc);
        } catch (IOException e) {
            e.printStackTrace();
        }
        bannerMapper.insert(banner);
    }
}
