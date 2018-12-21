package com.baizhi.service;

import com.baizhi.entity.Album;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface AlbumService {
    public List<Album> getAll();

    public Album getOne(Integer id);

    public void add(Album album, MultipartFile file);
}
