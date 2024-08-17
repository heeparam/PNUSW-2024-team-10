//package com.example.hackdemo.Excel;
//
//import com.example.hackdemo.model.Restaurant;
//import com.example.hackdemo.repository.RestaurantRepository;
//import org.apache.poi.ss.usermodel.Row;
//import org.apache.poi.ss.usermodel.Sheet;
//import org.apache.poi.ss.usermodel.Workbook;
//import org.apache.poi.xssf.usermodel.XSSFWorkbook;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//import org.springframework.web.multipart.MultipartFile;
//
//import java.io.IOException;
//
//@Service
//public class ExcelService {
//
//    @Autowired
//    private RestaurantRepository restaurantRepository;
//
//    public void saveRestaurant(MultipartFile file) throws IOException {
//        Workbook workbook = new XSSFWorkbook(file.getInputStream());
//        Sheet sheet = workbook.getSheetAt(0);
//        for (Row row : sheet) {
//            if (row.getRowNum() == 0) {
//                continue; // skip header row
//            }
//            Restaurant restaurant = new Restaurant();
//            restaurant.setName(row.getCell(0).getStringCellValue());
//            restaurant.setAddress(row.getCell(1).getStringCellValue());
//            restaurant.setMainMenu(row.getCell(2).getStringCellValue());
//            restaurantRepository.save(restaurant);
//        }
//        workbook.close();
//    }
//
//    public void saveTourSpot(MultipartFile file) throws IOException {
//        Workbook workbook = new XSSFWorkbook(file.getInputStream());
//        Sheet sheet = workbook.getSheetAt(0);
//        for (Row row : sheet) {
//            if (row.getRowNum() == 0) {
//                continue; // skip header row
//            }
//            Restaurant restaurant = new Restaurant();
//            restaurant.setName(row.getCell(0).getStringCellValue());
//            restaurant.setAddress(row.getCell(1).getStringCellValue());
//            restaurant.setMainMenu(row.getCell(2).getStringCellValue());
//            restaurantRepository.save(restaurant);
//        }
//        workbook.close();
//    }
//
//    public void saveRestaurant(MultipartFile file) throws IOException {
//        Workbook workbook = new XSSFWorkbook(file.getInputStream());
//        Sheet sheet = workbook.getSheetAt(0);
//        for (Row row : sheet) {
//            if (row.getRowNum() == 0) {
//                continue; // skip header row
//            }
//            Restaurant restaurant = new Restaurant();
//            restaurant.setName(row.getCell(0).getStringCellValue());
//            restaurant.setAddress(row.getCell(1).getStringCellValue());
//            restaurant.setMainMenu(row.getCell(2).getStringCellValue());
//            restaurantRepository.save(restaurant);
//        }
//        workbook.close();
//    }
//}