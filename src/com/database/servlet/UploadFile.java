package com.database.servlet;

import com.oreilly.servlet.MultipartRequest;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;

/**
 * Created by Akash on 03-09-2017.
 */

public class UploadFile extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();


        boolean isMultiPart= ServletFileUpload.isMultipartContent(request); // find the request object enctype

        String uploadDirectory="c:/files"; // location to upload the file

        FileItemFactory fileFactory = new DiskFileItemFactory(100,new File(uploadDirectory)); //100 is the bytes to hold in memory beyond which write the file to the directory mentioned.

        ServletFileUpload serFileUpload = new ServletFileUpload(fileFactory); //commons API to handle multipart encoding type
        try {

            out.print("new upload 1 ");
            out.print("<br> ");
            List fileItems = serFileUpload.parseRequest(request);
            Iterator iter = fileItems.iterator();
            while (iter.hasNext()) {

                out.print("new upload while");

                FileItem item = (FileItem) iter.next();

                if (item.isFormField()) {    // identifies the normal fuorm field , false when it identifies the upload field
                //simply process the form fields
                    out.print("<br>");
                   out.println(item.getFieldName()+" -->"+item.getString());
                   if(item.getFieldName().equals("sem")){
                       request.setAttribute("sem",item.getString());
                   }
                   if(item.getFieldName().equals("year")){
                       request.setAttribute("year",item.getString());
                   }

                   out.print("<br>");
                }
                else {

                    out.print("new upload else part");


                    try {
                        String fileName;
                        if(item.getName() != null )
                        {

                            fileName= FilenameUtils.getName(item.getName()); // actual name of file.

                            out.print("type: "+item.getContentType());

                            if(fileName.equals("page1")){
                                fileName="Testing Page1";
                            }

                            item.write(new File(uploadDirectory+File.separator+fileName)); // writes the file to the upload dir
                            String filePath = uploadDirectory;// this you can store in your db.

                            out.print("file path-- "+filePath);

                            request.setAttribute("fileLocation",filePath);
                            request.setAttribute("fileName",fileName);
                        }
                    } catch (Exception e1) {
                        e1.printStackTrace();
                    }
                }
            }

        } catch (FileUploadException e) {
            e.printStackTrace();
        }



        out.print("successfully uploaded");


        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/admin_login/import");

        requestDispatcher.forward(request,response);


    }


}
