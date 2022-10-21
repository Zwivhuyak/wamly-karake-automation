package common;

import org.json.JSONArray;
import org.json.JSONObject;

public class MailsacManipulation {

    public static String getEmailId(String Subject, Object json){

        String emailId = "";

        JSONArray arrayOfEmails = new JSONArray(json.toString());
        for(int i = 0; i< arrayOfEmails.length(); i++){
            JSONObject email = arrayOfEmails.getJSONObject(i);
            if(email.getString("subject").equalsIgnoreCase(Subject)){
                emailId = email.getString("_id");

                System.out.println(")))))))))))))))))))))) "+emailId);
            }
        }
        return emailId;
    }
}
