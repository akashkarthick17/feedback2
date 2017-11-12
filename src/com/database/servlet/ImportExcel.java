package com.database.servlet;

import com.list.servlet.CreateYear;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Akash on 04-09-2017.
 */

public class ImportExcel extends HttpServlet {


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String year= (String)request.getAttribute("year");
        String sem= (String) request.getAttribute("sem");
       String Location= (String) request.getAttribute("fileLocation");
       String fileName= (String) request.getAttribute("fileName");

        readExcel(response, Location,fileName,0,sem,year);

        response.sendRedirect("dashboard.jsp");



    }
    public static void readExcel(HttpServletResponse response,String filePath,String fileName,int sheetIndex,String sem,String year) throws IOException{

        PrintWriter out = response.getWriter();
        //Create an object of File class to open xlsx file

        List<CreateYear> feedbackList = new ArrayList<>();

        File file =    new File(filePath+"\\"+fileName);

        //Create an object of FileInputStream class to read excel file

        FileInputStream inputStream = new FileInputStream(file);

        Workbook guru99Workbook = null;

        //Find the file extension by splitting file name in substring  and getting only extension name

        String fileExtensionName = fileName.substring(fileName.indexOf("."));

        //Check condition if the file is xlsx file

        if(fileExtensionName.equals(".xlsx")){

            //If it is xlsx file then create object of XSSFWorkbook class

            guru99Workbook = new XSSFWorkbook(inputStream);

        }

        //Check condition if the file is xls file

        else if(fileExtensionName.equals(".xls")){

            //If it is xls file then create object of XSSFWorkbook class

            guru99Workbook = new HSSFWorkbook(inputStream);

        }

        //Read sheet inside the workbook by its name

        Sheet guru99Sheet = guru99Workbook.getSheetAt(sheetIndex);

        //Find number of rows in excel file

        int rowCount = guru99Sheet.getLastRowNum()-guru99Sheet.getFirstRowNum();

        //Create a loop over all the rows of excel file to read it

        for (int i = 1; i < rowCount+1; i++) {

            Row row = guru99Sheet.getRow(i);

            CreateYear createYear = new CreateYear();


            String ug = ""+row.getCell(0);
            String branch = ""+row.getCell(1);
            String semester = ""+row.getCell(2);
            String section = ""+row.getCell(3);
            String subCode = ""+row.getCell(4);
            String staffName = ""+row.getCell(5);
            String subName = ""+row.getCell(6);


            if(!ug.equals("null") && !branch.equals("null") && !semester.equals("null") && !section.equals("null") && !subCode.equals("null")  && !staffName.equals("null") && !subName.equals("null")) {


                //Create a loop to print cell values in a row

                createYear.setDegree("" + row.getCell(0));
                createYear.setBranch("" + row.getCell(1));
                createYear.setSemester((long) Double.parseDouble("" + row.getCell(2)));
                createYear.setSection("" + row.getCell(3));
                createYear.setSubjectCode("" + row.getCell(4));
                createYear.setStaffName("" + row.getCell(5));
                createYear.setSubjectName("" + row.getCell(6));
                createYear.setYear("" + year);
                createYear.setSemtype("" + sem);


                feedbackList.add(createYear);

            }



        }

        CRUDManager.insert(feedbackList,year);



    }

}
