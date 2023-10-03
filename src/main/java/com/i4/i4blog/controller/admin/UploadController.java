package com.i4.i4blog.controller.admin;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.UUID;

/**
 * @author 최규하
 * @deprecated 테스트후 알맞게 이동할 예정
 */
@RestController
@Slf4j
public class UploadController {
    @Value("${org.zerock.upload.path}")
    private String uploadPath;

    @PostMapping("/uploadAjax")
    public void UploadFile(MultipartFile[] uploadFiles) {

        for (MultipartFile uploadFile : uploadFiles) {
            if (!uploadFile.getContentType().startsWith("image")) {
                log.warn("this file is not image type");
                return;
            }

            // 실제 파일 이름 IE나 Edge는 전체 경로가 들어오므로
            String originalName = uploadFile.getOriginalFilename();
            String fileName = originalName
                    .substring(originalName.lastIndexOf("\\") + 1);
            log.info("fileName: {}", fileName);

            // 날짜 폴더 생성
            String folderPath = makeFolder();
            // UUID
            String uuid = UUID.randomUUID().toString();


            // 저장할 파일 이름 중간에 "_"를 이용해서 구분
            String saveName = uploadPath
                    + File.separator
                    + folderPath
                    + File.separator
                    + uuid
                    + "_" + fileName;


            Path savePath = Paths.get(saveName);

            try {
                uploadFile.transferTo(savePath);
            } catch (IOException e) {
                e.printStackTrace();
            }

        } // end of for
    }

    private String makeFolder() {

        String str = LocalDate.now()
                    .format(DateTimeFormatter.ofPattern("yyyy/MM/dd"));

        String folderPath = str.replace("/", File.separator);


        // make folder -------
        File uploadPathFolder = new File(uploadPath,folderPath);

        if (uploadPathFolder.exists() == false){
            uploadPathFolder.mkdirs();
        }
        return folderPath;
    }
}
