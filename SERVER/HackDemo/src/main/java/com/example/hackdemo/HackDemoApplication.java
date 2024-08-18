package com.example.hackdemo;

import com.example.hackdemo.excel.ExcelService;
import com.fasterxml.jackson.databind.exc.InvalidFormatException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.io.IOException;

@SpringBootApplication
public class HackDemoApplication implements CommandLineRunner {
	@Autowired
	private ExcelService excelService;
	public static void main(String[] args) {
		SpringApplication.run(HackDemoApplication.class, args);
	}

	@Override
	public void run(String... args) {
		try {
			String restaurantFilePath = "path/to/restaurant_excel_file.xlsx";
			excelService.readAndSaveRestaurants(restaurantFilePath);

			String tourSpotFilePath = "path/to/tour_spot_excel_file.xlsx";
			excelService.readAndSaveTourSpots(tourSpotFilePath);
		} catch (InvalidFormatException e) {
			System.err.println("Invalid format in one of the Excel files: " + e.getMessage());
		} catch (IOException e) {
			System.err.println("Error reading one of the Excel files: " + e.getMessage());
		}
	}
}
