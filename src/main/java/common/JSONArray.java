package common;

public class JSONArray {

    public static int method(Object name,String ggg){

        org.json.JSONArray organisation = new org.json.JSONArray(name.toString());


        for(int i = 0; i < new org.json.JSONArray(name.toString()).length(); i++){
           if(organisation.getJSONObject(i).getString("currentPackage").equalsIgnoreCase(ggg)){
               System.out.println("inside");
           }

        }
        return new org.json.JSONArray(name.toString()).length();
    }

}
