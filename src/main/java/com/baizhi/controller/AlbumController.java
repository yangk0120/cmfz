package com.baizhi.controller;

import com.baizhi.entity.Album;
import com.baizhi.service.AlbumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@RestController
@RequestMapping("/album")
public class AlbumController {
    @Autowired
    private AlbumService albumService;

    @RequestMapping("/getAll")
    public List<Album> getAll() {
        List<Album> list = albumService.getAll();
        return list;
    }

    @RequestMapping("/getOne")
    public Album getOne(Integer id) {

        return albumService.getOne(id);
    }

    @RequestMapping("/add")
    public void add(Album album, MultipartFile file) {
        albumService.add(album, file);
    }
}
