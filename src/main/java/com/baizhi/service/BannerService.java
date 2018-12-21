package com.baizhi.service;

import com.baizhi.entity.Banner;
import com.baizhi.entity.BannerDto;
import org.springframework.web.multipart.MultipartFile;

public interface BannerService {
    public BannerDto queryAll(int curPage, int pageSize);

    public void changeMessage(Banner banner);

    public void dropBanner(Integer id);

    public void addBanner(Banner banner, MultipartFile file);
}
