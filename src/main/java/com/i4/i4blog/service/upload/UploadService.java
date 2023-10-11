package com.i4.i4blog.service.upload;

import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.File;
import java.util.List;

@Service
@Slf4j
public class UploadService {

	@Value("${org.zerock.upload.path}")
	private String path ;
    private static final String USER_DIR = System.getProperty("user.dir");

    public void imgRemove(List<String> images) throws IllegalAccessException {
        for (int i = 0; i < images.size(); i++) {

            String path = USER_DIR + this.path+images.get(i);
            log.info("삭제 파일 경로 : {}",path);
            File file = new File(path);
            if (file.exists()) {
                file.delete();
            } else {
                log.info((i + 1) + "번 째 파일이 존재 하지 않습니다.");
            }
        }


    }
}
