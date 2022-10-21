package common;

import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class EmailTemplates {

    public static String emailContent(){

        JSONObject emailTemplate = new JSONObject();
        emailTemplate.put("subjectLine","");
        emailTemplate.put("invitation","");
        emailTemplate.put("emailContent","");
        emailTemplate.put("name","");

        List<String> emailField = new ArrayList<>();
        emailField.add("#FIRSTNAME#");
        emailField.add("#EMAIL#");
        emailField.add("#LASTNAME#");
        emailField.add("#MOBILE#");
        emailField.add("#INVITELINK#");
        System.out.println(new Random().nextInt(emailField.size()));
        return new JSONObject().toString();

    }
}
