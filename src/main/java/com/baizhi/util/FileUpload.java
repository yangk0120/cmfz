package com.baizhi.util;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

public class FileUpload {
    public static void upLoad(String realPath, String filename, MultipartFile file) {
        File desc = new File(realPath + "/" + filename);
        try {
            file.transferTo(desc);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
