package common;

public class OtpExtract {

    public  String GetDeleteOTP(String responses){
        return responses.substring(responses.indexOf("code: ")+6,responses.indexOf("code: ")+12);

    }
    public String GetLink(String responses){
        return responses.substring(responses.indexOf("request <br>\n" +
                "<a>")+16).split("</a>")[0];

    }

}

