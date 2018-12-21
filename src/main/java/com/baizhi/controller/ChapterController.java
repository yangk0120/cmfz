package com.baizhi.controller;

import com.baizhi.entity.Chapter;
import com.baizhi.service.ChapterService;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;

@RestController
@RequestMapping("/chapter")
public class ChapterController {
    @Autowired
    private ChapterService chapterService;

    @RequestMapping("add")
    public void add(Chapter chapter, MultipartFile file) {
        chapterService.insert(chapter, file);
    }

    @RequestMapping("/download")
    public void download(String url, HttpServletResponse response) throws IOException {
        String realPath = "F:\\IDEAProject\\final\\cmfz\\src\\main\\webapp\\video";
        byte[] bs = FileUtils.readFileToByteArray(new File(realPath + "/" + url));
        response.setHeader("content-disposition", "attachment;filename=" + URLEncoder.encode(url, "utf-8"));
        ServletOutputStream outputStream = response.getOutputStream();
        outputStream.write(bs);
        if (outputStream != null) outputStream.flush();
        if (outputStream != null) outputStream.close();
    }
}
