package common;

//import io.restassured.path.json.JsonPath;
import org.json.JSONArray;
import org.json.JSONObject;

public class CalculateCandidatesInProject {
    public static Object getSizeOfCandidates(Object json){

//        System.out.println("77777777777777777777777777");
//        System.out.println(json.toString().replace("=",":"));
//        System.out.println("88888888888888888888888888");

//        JSONObject Mainjson = new JSONObject(json.toString().replace("=",":"));
//        new JsonPath(json.toString().replace("=",":")).prettyPrint();
//
//        //JSONArray lists = new JSONArray(json.toString());
//
//
//
//        System.out.println("77777777777777777777777777");
//        System.out.println(Mainjson);
//        System.out.println("88888888888888888888888888");
       // int count = 0;

//        for(int i = 0; i< listOfProjects.length(); i++){
//            JSONObject candidate = listOfProjects.getJSONObject(i);
//            String candi = candidate.get("candidates").toString();
//            int size = Integer.parseInt(candi);
//            if(!candidate.get("candidates").toString().equals("null")){
//                count =  count + size;
//            }
//        }
        return json;
    }
}
