package com.baizhi.controller;

import com.baizhi.entity.Banner;
import com.baizhi.entity.BannerDto;
import com.baizhi.service.BannerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
@RequestMapping("/banner")
public class BannerController {
    @Autowired
    private BannerService bannerService;

    @RequestMapping("/getAll")
    public BannerDto getAll(int page, int rows) {
        return bannerService.queryAll(page, rows);
    }

    @RequestMapping("/update")
    public void update(Banner banner) {
        bannerService.changeMessage(banner);
    }

    @RequestMapping("/drop")
    public void drop(Integer id) {
        bannerService.dropBanner(id);
    }

    @RequestMapping("/add")
    public void add(Banner banner, MultipartFile file) {
        bannerService.addBanner(banner, file);
    }
}
