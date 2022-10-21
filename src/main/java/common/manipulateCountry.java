package common;

import org.json.JSONArray;
import org.json.JSONObject;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class manipulateCountry {

    public static void candidateForm(Object json){
        org.json.JSONArray listOfCandidates = new JSONArray(json.toString());


        for(int i = 0; i< listOfCandidates.length(); i++){
           JSONObject candidatesF = listOfCandidates.getJSONObject(i);
           JSONArray fields = candidatesF.getJSONObject("candidateForm").getJSONArray("infoDTOS");

            System.out.println("+++++++++++++++++++++++++++++++++++++++++++++++++++++++");
           for(int j = 0; j < fields.length(); j++){
               JSONObject innerField = fields.getJSONObject(j);
               if (innerField.getString("fieldName").equalsIgnoreCase("country")){
                    assertEquals("South Africa",innerField.get("value"));
                   System.out.println("------------------------------------------------");
                   System.out.println(candidatesF);
                   System.out.println("************************************************");
               }
           }
        }
    }

    public static void averageRating(Object json){
        org.json.JSONArray listOfCandidates = new JSONArray(json.toString());
        System.out.println("**********************************************");
        System.out.println(listOfCandidates);
        System.out.println("***********************************************");
        for(int i = 0; i< listOfCandidates.length(); i++){
            JSONObject aveRating = listOfCandidates.getJSONObject(i);

                if(aveRating.getString("averageRating").equalsIgnoreCase("no")){
                    assertEquals("No",aveRating.get("averageRating"));
                    System.out.println("+++++++++++++++++++++++++++++++++++++++++++++++++++++++");
                    System.out.println(listOfCandidates);
                    System.out.println("+++++++++++++++++++++++++++++++++++++++++++++++++++++++");
                }
            }

        }
}
