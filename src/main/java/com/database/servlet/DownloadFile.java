package com.database.servlet;

import com.itextpdf.io.font.FontProgram;
import com.itextpdf.io.font.FontProgramFactory;
import com.itextpdf.kernel.color.Color;
import com.itextpdf.kernel.colors.ColorConstants;
import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.kernel.pdf.colorspace.PdfColorSpace;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.border.Border;
import com.itextpdf.layout.border.SolidBorder;
import com.itextpdf.layout.element.Cell;
import com.itextpdf.layout.element.IBlockElement;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.element.Table;
import com.itextpdf.layout.property.TextAlignment;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfEncodings;
import org.w3c.dom.css.Rect;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.StyleConstants;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Calendar;

/**
 * Created by Akash on 05-04-2018.
 */
public class DownloadFile extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        final String DEST = getServletContext().getRealPath("/WEB-INF/tempfiles/tmp.pdf");
        String questionString = request.getParameter("questionString");
        String ratingString = request.getParameter("ratingString");
        String subjectTitle = request.getParameter("subjectTitle");
        String subjectCode = request.getParameter("subjectCode");
        String staffName = request.getParameter("staffName");
        String semester = request.getParameter("semester");
        String section = request.getParameter("section");
        String department = request.getParameter("department");
        String totalRating = request.getParameter("totalRating");
        String year = request.getParameter("year");

        String[] questionArray = questionString.split("%@! ");
        String[] ratingArray = ratingString.split("%@! ");

//        System.out.println(" Question Array");
//
//        for(int i =0 ; i< questionArray.length; i++) {
//            System.out.println(questionArray[i]);
//        }
//
//        System.out.println(" Rating Array");
//
//        for(int i =0 ; i< ratingArray.length; i++) {
//            System.out.println(ratingArray[i]);
//        }


        try {

            File file = new File(DEST);
            file.getParentFile().mkdirs();

            // Set Custom Font
            String relativeWebPathBold = "/WEB-INF/fonts/helveticaneue/HelveticaNeueBd.ttf";
            String absoluteDiskPathBold = getServletContext().getRealPath(relativeWebPathBold);
            final String BOLD = absoluteDiskPathBold;

            String relativeWebPathRegular = "/WEB-INF/fonts/helveticaneue/HelveticaNeueLt.ttf";
            String absoluteDiskPathRegular = getServletContext().getRealPath(relativeWebPathRegular);
            final String REGULAR = absoluteDiskPathRegular;

            FontProgram fontRegular = FontProgramFactory.createFont(REGULAR);
            FontProgram fontBold = FontProgramFactory.createFont(BOLD);


            PdfFont pdfBoldfont = PdfFontFactory.createFont(fontBold, com.itextpdf.io.font.PdfEncodings.WINANSI, true);
            PdfFont pdfRegularfont = PdfFontFactory.createFont(fontRegular, com.itextpdf.io.font.PdfEncodings.WINANSI, true);

            //Initialize PDF writer
            PdfWriter writer = new PdfWriter(DEST);

            //Initialize PDF document
            PdfDocument pdf = new PdfDocument(writer);

            // Initialize document
            Document document = new Document(pdf);


            String currentDate = new SimpleDateFormat("dd/MM/yyyy").format(Calendar.getInstance().getTime());

            // Header
            document.add(new Paragraph("R.M.D. Engineering College").setFont(pdfBoldfont).setTextAlignment(TextAlignment.CENTER).setFontSize(22));
            document.add(new Paragraph(" STUDENT FEEDBACK "+year+" - "+(Integer.parseInt(year)+1)+"  ["+currentDate+"]").setFont(pdfBoldfont).setTextAlignment(TextAlignment.CENTER).setFontSize(14));



            //Add paragraph to the document
            document.add(new Paragraph("BRANCH : "+department.toUpperCase()).setFont(pdfBoldfont).setFontSize(12));
            document.add(new Paragraph("SEMESTER / SECTION : "+semester+"/'"+section.toUpperCase()+"'").setFont(pdfBoldfont).setFontSize(12));
            document.add(new Paragraph("SUBJECT TITLE : "+subjectTitle).setFont(pdfBoldfont).setFontSize(12));
            document.add(new Paragraph("SUBJECT CODE : "+subjectCode).setFont(pdfBoldfont).setFontSize(12));
            document.add(new Paragraph("STAFF NAME : "+staffName).setFont(pdfBoldfont).setFontSize(12));

            // new lines
            document.add(new Paragraph(" "));
            document.add(new Paragraph(" "));

            Table table;
            Cell cell;



            // Table Header
            table = new Table(2);
            cell = new Cell().add(new Paragraph("Question No.").setFont(pdfBoldfont));
            cell.setTextAlignment(TextAlignment.CENTER);
            cell.setWidthPercent(90);
            table.addCell(cell);

            cell = new Cell().add(new Paragraph("Rating").setFont(pdfBoldfont));
            cell.setWidthPercent(10);
            cell.setTextAlignment(TextAlignment.CENTER);
            table.addCell(cell);
            document.add(table);


            for (int i = 0; i < questionArray.length && i < ratingArray.length; i++) {
                // Table Body
                table = new Table(2);
                cell = new Cell().add(new Paragraph((i+1) +". "+questionArray[i]));
                cell.setTextAlignment(TextAlignment.LEFT);
                cell.setWidthPercent(90);
                table.addCell(cell);

                cell = new Cell().add(new Paragraph(""+ratingArray[i]));
                cell.setTextAlignment(TextAlignment.CENTER);
                cell.setWidthPercent(10);
                table.addCell(cell);
                document.add(table);
            }

            // Table footer
            table = new Table(2);
            cell = new Cell().add(new Paragraph("TEACHING EFFECTIVENESS.").setFont(pdfBoldfont));
            cell.setTextAlignment(TextAlignment.CENTER);
            cell.setWidthPercent(90);
            table.addCell(cell);

            cell = new Cell().add(new Paragraph(""+totalRating).setFont(pdfBoldfont));
            cell.setTextAlignment(TextAlignment.CENTER);
            cell.setWidthPercent(10);
            table.addCell(cell);
            document.add(table);

            // new lines
            document.add(new Paragraph(" "));
            document.add(new Paragraph(" "));
            document.add(new Paragraph(" "));
            document.add(new Paragraph(" "));


            // HOD and Principal signature
            Paragraph p = new Paragraph();
            p.setFont(pdfBoldfont);
            p.add(String.format("%-135s", "HOD"));
            p.add("Principal");

            document.add(p);


            //Close document
            document.close();

            response.setContentType("application/pdf");

            // Make sure to show the download dialog
            response.setHeader("Content-disposition", "attachment; filename="+subjectCode+".pdf");


            // This should send the file to browser
            OutputStream out = response.getOutputStream();
            FileInputStream in = new FileInputStream(DEST);
            byte[] buffer = new byte[4096];
            int length;
            while ((length = in.read(buffer)) > 0) {
                out.write(buffer, 0, length);
            }
            in.close();
            out.flush();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
