package com.ls.servlet;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ls.common.Score;
import com.ls.common.ScoreHandle;
import com.ls.common.User;
import com.ls.common.UserHandle;
import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import sun.security.krb5.SCDynamicStoreConfig;

public class HandleExcel extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
        doPost(request, response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        ArrayList<Integer> arrayList_example = new ArrayList<Integer>();
        ArrayList<Integer> arrayList_predict = new ArrayList<Integer>();
        try {
            Workbook workbook_Example = Workbook.getWorkbook(new File("D:/code/web/analysis/web/download/c.xls"));
            Sheet sheet_Example = workbook_Example.getSheet(0);
            int rows_Example = sheet_Example.getRows();
            int columns_Example = sheet_Example.getColumns();
            for(int i=0;i<rows_Example;i++)
            {   Cell example_Cell = sheet_Example.getCell(0,i);
                String example = example_Cell.getContents();
                arrayList_example.add(Integer.parseInt(example));
            }
        } catch (BiffException e) {
            e.printStackTrace();
        }
        FileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        try {
            List items = upload.parseRequest(request);
            InputStream is = null;
            Iterator iter = items.iterator();
            while (iter.hasNext())
            {
                FileItem item = (FileItem)iter.next();
                if(!item.isFormField())
                {
                    is = item.getInputStream();
                }
            }
            assert is != null;
            Workbook workbook_Upload = Workbook.getWorkbook(is);
            Sheet sheet_Upload = workbook_Upload.getSheet(0);
            int rows_Upload = sheet_Upload.getRows();
            int columns_Upload = sheet_Upload.getColumns();
            for(int i=0;i<rows_Upload;i++)
            {
                Cell predict_Cell = sheet_Upload.getCell(0, i);
                String predict = predict_Cell.getContents();
                arrayList_predict.add(Integer.parseInt(predict));
            }

        }
        catch (BiffException | FileUploadException e)
        {
            e.printStackTrace();
        }
        assert arrayList_example.size()==arrayList_predict.size();
        Integer discrepancy = 0;
        double tp=0;
        double fp=0;
        double tn=0;
        double fn=0;
        for(int j=0;j<arrayList_example.size();j++)
        {
            discrepancy += Math.abs(arrayList_example.get(j) - arrayList_predict.get(j));
            if(arrayList_example.get(j)==arrayList_predict.get(j))
            {
                if (arrayList_example.get(j)==0)
                    tp += 1;
                else
                    tn += 1;
            }
            else
            {
                if (arrayList_example.get(j)==0)
                    fn += 1;
                else
                    fp += 1;
            }
        }
        NumberFormat nf = NumberFormat.getPercentInstance();
        nf.setMaximumFractionDigits(2);
        double accuracy = (double) (arrayList_example.size() - discrepancy) /arrayList_example.size();
        double precision = tp/(tp+fp);
        double recall = tp/(tp+fn);
        double f1 = (2*precision*recall/(precision+recall));
        System.out.println("tp "+tp);
        System.out.println("fp "+fp);
        System.out.println("tn "+tn);
        System.out.println("fn "+fn);
        System.out.println("accuracy "+accuracy);
        System.out.println("precision "+precision);
        System.out.println("recall "+recall);
        System.out.println("F1 " + f1);
        System.out.println("准确率为"+nf.format(accuracy));
        System.out.println("精确率为"+nf.format(precision));
        System.out.println("召回率为"+nf.format(recall));
        System.out.println("F1 score为"+nf.format(f1));
        request.setAttribute("accuracy", nf.format(accuracy));
        request.setAttribute("precision", nf.format(precision));
        request.setAttribute("recall", nf.format(recall));
        request.setAttribute("f1", nf.format(f1));
        HttpSession session = request.getSession();
        User user = new User();
        UserHandle userHandle = new UserHandle();
        user = userHandle.getUserByName((String) session.getAttribute("name"), (String)session.getAttribute("pwd"));
        ScoreHandle scoreHandle =  new ScoreHandle();
        Score score = new Score();
        score.setId(user.getId());
        score.setName((String) session.getAttribute("name"));
        score.setAccuracy(nf.format(accuracy));
        score.setPrecision(nf.format(precision));
        score.setRecall(nf.format(recall));
        score.setF1(nf.format(f1));
        scoreHandle.Insert(score);
        request.getRequestDispatcher("allLesson.jsp").forward(request,response);



    }
}
