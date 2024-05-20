package org.example.travel.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.Objects;
import java.util.UUID;

@Service
public class FileStorageService {

    private final Path fileStorageLocation;

    public FileStorageService(@Value("${file.upload-dir}") String uploadDir) {
        this.fileStorageLocation = Paths.get(uploadDir)
                .toAbsolutePath().normalize();

        try {
            Files.createDirectories(this.fileStorageLocation);
        } catch (Exception ex) {
            throw new RuntimeException("Could not create the directory where the uploaded files will be stored.", ex);
        }
    }

    public String storeFile(MultipartFile file) {
        //
        String originalFileName = StringUtils.cleanPath(Objects.requireNonNull(file.getOriginalFilename()));
        String fileExtension = "";

        try {
            // Giải nén tên file
            int i = originalFileName.lastIndexOf('.');
            if (i > 0) {
                fileExtension = originalFileName.substring(i + 1);
            }

            // Khởi tạo tên file mới
            String newFileName = UUID.randomUUID().toString() + "." + fileExtension;

            // Sao chép file vào thư mục lưu trữ
            Path targetLocation = this.fileStorageLocation.resolve(newFileName);
            Files.copy(file.getInputStream(), targetLocation, StandardCopyOption.REPLACE_EXISTING);

            return newFileName;
        } catch (IOException ex) {
            throw new RuntimeException("Could not store file " + originalFileName + ". Please try again!", ex);
        }
    }

    public String storeFile(MultipartFile file, String fileName, String uploadDir) {
        String originalFileName = StringUtils.cleanPath(Objects.requireNonNull(file.getOriginalFilename()));
        String fileExtension = "";

        try {
            // Giải nén tên file
            int i = originalFileName.lastIndexOf('.');
            if (i > 0) {
                fileExtension = originalFileName.substring(i + 1);
            }

            // Khởi tạo tên file mới
            String newFileName = fileName;

            // Sao chép file vào thư mục lưu trữ
            Path targetLocation = this.fileStorageLocation.resolve(uploadDir).resolve(newFileName);
            Files.copy(file.getInputStream(), targetLocation, StandardCopyOption.REPLACE_EXISTING);

            return newFileName;
        } catch (IOException ex) {
            throw new RuntimeException("Could not store file " + originalFileName + ". Please try again!", ex);
        }
    }

    public Path loadFileAsResource(String fileName) {
        try {
            return this.fileStorageLocation.resolve(fileName).normalize();
        } catch (Exception ex) {
            throw new RuntimeException("File not found " + fileName, ex);
        }
    }


    public String generateRandomName(String originalName) {
        String fileExtension = "";
        int i = originalName.lastIndexOf('.');
        if (i > 0) {
            fileExtension = originalName.substring(i + 1);
        }
        return UUID.randomUUID().toString() + "." + fileExtension;
    }
}

