package com.i4.i4blog.controller.admin;

import com.i4.i4blog.dto.admin.UploadResponseDTO;
import com.i4.i4blog.dto.admin.UploadResultDTO;
import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnailator;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;


@RestController
@Slf4j
public class UploadController {
    private String uploadPath = "src/main/resources/static";


    /**
     * @param h           썸네일 이미지 높이
     * @param w           썸네일 이미지 넓이
     * @param uploadFiles 이미지파일
     * @param type        업로드 타입
     * @return UploadResponseDTO
     * @author 최규하
     */
    @PreAuthorize("isAuthenticated()")
    @PostMapping("/upload-img")
    public ResponseEntity<?> uploadFile(
            @RequestParam("uploadFiles") MultipartFile[] uploadFiles
            , @RequestParam("w") Integer w
            , @RequestParam("h") Integer h
            , @RequestParam("type") String type) {
        List<UploadResultDTO> resultDTOList = new ArrayList<>();

        UploadResponseDTO uploadResponseDTO = null;
        for (MultipartFile uploadFile : uploadFiles) {
            if (!uploadFile.getContentType().startsWith("image")) {
                log.warn("this file is not image type");
                return new ResponseEntity<>(HttpStatus.FORBIDDEN);
            }

            // 실제 파일 이름 IE나 Edge는 전체 경로가 들어오므로
            String originalName = uploadFile.getOriginalFilename();
            String fileName = originalName
                    .substring(originalName.lastIndexOf("\\") + 1);
            log.info("fileName: {}", fileName);

            // 날짜 폴더 생성
            String folderPath = makeFolder(type);
            // UUID
            String uuid = UUID.randomUUID().toString();


            // 저장할 파일 이름 중간에 "_"를 이용해서 구분
            String saveName = uploadPath
                    + File.separator
                    + type
                    + File.separator
                    + folderPath
                    + File.separator
                    + uuid
                    + "_" + fileName;

            log.info("저장된 파일 경로 : {} ", saveName);
            Path savePath = Paths.get(saveName);
            uploadResponseDTO = null;
            try {
                //원본 파일 저장
                uploadFile.transferTo(savePath);
                //섬네일 생성
                String thumbnailSaveName = uploadPath + File.separator + type + File.separator + folderPath + File.separator
                        + "s_" + uuid + "_" + fileName;
                String thumbnailSaveDB = File.separator + type + File.separator + folderPath + File.separator
                        + "s_" + uuid + "_" + fileName;
                String saveNameDB = File.separator
                        + type
                        + File.separator
                        + folderPath
                        + File.separator
                        + uuid
                        + "_" + fileName;
                //섬네일 파일 이름은 중간에 s_로 시작하도록
                File thumbnailFile = new File(thumbnailSaveName);
                Thumbnailator.createThumbnail(savePath.toFile(), thumbnailFile
                        , w
                        , h);

                resultDTOList.add(new UploadResultDTO(fileName, uuid, folderPath));
                uploadResponseDTO = UploadResponseDTO.builder()
                        .uploadResultDTOList(resultDTOList)
                        .thumbnailURL(thumbnailSaveDB)
                        .originalURL(saveNameDB).build();
                
            } catch (IOException e) {
                e.printStackTrace();
            }


        } // end of for
        return new ResponseEntity<>(uploadResponseDTO, HttpStatus.OK);
    }

    @GetMapping("/display")
    public ResponseEntity<byte[]> getFile(String fileName) {

        ResponseEntity<byte[]> result = null;

        try {

            String srcFileName = URLDecoder.decode(fileName, "UTF-8");

            log.info("fileName: {}", srcFileName);
            File file = new File(uploadPath + File.separator + srcFileName);

            log.info("file: {}", file);

            HttpHeaders header = new HttpHeaders();

            // MIME 타입 처리
            header.add("Content-Type", Files.probeContentType(file.toPath()));

            // 파일 데이터 처리
            result = new ResponseEntity<>(FileCopyUtils
                    .copyToByteArray(file), header, HttpStatus.OK);

        } catch (Exception e) {
            log.error(e.getMessage());
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return result;


    }

//    @PostMapping("/uploadAjax")
//    public ResponseEntity<List<UploadResultDTO>> uploadFile(MultipartFile[] uploadFiles) {
//        List<UploadResultDTO> resultDTOList = new ArrayList<>();
//
//        for (UploadResultDTO uploadFile : resultDTOList) {
//            if (!uploadFile.getFileName().startsWith("image")) {
//                return new ResponseEntity<>(HttpStatus.FORBIDDEN);
//            }
//
//            String originalName
//
//        }
//
//
//        return null;
//    }


    private String makeFolder(String type) {

        String str = LocalDate.now()
                .format(DateTimeFormatter.ofPattern("yyyy/MM/dd"));

        String folderPath = str.replace("/", File.separator);


        // make folder -------
        File uploadPathFolder = new File(uploadPath, type + "/" + folderPath);

        if (uploadPathFolder.exists() == false) {
            uploadPathFolder.mkdirs();
        }
        return folderPath;
    }
}
