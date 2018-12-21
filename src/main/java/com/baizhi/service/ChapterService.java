package com.baizhi.service;

import com.baizhi.entity.Chapter;
import org.springframework.web.multipart.MultipartFile;

public interface ChapterService {
    public void insert(Chapter chapter, MultipartFile file);
}
