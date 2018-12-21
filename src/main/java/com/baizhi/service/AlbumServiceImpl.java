package com.baizhi.service;

import com.baizhi.entity.Album;
import com.baizhi.mapper.AlbumMapper;
import com.baizhi.util.FileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Service
@Transactional
public class AlbumServiceImpl implements AlbumService {
    @Autowired
    private AlbumMapper albumMapper;

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public List<Album> getAll() {
        return albumMapper.queryAll();
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public Album getOne(Integer id) {
        return albumMapper.selectByPrimaryKey(id);
    }

    @Override
    public void add(Album album, MultipartFile file) {
        String filename = file.getOriginalFilename();
        album.setCoverImg("/" + filename);
        String realPath = "F:\\IDEAProject\\final\\cmfz\\src\\main\\webapp\\albumImage";
        FileUpload.upLoad(realPath, filename, file);
        albumMapper.insert(album);
    }
}
