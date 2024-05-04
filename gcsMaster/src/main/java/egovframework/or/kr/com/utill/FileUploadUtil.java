package egovframework.or.kr.com.utill;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.UUID;

public class FileUploadUtil {

    public static String[][] uploadFiles(MultipartFile[] files, String uploadDir) {
        // 현재 날짜 정보를 가져옴
        Calendar cal = Calendar.getInstance();
        int year = cal.get(Calendar.YEAR);
        int month = cal.get(Calendar.MONTH) + 1; // 월은 0부터 시작하므로 1을 더함
        int day = cal.get(Calendar.DAY_OF_MONTH);

        // 경로가 존재하지 않으면 생성
        File uploadDirFile = new File(uploadDir + "/" + year + "/" + month + "/" + day);
        if (!uploadDirFile.exists()) {
            uploadDirFile.mkdirs();
        }

        String[][] uploadedFilesInfo = new String[files.length][2];

        for (int i = 0; i < files.length; i++) {
            MultipartFile file = files[i];
            if (file.isEmpty()) {
                continue; // 파일이 비어있으면 다음 파일 처리
            }
            try {
                // 파일 저장 경로와 파일명 설정
                String originalFilename = file.getOriginalFilename();
                String savedFileName = generateUniqueFileName(originalFilename);
                File destFile = new File(uploadDirFile, savedFileName);
                // 파일을 지정한 경로에 저장
                file.transferTo(destFile);
                // 업로드된 파일의 경로와 파일명을 배열에 저장
                uploadedFilesInfo[i][0] = originalFilename; // 오리지널 파일명
                uploadedFilesInfo[i][1] = destFile.getAbsolutePath(); // 저장된 파일 경로
            } catch (IOException e) {
                // 파일 업로드 중 예외 발생 시 처리
                e.printStackTrace();
            }
        }

        return uploadedFilesInfo;
    }

    private static String generateUniqueFileName(String originalFileName) {
        // UUID를 사용하여 고유한 파일명 생성
        String uuid = UUID.randomUUID().toString();
        // 파일 확장자 추출
        String extension = originalFileName.substring(originalFileName.lastIndexOf("."));
        // UUID와 확장자를 조합하여 고유한 파일명 생성
        return uuid + extension;
    }
}
