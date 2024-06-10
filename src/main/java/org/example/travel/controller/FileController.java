package org.example.travel.controller;

import jakarta.servlet.http.HttpSession;
import org.example.travel.service.FileStorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.net.MalformedURLException;
import java.nio.file.Path;

@Controller
public class FileController {
    @Autowired
    private final FileStorageService fileStorageService;

    public FileController(FileStorageService fileStorageService) {
        this.fileStorageService = fileStorageService;
    }

    // Hàm để hiển thị file ảnh
    @GetMapping("/uploads/{fileName:.+}")
    public ResponseEntity<Resource> downloadFile(@PathVariable String fileName, HttpSession session) throws MalformedURLException {
        if (session.getAttribute("user") == null) {
            return ResponseEntity.badRequest().build();
        }
        Path filePath = fileStorageService.loadFileAsResource(fileName);
        Resource resource = new UrlResource(filePath.toUri());

        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + resource.getFilename() + "\"")
                .body(resource);
    }

    // Hàm để hiển thị file ảnh
    @GetMapping("/uploads/tour/{fileName:.+}")
    public ResponseEntity<Resource> downloadFileTour(@PathVariable String fileName) throws MalformedURLException {
        Path filePath = fileStorageService.loadFileAsResource("images/tour/" + fileName);
        Resource resource = new UrlResource(filePath.toUri());

        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + resource.getFilename() + "\"")
                .body(resource);
    }

    @GetMapping("/uploads/location/{fileName:.+}")
    public ResponseEntity<Resource> downloadFileLocation(@PathVariable String fileName) throws MalformedURLException {
        // Load file as Resource at path uploads/location/
        Path filePath = fileStorageService.loadFileAsResource("images/location/" + fileName);
        Resource resource = new UrlResource(filePath.toUri());

        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + resource.getFilename() + "\"")
                .body(resource);
    }

    @GetMapping("/uploads/enterprise/{fileName:.+}")
    public ResponseEntity<Resource> downloadFileEnterprise(@PathVariable String fileName) throws MalformedURLException {
        Path filePath = fileStorageService.loadFileAsResource("images/enterprise/" + fileName);
        Resource resource = new UrlResource(filePath.toUri());

        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + resource.getFilename() + "\"")
                .body(resource);
    }
}

