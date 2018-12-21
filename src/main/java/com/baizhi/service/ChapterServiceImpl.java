package com.baizhi.service;

import com.baizhi.entity.Chapter;
import com.baizhi.mapper.ChapterMapper;
import com.baizhi.util.FileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.util.UUID;

@Service
@Transactional
public class ChapterServiceImpl implements ChapterService {
    @Autowired
    private ChapterMapper chapterMapper;

    @Override
    public void insert(Chapter chapter, MultipartFile file) {
        String replace = UUID.randomUUID().toString().replace("-", "");
        chapter.setId(replace);
        String filename = file.getOriginalFilename();
        String realPath = "F:\\IDEAProject\\final\\cmfz\\src\\main\\webapp\\video";
        chapter.setUrl(filename);
        FileUpload.upLoad(realPath, filename, file);
        chapterMapper.insert(chapter);
    }
}
