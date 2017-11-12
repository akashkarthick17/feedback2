package com.database.servlet;

import com.list.servlet.*;
import org.openxmlformats.schemas.drawingml.x2006.main.STAdjCoordinate;

import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Akash on 03-09-2017.
 */
public class CRUDManager {

    private static DataSource dataSource;

    public static void create(int year){

        Connection connection =null;
        Statement statement = null;
        PreparedStatement preparedStatement=null;
        ResultSet resultSet = null;


       dataSource = DBConnection.ConnectDatabase();
       
       

        try {


            connection =DBConnection.database();
            String sql = "CREATE  TABLE YEAR_"+year+"(degree VARCHAR(25), branch VARCHAR(25),semester int,s_section VARCHAR(25),subject_code VARCHAR(25), staff_name VARCHAR(225),subject_name VARCHAR(225), s_year VARCHAR(25), sem_type VARCHAR(25))";
            statement = connection.createStatement();
            statement.executeUpdate(sql);

            //Insert year for odd sem
            sql = "INSERT  INTO TABLE_MAP VALUES (?,?)";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, year);
            preparedStatement.setString(2,"YEAR_"+year);

            preparedStatement.executeUpdate();




        } catch (Exception e) {


            e.printStackTrace();

        }  finally {
            try {
                if (connection != null) {
                    connection.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

    }


    public static List<Year> fetch(){

        Connection connection =null;
        Statement statement = null;
        PreparedStatement preparedStatement=null;
        ResultSet resultSet = null;

        List<Year> listYear = new ArrayList<>();


        dataSource = DBConnection.ConnectDatabase();

        try {


            connection = DBConnection.database();
            String sql = "SELECT YEAR FROM TABLE_MAP";
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sql);

            while (resultSet.next()){

                Year y = new Year();
                 y.setYear(resultSet.getInt("year"));
                 listYear.add(y);

            }




        } catch (Exception e) {


            e.printStackTrace();

        }  finally {
            try {
                if (connection != null) {
                    connection.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }


        return listYear;
    }

    public static void delete(int year){

        Connection connection =null;
        Statement statement = null;
        PreparedStatement preparedStatement=null;
        ResultSet resultSet = null;


        dataSource = DBConnection.ConnectDatabase();

        try {


            connection = DBConnection.database();
            String sql = "DROP TABLE year_"+year;
            statement = connection.createStatement();
            statement.executeUpdate(sql);

            sql = "DROP TABLE IF EXISTS fr_"+year+"_odd";
            statement = connection.createStatement();
            statement.executeUpdate(sql);

            sql = "DROP TABLE IF EXISTS fr_"+year+"_even";
            statement = connection.createStatement();
            statement.executeUpdate(sql);

            sql = "DROP TABLE IF EXISTS sr_"+year+"_odd";
            statement = connection.createStatement();
            statement.executeUpdate(sql);

            sql = "DROP TABLE IF EXISTS sr_"+year+"_even";
            statement = connection.createStatement();
            statement.executeUpdate(sql);






            //Insert year for odd sem
            sql = "DELETE  FROM TABLE_MAP WHERE YEAR="+year;
            statement = connection.createStatement();
            statement.executeUpdate(sql);






        } catch (Exception e) {


            e.printStackTrace();

        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

    }


public static void insert(List<CreateYear> createYear, String  yr){

        int year = Integer.parseInt(yr);

    Connection connection =null;
    Statement statement = null;
    PreparedStatement preparedStatement=null;
    ResultSet resultSet = null;


    dataSource = DBConnection.ConnectDatabase();

    try {


        connection = DBConnection.database();


        for(CreateYear list: createYear){

            String sql = "INSERT INTO YEAR_"+year+" VALUES (?,?,?,?,?,?,?,?,?)";
            PreparedStatement preparedStatement1 = connection.prepareStatement(sql);

            preparedStatement1.setString(1,list.getDegree());
            preparedStatement1.setString(2,list.getBranch());
            preparedStatement1.setDouble(3,list.getSemester());
            preparedStatement1.setString(4,list.getSection());
            preparedStatement1.setString(5,list.getSubjectCode());
            preparedStatement1.setString(6,list.getStaffName());
            preparedStatement1.setString(7,list.getSubjectName());
            preparedStatement1.setString(8,list.getYear());
            preparedStatement1.setString(9,list.getSemtype());

            preparedStatement1.executeUpdate();

        }





    } catch (Exception e) {


        e.printStackTrace();

    }  finally {
        try {
            if (connection != null) {
                connection.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


}

public static void publish(String pYear, String pSem)
{

    Connection connection =null;
    Statement statement = null;
    PreparedStatement preparedStatement=null;
    ResultSet resultSet = null;


    dataSource = DBConnection.ConnectDatabase();

    try {


        String sql="";
        connection =DBConnection.database();

        //truncate existing active link
        sql = "TRUNCATE TABLE active_link";
        statement = connection.createStatement();
        statement.executeUpdate(sql);


        sql = "TRUNCATE TABLE active_students";
        statement = connection.createStatement();
        statement.executeUpdate(sql);


        if(!pYear.isEmpty()  && !pSem.isEmpty()) {

            sql = "CREATE  TABLE IF NOT EXISTS fr_" + pYear + "_" + pSem + "(staff_name VARCHAR(45), subject_code VARCHAR(45), sub_name VARCHAR(25), question_no int, question LONGTEXT , rating int)";
            statement = connection.createStatement();
            statement.executeUpdate(sql);

            sql = "CREATE TABLE IF NOT EXISTS sr_" + pYear + "_" + pSem + "(staff_name VARCHAR(45), subject_code  VARCHAR(45),sub_name VARCHAR(25), question_no int, question LONGTEXT ,rating int)";
            statement = connection.createStatement();
            statement.executeUpdate(sql);





            //create new active link
            sql = "INSERT  INTO active_link(active_year, active_sem) VALUES (?,?)";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, pYear);
            preparedStatement.setString(2, pSem);

            preparedStatement.executeUpdate();


            List<FeedbackQuestion> fl = getFeedbackQuestion();
            List<SurveyQuestion> sl = getSurveyQuestion();



            // no. of feedback and survey questions

            sql = "INSERT  INTO reports_meta VALUES (?,?,?,?)";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, Integer.parseInt(pYear));
            preparedStatement.setString(2, pSem);
            preparedStatement.setInt(3, fl.size());
            preparedStatement.setInt(4, sl.size());


            preparedStatement.executeUpdate();





        }








    } catch (Exception e) {


        e.printStackTrace();

    }  finally {
        try {
            if (connection != null) {
                connection.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}

public static boolean checkActiveLink(){



    Connection connection =null;
    Statement statement = null;
    PreparedStatement preparedStatement=null;
    ResultSet resultSet = null;


    dataSource = DBConnection.ConnectDatabase();

    try {


        connection =DBConnection.database();
        String sql = "SELECT * FROM active_link LIMIT 1";
        statement = connection.createStatement();
        resultSet = statement.executeQuery(sql);


        int count = 0;

        while (resultSet.next()){
            ++count;
        }
        if(count!=0){
            return true;

        }
        else{
            return false;
        }




    } catch (Exception e) {


        e.printStackTrace();

    }  finally {
        try {
            if (connection != null) {
                connection.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    return false;
}

public static String[] getActiveYear(){

    Connection connection =null;
    Statement statement = null;
    PreparedStatement preparedStatement=null;
    ResultSet resultSet = null;


    String[] array = new String[2];
    dataSource = DBConnection.ConnectDatabase();

    try {


        connection =DBConnection.database();
        String sql = "SELECT * FROM active_link LIMIT 1";
        statement = connection.createStatement();
        resultSet = statement.executeQuery(sql);


        while(resultSet.next()){

            array[0] = resultSet.getString("active_year");
            array[1] = resultSet.getString("active_sem");
        }





    } catch (Exception e) {


        e.printStackTrace();

    }  finally {
        try {
            if (connection != null) {
                connection.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }




    return array;

}

public static List<Staff> getStaffDetails(String dept, String sem, String sec){


    Connection connection =null;
    Statement statement = null;
    PreparedStatement preparedStatement=null;
    ResultSet resultSet = null;


    List<Staff> staff = new ArrayList<>();

    String activeYear="";
    dataSource = DBConnection.ConnectDatabase();

    try {


        connection =DBConnection.database();
        String sql = "SELECT * FROM active_link LIMIT 1";
        statement = connection.createStatement();
        resultSet = statement.executeQuery(sql);


        while(resultSet.next()){

           activeYear = resultSet.getString("active_year");

        }

        sql = "SELECT * FROM year_"+activeYear+" WHERE branch='"+dept+"' AND semester = '"+sem+"' AND s_section = '"+sec+"' ";
        statement = connection.createStatement();
        resultSet = statement.executeQuery(sql);

        while(resultSet.next()){

           String staffname = resultSet.getString("staff_name");
           String subcode = resultSet.getString("subject_code");
           String subname = resultSet.getString("subject_name");

           Staff s = new Staff(staffname,subname,subcode);
           staff.add(s);

        }


    } catch (Exception e) {


        e.printStackTrace();

    }  finally {
        try {
            if (connection != null) {
                connection.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }




    return staff;


}
    public static List<Staff> getStaffList(int year ,String dept, int sem, String sec){


        Connection connection =null;
        Statement statement = null;
        PreparedStatement preparedStatement=null;
        ResultSet resultSet = null;


        List<Staff> staff = new ArrayList<>();


        dataSource = DBConnection.ConnectDatabase();

        try {

            String sql;


            connection =DBConnection.database();

            sql = "SELECT * FROM year_"+year+" WHERE branch='"+dept+"' AND semester = "+sem+" AND s_section = '"+sec+"' ";
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sql);

            while(resultSet.next()){

                String staffname = resultSet.getString("staff_name");
                String subcode = resultSet.getString("subject_code");
                String subname = resultSet.getString("subject_name");

                Staff s = new Staff(staffname,subname,subcode);
                staff.add(s);

            }


        } catch (Exception e) {


            e.printStackTrace();

        }  finally {
            try {
                if (connection != null) {
                    connection.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }




        return staff;


    }


public static List<FeedbackQuestion> getFeedbackQuestion(){


    Connection connection =null;
    Statement statement = null;
    PreparedStatement preparedStatement=null;
    ResultSet resultSet = null;


     int count=0;
     List<FeedbackQuestion> fbList = new ArrayList<>();

    dataSource = DBConnection.ConnectDatabase();

    try {


        connection =DBConnection.database();
        String sql = "SELECT * FROM feedback_questions";
        statement = connection.createStatement();
        resultSet = statement.executeQuery(sql);




        while(resultSet.next()){

            int qno = resultSet.getInt("qno");
            String question = resultSet.getString("question");

            FeedbackQuestion fb = new FeedbackQuestion(qno,question);

            fbList.add(fb);


        }



    } catch (Exception e) {


        e.printStackTrace();

    }  finally {
        try {
            if (connection != null) {
                connection.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }




    return fbList;

}
    public static List<SurveyQuestion> getSurveyQuestion(){


        Connection connection =null;
        Statement statement = null;
        PreparedStatement preparedStatement=null;
        ResultSet resultSet = null;


        int count=0;
        List<SurveyQuestion> surveyList = new ArrayList<>();

        dataSource = DBConnection.ConnectDatabase();

        try {


            connection =DBConnection.database();
            String sql = "SELECT * FROM survey_questions";
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sql);




            while(resultSet.next()){

                int qno = resultSet.getInt("qno");
                String question = resultSet.getString("question");

                SurveyQuestion survey = new SurveyQuestion(qno,question);

                surveyList.add(survey);


            }



        } catch (Exception e) {


            e.printStackTrace();

        }  finally {
            try {
                if (connection != null) {
                    connection.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }




        return surveyList;

    }

    public static  void feedbackLog(List<Integer> rating,List<FeedbackQuestion> feedbackQuestions, Staff s){


        System.out.println("feedback log");
        String staffName = s.getStaffName();
        String subCode = s.getSubjectCode();
        String subName = s.getSubjectName();

            Connection connection =null;
            Statement statement = null;
            PreparedStatement preparedStatement=null;
            ResultSet resultSet = null;

            int active_year=0;
            String active_sem="";


              dataSource = DBConnection.ConnectDatabase();

            try {


                connection =DBConnection.database();
                String sql = "SELECT * FROM active_link LIMIT 1";
                statement = connection.createStatement();
                resultSet = statement.executeQuery(sql);

                while(resultSet.next()){

                   active_year = resultSet.getInt("active_year");
                    active_sem = resultSet.getString("active_sem");
                 }



                 for(int temp =0;temp<rating.size();temp++)
                {

                    FeedbackQuestion f= feedbackQuestions.get(temp);

                    sql = "INSERT INTO  fr_" + active_year + "_" + active_sem + "  VALUES(?,?,?,?,?,?) ";
                    preparedStatement = connection.prepareStatement(sql);
                    preparedStatement.setString(1,staffName);
                    preparedStatement.setString(2,subCode);
                    preparedStatement.setString(3,subName);
                    preparedStatement.setInt(4,f.getQno());
                    preparedStatement.setString(5,f.getQuestion());
                    preparedStatement.setInt(6,rating.get(temp));

                    preparedStatement.executeUpdate();

                }


            } catch (Exception e) {


                e.printStackTrace();

            }  finally {
                try {
                    if (connection != null) {
                        connection.close();
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }







        }


    public static  void surveyLog(List<Integer> rating,List<SurveyQuestion> surveyQuestions, Staff s){


        System.out.println("survey log");
        String staffName = s.getStaffName();
        String subCode = s.getSubjectCode();
        String subName = s.getSubjectName();

        Connection connection =null;
        Statement statement = null;
        PreparedStatement preparedStatement=null;
        ResultSet resultSet = null;

        int active_year=0;
        String active_sem="";


        dataSource = DBConnection.ConnectDatabase();

        try {


            connection =DBConnection.database();
            String sql = "SELECT * FROM active_link LIMIT 1";
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sql);

            while(resultSet.next()){

                active_year = resultSet.getInt("active_year");
                active_sem = resultSet.getString("active_sem");
            }



            for(int temp =0;temp<rating.size();temp++)
            {

                SurveyQuestion f= surveyQuestions.get(temp);

                sql = "INSERT INTO  sr_" + active_year + "_" + active_sem + "  VALUES(?,?,?,?,?,?) ";
                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setString(1,staffName);
                preparedStatement.setString(2,subCode);
                preparedStatement.setString(3,subName);
                preparedStatement.setInt(4,f.getQno());
                preparedStatement.setString(5,f.getQuestion());
                preparedStatement.setInt(6,rating.get(temp));

                preparedStatement.executeUpdate();

            }


        } catch (Exception e) {


            e.printStackTrace();

        }  finally {
            try {
                if (connection != null) {
                    connection.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }







    }

    public static List<Rating> getFeedbackRating(int year, String sem, String staffName, String subCode, String subName){


        Connection connection =null;
        Statement statement = null;
        PreparedStatement preparedStatement=null;
        ResultSet resultSet = null;


        List<Rating> ratingList = new ArrayList<>();

        dataSource = DBConnection.ConnectDatabase();


        try {




            connection =DBConnection.database();
            String sql="";

            int size = getFeedbackSize(year,sem);

            for(int i=1;i<=size;i++) {

                int a_count=0,sa_count=0,n_count=0,d_count=0,sd_count=0;
                int total=0;
                double overallrating =0.0;
                String question="";


                //get Question
                sql = "SELECT question FROM fr_" + year + "_" + sem + " WHERE staff_name='"+staffName+"' AND  subject_code='" + subCode + "' AND sub_name='" + subName + "' AND question_no = "+i+" LIMIT 1";
                statement = connection.createStatement();
                resultSet = statement.executeQuery(sql);

                while(resultSet.next()){

                    question=resultSet.getString(1);
                }






                //Strongly argee
                sql = "SELECT COUNT(*) FROM fr_" + year + "_" + sem + " WHERE staff_name='" + staffName + "' AND subject_code='" + subCode + "' AND sub_name='" + subName + "' AND question_no = "+i+" and rating=5";
                statement = connection.createStatement();
                resultSet = statement.executeQuery(sql);

                while(resultSet.next()){

                    sa_count=resultSet.getInt(1);
                }

                //agree

                sql = "SELECT COUNT(*) FROM fr_" + year + "_" + sem + " WHERE staff_name='" + staffName + "' AND subject_code='" + subCode + "' AND sub_name='" + subName + "' AND question_no = "+i+" and rating=4";
                statement = connection.createStatement();
                resultSet = statement.executeQuery(sql);

                while(resultSet.next()){

                    a_count=resultSet.getInt(1);
                }


                //neutral

                sql = "SELECT COUNT(*) FROM fr_" + year + "_" + sem + " WHERE staff_name='" + staffName + "' AND subject_code='" + subCode + "' AND sub_name='" + subName + "' AND question_no = "+i+" and rating=3";
                statement = connection.createStatement();
                resultSet = statement.executeQuery(sql);

                while(resultSet.next()){

                    n_count=resultSet.getInt(1);
                }

                //disagree

                sql = "SELECT COUNT(*) FROM fr_" + year + "_" + sem + " WHERE staff_name='" + staffName + "' AND subject_code='" + subCode + "' AND sub_name='" + subName + "' AND question_no = "+i+" and rating=2";
                statement = connection.createStatement();
                resultSet = statement.executeQuery(sql);

                while(resultSet.next()){

                    d_count=resultSet.getInt(1);
                }


                //strongly disagree

                sql = "SELECT COUNT(*) FROM fr_" + year + "_" + sem + " WHERE staff_name='" + staffName + "' AND subject_code='" + subCode + "' AND sub_name='" + subName + "' AND question_no = "+i+" and rating=1";
                statement = connection.createStatement();
                resultSet = statement.executeQuery(sql);

                while(resultSet.next()){

                    sd_count=resultSet.getInt(1);
                }


                total = sa_count+a_count+n_count+d_count+sd_count;
                overallrating = (sa_count*5) + (a_count*4) +(n_count*3) +(d_count*2) +(sd_count*1);
                overallrating = overallrating / (total*5);
                overallrating = overallrating *10;

                Rating rating = new Rating(i,question,sa_count,a_count,n_count,d_count,sd_count,total,overallrating);

                ratingList.add(rating);


            }







        } catch (Exception e) {


            e.printStackTrace();

        }  finally {
            try {
                if (connection != null) {
                    connection.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }




        return ratingList;





    }

    public static List<Rating> getSurveyRating(int year, String sem, String staffName, String subCode, String subName){


        Connection connection =null;
        Statement statement = null;
        PreparedStatement preparedStatement=null;
        ResultSet resultSet = null;


        List<Rating> ratingList = new ArrayList<>();

        dataSource = DBConnection.ConnectDatabase();


        try {




            connection =DBConnection.database();
            String sql="";

            int size = getSurveySize(year,sem);
            for(int i=1;i<=size;i++) {

                int a_count=0,sa_count=0,n_count=0,d_count=0,sd_count=0;
                int total=0;
                double overallrating =0.0;
                String question="";


                //get Question
                sql = "SELECT question FROM sr_" + year + "_" + sem + " WHERE staff_name='"+staffName+"' AND  subject_code='" + subCode + "' AND sub_name='" + subName + "' AND question_no = "+i+" LIMIT 1";
                statement = connection.createStatement();
                resultSet = statement.executeQuery(sql);

                while(resultSet.next()){

                    question=resultSet.getString(1);
                }






                //Strongly argee
                sql = "SELECT COUNT(*) FROM sr_" + year + "_" + sem + " WHERE staff_name='" + staffName + "' AND subject_code='" + subCode + "' AND sub_name='" + subName + "' AND question_no = "+i+" and rating=5";
                statement = connection.createStatement();
                resultSet = statement.executeQuery(sql);

                while(resultSet.next()){

                    sa_count=resultSet.getInt(1);
                }

                //agree

                sql = "SELECT COUNT(*) FROM sr_" + year + "_" + sem + " WHERE staff_name='" + staffName + "' AND subject_code='" + subCode + "' AND sub_name='" + subName + "' AND question_no = "+i+" and rating=4";
                statement = connection.createStatement();
                resultSet = statement.executeQuery(sql);

                while(resultSet.next()){

                    a_count=resultSet.getInt(1);
                }


                //neutral

                sql = "SELECT COUNT(*) FROM sr_" + year + "_" + sem + " WHERE staff_name='" + staffName + "' AND subject_code='" + subCode + "' AND sub_name='" + subName + "' AND question_no = "+i+" and rating=3";
                statement = connection.createStatement();
                resultSet = statement.executeQuery(sql);

                while(resultSet.next()){

                    n_count=resultSet.getInt(1);
                }

                //disagree

                sql = "SELECT COUNT(*) FROM sr_" + year + "_" + sem + " WHERE staff_name='" + staffName + "' AND subject_code='" + subCode + "' AND sub_name='" + subName + "' AND question_no = "+i+" and rating=2";
                statement = connection.createStatement();
                resultSet = statement.executeQuery(sql);

                while(resultSet.next()){

                    d_count=resultSet.getInt(1);
                }


                //strongly disagree

                sql = "SELECT COUNT(*) FROM sr_" + year + "_" + sem + " WHERE staff_name='" + staffName + "' AND subject_code='" + subCode + "' AND sub_name='" + subName + "' AND question_no = "+i+" and rating=1";
                statement = connection.createStatement();
                resultSet = statement.executeQuery(sql);

                while(resultSet.next()){

                    sd_count=resultSet.getInt(1);
                }


                total = sa_count+a_count+n_count+d_count+sd_count;
                overallrating = (sa_count*5) + (a_count*4) +(n_count*3) +(d_count*2) +(sd_count*1);
                overallrating = overallrating / (total*5);
                overallrating = overallrating *10;

                Rating rating = new Rating(i,question,sa_count,a_count,n_count,d_count,sd_count,total,overallrating);

                ratingList.add(rating);


            }







        } catch (Exception e) {


            e.printStackTrace();

        }  finally {
            try {
                if (connection != null) {
                    connection.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }




        return ratingList;





    }


    public static int getFeedbackSize(int year , String sem){




        Connection connection =null;
        Statement statement = null;
        PreparedStatement preparedStatement=null;
        ResultSet resultSet = null;

        int count=0;

        dataSource = DBConnection.ConnectDatabase();

        try {


            connection =DBConnection.database();
            String sql = "SELECT feedback FROM reports_meta WHERE year="+year+" AND sem='"+sem+"'";
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sql);

            while(resultSet.next()){

               count = resultSet.getInt("feedback");
            }




        } catch (Exception e) {


            e.printStackTrace();

        }  finally {
            try {
                if (connection != null) {
                    connection.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }



        return count;



    }

    public static int getSurveySize(int year , String sem){




        Connection connection =null;
        Statement statement = null;
        PreparedStatement preparedStatement=null;
        ResultSet resultSet = null;

        int count=0;

        dataSource = DBConnection.ConnectDatabase();

        try {


            connection =DBConnection.database();
            String sql = "SELECT survey FROM reports_meta WHERE year="+year+" AND sem='"+sem+"'";
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sql);

            while(resultSet.next()){

                count = resultSet.getInt("survey");
            }





        } catch (Exception e) {


            e.printStackTrace();

        }  finally {
            try {
                if (connection != null) {
                    connection.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }



        return count;



    }

    public static void  saveSurveyQuesitions(String[] question){

        Connection connection =null;
        Statement statement = null;
        PreparedStatement preparedStatement=null;
        ResultSet resultSet = null;


        dataSource = DBConnection.ConnectDatabase();

        try {


            connection =DBConnection.database();



            for(int i=1;i<=question.length;i++) {

                String sql = "UPDATE survey_questions SET question='"+question[i-1]+"'  WHERE qno ="+i+" ";
                statement = connection.createStatement();
                statement.executeUpdate(sql);


            }



        } catch (Exception e) {


            e.printStackTrace();

        }  finally {
            try {
                if (connection != null) {
                    connection.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }


    }

    public static void createSurveyQuestions(){


        Connection connection =null;
        Statement statement = null;
        PreparedStatement preparedStatement=null;
        ResultSet resultSet = null;


        dataSource = DBConnection.ConnectDatabase();

        try {


            connection =DBConnection.database();



           int size= CRUDManager.getSurveyQuestion().size();
           ++size;


                String sql = "INSERT INTO survey_questions VALUES("+size+",'') ";
                statement = connection.createStatement();
                statement.executeUpdate(sql);






        } catch (Exception e) {


            e.printStackTrace();

        }  finally {
            try {
                if (connection != null) {
                    connection.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }




    }
    public static void deleteSurveyQuestions(int id){


        Connection connection =null;
        Statement statement = null;
        PreparedStatement preparedStatement=null;
        ResultSet resultSet = null;


        dataSource = DBConnection.ConnectDatabase();

        try {


            connection =DBConnection.database();



            int size= CRUDManager.getSurveyQuestion().size();
            ++size;


            String sql = "DELETE FROM survey_questions WHERE qno="+id+" ";
            statement = connection.createStatement();
            statement.executeUpdate(sql);






        } catch (Exception e) {


            e.printStackTrace();

        }  finally {
            try {
                if (connection != null) {
                    connection.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }




    }

    public static void  saveFeedbackQuesitions(String[] question){

        Connection connection =null;
        Statement statement = null;
        PreparedStatement preparedStatement=null;
        ResultSet resultSet = null;


        dataSource = DBConnection.ConnectDatabase();

        try {


            connection =DBConnection.database();



            for(int i=1;i<=question.length;i++) {

                String sql = "UPDATE feedback_questions SET question='"+question[i-1]+"'  WHERE qno ="+i+" ";
                statement = connection.createStatement();
                statement.executeUpdate(sql);


            }



        } catch (Exception e) {


            e.printStackTrace();

        }  finally {
            try {
                if (connection != null) {
                    connection.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }


    }

    public static void createFeedbackQuestions(){


        Connection connection =null;
        Statement statement = null;
        PreparedStatement preparedStatement=null;
        ResultSet resultSet = null;


        dataSource = DBConnection.ConnectDatabase();

        try {


            connection =DBConnection.database();



            int size= CRUDManager.getFeedbackQuestion().size();
            ++size;


            String sql = "INSERT INTO feedback_questions VALUES("+size+",'') ";
            statement = connection.createStatement();
            statement.executeUpdate(sql);






        } catch (Exception e) {


            e.printStackTrace();

        }  finally {
            try {
                if (connection != null) {
                    connection.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }




    }
    public static void deleteFeedbackQuestions(int id){


        Connection connection =null;
        Statement statement = null;
        PreparedStatement preparedStatement=null;
        ResultSet resultSet = null;


        dataSource = DBConnection.ConnectDatabase();

        try {


            connection =DBConnection.database();



            int size= CRUDManager.getFeedbackQuestion().size();
            ++size;


            String sql = "DELETE FROM feedback_questions WHERE qno="+id+" ";
            statement = connection.createStatement();
            statement.executeUpdate(sql);






        } catch (Exception e) {


            e.printStackTrace();

        }  finally {
            try {
                if (connection != null) {
                    connection.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }




    }


    public static void registerStudent(String user){

        Connection connection =null;
        Statement statement = null;
        PreparedStatement preparedStatement=null;
        ResultSet resultSet = null;


        dataSource = DBConnection.ConnectDatabase();

        try {


            connection =DBConnection.database();





            String sql = " INSERT INTO active_students (reg_no) VALUES ('"+user+"')";
            statement = connection.createStatement();
            statement.executeUpdate(sql);






        } catch (Exception e) {


            e.printStackTrace();

        }  finally {
            try {
                if (connection != null) {
                    connection.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }






    }


    public static  void UpdateRegister(String user, String branch, String sem, String sec){


        Connection connection =null;
        Statement statement = null;
        PreparedStatement preparedStatement=null;
        ResultSet resultSet = null;


        dataSource = DBConnection.ConnectDatabase();

        try {


            connection =DBConnection.database();



            int size= CRUDManager.getSurveyQuestion().size();
            ++size;


            String sql = "UPDATE active_students SET branch='"+branch+"' ,sem='"+sem+"',sec='"+sec+"' WHERE reg_no ='"+user+"' ";
            statement = connection.createStatement();
            statement.executeUpdate(sql);






        } catch (Exception e) {


            e.printStackTrace();

        }  finally {
            try {
                if (connection != null) {
                    connection.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }






    }



public static List<StudentsList> retrieveStudents(){



    Connection connection =null;
    Statement statement = null;
    PreparedStatement preparedStatement=null;
    ResultSet resultSet = null;

    List<StudentsList> student = new ArrayList<>();

    dataSource = DBConnection.ConnectDatabase();

    try {


        connection =DBConnection.database();





        String sql = "SELECT * FROM active_students";
        statement = connection.createStatement();
        resultSet = statement.executeQuery(sql);

        while (resultSet.next()){


            String reg= resultSet.getString("reg_no");
            String branch= resultSet.getString("branch");
            String sem= resultSet.getString("sem");
            String sec= resultSet.getString("sec");

            StudentsList s = new StudentsList(reg,branch,sem,sec);

            student.add(s);


        }





    } catch (Exception e) {


        e.printStackTrace();

    }  finally {
        try {
            if (connection != null) {
                connection.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    return student;




}


}
