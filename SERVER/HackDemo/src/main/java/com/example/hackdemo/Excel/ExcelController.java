//package com.example.hackdemo.Excel;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.http.HttpStatus;
//import org.springframework.http.ResponseEntity;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.RestController;
//import org.springframework.web.multipart.MultipartFile;
//
//@RestController
//@RequestMapping("/api/excel")
//public class ExcelController {
//
//    @Autowired
//    private ExcelService excelService;
//
//    @PostMapping("/upload")
//    public ResponseEntity<String> uploadExcelFile(@RequestParam("file") MultipartFile file) {
//        try {
//            excelService.saveExcelData(file);
//            return new ResponseEntity<>("File uploaded and data saved successfully", HttpStatus.OK);
//        } catch (Exception e) {
//            return new ResponseEntity<>("Failed to upload and save data: " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
//        }
//    }
//}