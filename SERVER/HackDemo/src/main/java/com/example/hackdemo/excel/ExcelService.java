package com.example.hackdemo.excel;

import com.example.hackdemo.enums.*;
import com.example.hackdemo.model.Area;
import com.example.hackdemo.model.Restaurant;
import com.example.hackdemo.model.TourSpot;
import com.example.hackdemo.repository.AreaRepository;
import com.example.hackdemo.repository.RestaurantRepository;
import com.example.hackdemo.repository.TourSpotRepository;
import com.fasterxml.jackson.databind.exc.InvalidFormatException;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

@Service
public class ExcelService {

    @Autowired
    private RestaurantRepository restaurantRepository;

    @Autowired
    private TourSpotRepository tourSpotRepository;

    @Autowired
    private AreaRepository areaRepository;

    public void readAndSaveRestaurants(String filePath) throws IOException, InvalidFormatException {
        FileInputStream file = new FileInputStream(new File(filePath));
        Workbook workbook = WorkbookFactory.create(file);
        Sheet sheet = workbook.getSheetAt(0);

        for (Row row : sheet) {
            if (row.getRowNum() == 0) {
                continue; // 헤더 행 건너뛰기
            }

            Restaurant restaurant = new Restaurant();
            restaurant.setName(row.getCell(0).getStringCellValue());
            restaurant.setFoodType(FoodType.valueOf(row.getCell(1).getStringCellValue().toUpperCase()));
            restaurant.setEatingAlone(EatingAlone.valueOf(row.getCell(2).getStringCellValue().toUpperCase()));
            restaurant.setHalalOrVegan(HalalOrVegan.valueOf(row.getCell(3).getStringCellValue().toUpperCase()));
            restaurant.setMichelinGuide(MichelinGuide.valueOf(row.getCell(4).getStringCellValue().toUpperCase()));
            restaurant.setAddress(row.getCell(5).getStringCellValue());
            restaurant.setMainMenu(row.getCell(6).getStringCellValue());

            String areaName = row.getCell(7).getStringCellValue();
            Area area = areaRepository.findByName(areaName);
            if (area == null) {
                area = new Area();
                area.setName(areaName);
                areaRepository.save(area);
            }
            restaurant.setArea(area);

            restaurantRepository.save(restaurant);
            workbook.close();
            file.close();
        }


}
    public void readAndSaveTourSpots (String filePath) throws IOException, InvalidFormatException {
        FileInputStream file = new FileInputStream(new File(filePath));
        Workbook workbook = WorkbookFactory.create(file);
        Sheet sheet = workbook.getSheetAt(1); // 두 번째 시트에 데이터가 있다고 가정

        for (Row row : sheet) {
            if (row.getRowNum() == 0) {
                continue; // 헤더 행 건너뛰기
            }

            TourSpot tourSpot = new TourSpot();
            tourSpot.setTheme(Theme.valueOf(row.getCell(0).getStringCellValue().toUpperCase()));
            tourSpot.setName(row.getCell(1).getStringCellValue());
            tourSpot.setAddress(row.getCell(2).getStringCellValue());

            String areaName = row.getCell(3).getStringCellValue();
            Area area = areaRepository.findByName(areaName);
            if (area == null) {
                area = new Area();
                area.setName(areaName);
                areaRepository.save(area);
            }
            tourSpot.setArea(area);

            tourSpotRepository.save(tourSpot);
        }

        workbook.close();
        file.close();
    }
}

