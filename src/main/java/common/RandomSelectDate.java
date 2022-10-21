package common;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class RandomSelectDate {
    public static List generateDateCreated(Object json){

        JSONArray listOfProjects = new JSONArray(json.toString());
        List listOfDates = new ArrayList<String>();

        for(int i = 0; i<listOfProjects.length(); i++){
            String date = listOfProjects.getJSONObject(i).getString("dateCreated");
            if(!listOfDates.contains(date)){
                listOfDates.add(date);
            }

        }
        System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
        System.out.println(listOfDates);
        System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
        return listOfDates;
    }
    public static String selectDateCreated(String dates[]){
        String date = null;
        Random r=new Random();
        int randomDate=r.nextInt(dates.length);
        date = dates[randomDate];
        System.out.println("&&&&&&&&&&&&&&&&&&&&&&&&");
        System.out.println(date);
        System.out.println("&&&&&&&&&&&&&&&&&&&&&&&&");
        return date;
    }

    public static List generateLastModified(Object json){

        JSONArray listOfProjects = new JSONArray(json.toString());
        List listOfDates = new ArrayList<String>();

        for(int i = 0; i<listOfProjects.length(); i++){
            String date = listOfProjects.getJSONObject(i).getString("lastModified");
            if(!listOfDates.contains(date)){
                listOfDates.add(date);
            }

        }
        System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
        System.out.println(listOfDates);
        System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
        return listOfDates;
    }
    public static String selectLastModified(String dates[]){
        String date = null;
        Random r=new Random();
        int randomDate=r.nextInt(dates.length);
        date = dates[randomDate];
        System.out.println("&&&&&&&&&&&&&&&&&&&&&&&&");
        System.out.println(date);
        System.out.println("&&&&&&&&&&&&&&&&&&&&&&&&");
        return date;
    }

}
