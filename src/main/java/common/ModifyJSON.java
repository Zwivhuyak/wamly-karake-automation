package common;

import com.github.javafaker.Faker;
import com.jayway.jsonpath.JsonPath;
import org.json.JSONArray;
import org.json.JSONObject;

import java.time.LocalDateTime;
import java.util.Random;

public class ModifyJSON {

    public static String dynamicQuestions(Object json, int numberOfQuestions){

        System.out.println("************************************");
        System.out.println(json);
        System.out.println("************************************");

        JSONObject Mainjson = new JSONObject(json.toString().replace("=",":"));
        JSONArray multipleQuestion = Mainjson.getJSONArray("questionDTOS");
        for(int i =0 ; i<numberOfQuestions; i++){
            JSONObject question = new JSONObject();
            question.put("question","Question Number #"+(i+1));
            question.put("responseTime", 120);
            question.put("preparationTime", 120);
            multipleQuestion.put(question);

        }
        return Mainjson.toString();
    }

    public static String dynamicForms(Object json,int numberOfFormBuilder)
    {
        System.out.println("************************************");
        System.out.println(json);
        System.out.println("************************************");

        JSONObject Mainjson = new JSONObject(json);
        JSONArray multipleForms = Mainjson.getJSONArray("fields");

        String[][] fields=new String[][]{{"TextInput", "Candidate Name"},
                                         {"TextInput","Candidate Surname"},
                                         {"TextInput","Candidate Email"},
                                         {"TextInput","Candidate Mobile Number"},
                                         {"Dropdown","Country"}};

        for(int i=0;i<numberOfFormBuilder;i++)
        {
            JSONObject form = new JSONObject();
            form .put(fields[i][0],fields[i][1]);
            multipleForms.put(form);
        }

        return Mainjson.toString();
    }

    public static void iterator(Object json){
        System.out.println("::::::::::::::::::::::");
        JSONObject Mainjson = new JSONObject(json.toString().replace("=",":"));
        JSONArray interviewGuides = Mainjson.getJSONArray("response");

        for(int i =0; i<interviewGuides.length(); i++){
            System.out.println(Mainjson.getJSONArray("response").getJSONObject(i).getString("interviewGuideTitle"));
        }

        System.out.println("::::::::::::::::::::::");


    }

    public static String createStatus(Object json, int num){

        JSONArray statusArray = new JSONArray(json.toString());
        JSONObject MainJSON = new JSONObject();
        MainJSON.put("customStatusDTOS",statusArray);
        System.out.println(MainJSON);

        for(int i = 0; i<num; i++){

            JSONObject status = new JSONObject();
            status.put("statusName","stat"+ LocalDateTime.now().toString().substring(27));
            status.put("status",i%2==0?"ACTIVE":"INACTIVE");
            status.put("hidden", i % 2 != 0);
            status.put("organizationId",statusArray.getJSONObject(0).getString("organizationId"));

            statusArray.put(status);

        }
        System.out.println(MainJSON);
        return MainJSON.toString();
    }
}
