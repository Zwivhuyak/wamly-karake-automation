package common;

import org.json.JSONArray;
import org.json.JSONObject;

public class CalculateProjects {

    public static int[] getSizeOfProjects(Object json){

        JSONArray listOfProjects = new JSONArray(json.toString());
        int count = 0, count1 = 0, count2 = 0;
        int[] array = new int[3];
        for(int i = 0; i< listOfProjects.length(); i++){
            JSONObject status = listOfProjects.getJSONObject(i);
            if(status.getString("status").equalsIgnoreCase("active")){
                count++;
            } else if(status.getString("status").equalsIgnoreCase("inactive")){
                count1++;
            } else{
                count2++;
            }
        }
        array[0] = count;
        array[1] = count1;
        array[2] = count2;

        return array;
    }

    public static int getSizeOfCandidates(Object json){

        JSONArray listOfProjects = new JSONArray(json.toString());
        int count = 0;

        for(int i = 0; i< listOfProjects.length(); i++){
            JSONObject candidate = listOfProjects.getJSONObject(i);
            String candi = candidate.get("activeCandidate").toString();
            int size = Integer.parseInt(candi);
            if(!candidate.get("activeCandidate").toString().equals("null")){
                count =  count + size;
            }
        }
        return count;
    }

    public static int getTotalInterviews(Object json){

        JSONArray listOfProjects = new JSONArray(json.toString());
        int count = 0;

        for(int i = 0; i< listOfProjects.length(); i++){
            JSONObject interview = listOfProjects.getJSONObject(i);
            String testsCompleted = interview.get("testsCompleted").toString();
            int test = Integer.parseInt(testsCompleted);
            if(!interview.get("testsCompleted").toString().equals(0)){
                count =  count + test;
            }
        }
        return count;
    }
}
