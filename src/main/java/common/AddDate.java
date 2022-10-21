package common;

import java.time.LocalDateTime;

public class AddDate {
    public static String addDate(){
        LocalDateTime localDateTime = LocalDateTime.now();
        return localDateTime.toString();
    }
}
