package com.yfyk.utils.pom;


import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

public class ExcelParseToList {

	public static final String houseInfoSourceFilePath = "d:/test.xls";

	public static List<String> parseExcel() throws Exception {

		InputStream is = new FileInputStream(new File(houseInfoSourceFilePath));
		HSSFWorkbook houseInfoWBook = new HSSFWorkbook(is);
		List<String> memberList = new ArrayList<String>();
		String member = "";

		for (int i = 0; i < houseInfoWBook.getNumberOfSheets(); i++) {
			HSSFSheet sheet = houseInfoWBook.getSheetAt(i);
			if (sheet == null) {
				continue;
			}
			for (int index = 1; index <= sheet.getLastRowNum(); index++) {
				HSSFRow row = sheet.getRow(index);
				if (row != null) {

					if (!row.getCell(0).toString().trim().equals("")) {

						if(row.getCell(0).getCellType()==0){
							DecimalFormat df = new DecimalFormat("0");
							String whatYourWant = df.format(row.getCell(0).getNumericCellValue());
							//System.out.println(+ row.getCell(0).getCellType() + "whatYourWant" + row.getCell(0).toString().trim());
							member=(whatYourWant);
						}else {
							member=(row.getCell(0).getStringCellValue().trim());
							//System.out.println(+row.getCell(0).getCellType() + "whatYourWant" + row.getCell(0).toString().trim());
						}

					}

					memberList.add(member);
				}

			}
		}

		return memberList;

	}

	public static void main(String args[]) throws Exception {
		for (String member : ExcelParseToList.parseExcel()) {
			System.out.println(member);
		}
		;
	}

}
