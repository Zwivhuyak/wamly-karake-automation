package common;

import org.json.JSONArray;
import org.json.JSONObject;

public class CalculateUsers {

    public static int calculateActiveUsers(Object json){

        org.json.JSONArray listOfProjects = new JSONArray(json.toString());
        int count = 0;
        for(int i = 0; i< listOfProjects.length(); i++){
            JSONObject status = listOfProjects.getJSONObject(i);
            if(status.getString("status").equalsIgnoreCase("active")){
                count++;
            }
        }
        return count;
    }
}
